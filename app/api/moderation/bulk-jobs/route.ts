import { NextResponse } from 'next/server'
import { createClient, type SupabaseClient } from '@supabase/supabase-js'
import {
  clean,
  normalize,
  deriveBridgeUpdate,
  nextApplyStatus,
  nextRollbackStatus
} from '@/lib/moderation/bulk-jobs'

type BulkAction =
  | { action: 'dry_run_backfill_bridge'; languageId?: string; limit?: number }
  | { action: 'apply_job'; jobId: string }
  | { action: 'rollback_job'; jobId: string }

type EntryRow = {
  id: string
  language_id: string
  headword: string
  english_translation: string | null
  swahili_translation: string | null
}

type BridgeRow = {
  swahili_term: string | null
  english_term: string | null
  confidence: number | null
}

type JobItemRow = {
  id: string
  entry_id: string
  old_row: Record<string, unknown>
  new_row: Record<string, unknown>
  applied: boolean
}

type JobRow = { id: string; status: string; summary: Record<string, unknown> | null }
type LooseSupabaseClient = SupabaseClient

function getSupabaseEnv() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon || !serviceRole) return null
  return { url, anon, serviceRole }
}

function clampLimit(n: unknown) {
  const parsed = Number(n ?? 0)
  if (Number.isNaN(parsed) || parsed <= 0) return 1000
  return Math.min(5000, Math.max(1, Math.floor(parsed)))
}

async function ensureModerator(admin: LooseSupabaseClient, userId: string) {
  const { data: profile, error: roleErr } = await admin
    .from('user_profiles')
    .select('role')
    .eq('id', userId)
    .single()

  if (roleErr || !profile) return false
  const role = String(profile.role || '').toLowerCase()
  return ['moderator', 'admin', 'guardian'].includes(role)
}

function addBridgeCandidate(
  map: Map<string, { term: string; score: number; ambiguous: boolean }>,
  fromTerm: string | null,
  toTerm: string | null,
  score: number
) {
  const from = clean(fromTerm)
  const to = clean(toTerm)
  if (!from || !to) return

  const key = normalize(from)
  const current = map.get(key)
  if (!current) {
    map.set(key, { term: to, score, ambiguous: false })
    return
  }

  if (normalize(current.term) === normalize(to)) {
    if (score > current.score) {
      map.set(key, { term: to, score, ambiguous: current.ambiguous })
    }
    return
  }

  map.set(key, { term: current.term, score: Math.max(score, current.score), ambiguous: true })
}

async function setJobStatus(
  admin: LooseSupabaseClient,
  jobId: string,
  status: string,
  summary?: Record<string, unknown>,
  dryRun?: boolean
) {
  const payload: Record<string, unknown> = { status }
  if (summary) payload.summary = summary
  if (typeof dryRun === 'boolean') payload.dry_run = dryRun
  if (status === 'running') payload.started_at = new Date().toISOString()
  if (['completed', 'failed', 'rolled_back'].includes(status)) payload.completed_at = new Date().toISOString()

  const { error } = await admin.from('bulk_edit_jobs').update(payload).eq('id', jobId)
  if (error) throw error
}

export async function POST(req: Request) {
  try {
    const env = getSupabaseEnv()
    if (!env) {
      return NextResponse.json({ error: 'Missing Supabase environment variables.' }, { status: 500 })
    }

    const authHeader = req.headers.get('authorization')
    if (!authHeader?.startsWith('Bearer ')) {
      return NextResponse.json({ error: 'Missing bearer token.' }, { status: 401 })
    }
    const token = authHeader.replace('Bearer ', '').trim()
    if (!token) {
      return NextResponse.json({ error: 'Missing bearer token.' }, { status: 401 })
    }

    const userClient = createClient(env.url, env.anon)
    const { data: authData, error: authError } = await userClient.auth.getUser(token)
    if (authError || !authData?.user) {
      return NextResponse.json({ error: 'Unauthorized.' }, { status: 401 })
    }

    const admin = createClient(env.url, env.serviceRole, {
      auth: { autoRefreshToken: false, persistSession: false }
    })
    const isModerator = await ensureModerator(admin, authData.user.id)
    if (!isModerator) {
      return NextResponse.json({ error: 'Forbidden.' }, { status: 403 })
    }

    const body = (await req.json()) as BulkAction
    if (!body?.action) {
      return NextResponse.json({ error: 'Invalid payload.' }, { status: 400 })
    }

    if (body.action === 'dry_run_backfill_bridge') {
      const limit = clampLimit(body.limit)
      const languageFilter = clean(body.languageId)

      const { data: languagesData, error: langErr } = await admin.from('languages').select('id, code')
      if (langErr) throw langErr
      const languageCodeById = new Map<string, string>()
      for (const row of languagesData || []) {
        const id = String((row as { id: string }).id || '')
        const code = String((row as { code: string | null }).code || '').toLowerCase()
        languageCodeById.set(id, code)
      }

      const { data: bridgesData, error: bridgeErr } = await admin
        .from('bridge_lexicon')
        .select('swahili_term, english_term, confidence')
      if (bridgeErr) throw bridgeErr
      const bridges = (bridgesData || []) as BridgeRow[]

      const enToSw = new Map<string, { term: string; score: number; ambiguous: boolean }>()
      const swToEn = new Map<string, { term: string; score: number; ambiguous: boolean }>()
      for (const row of bridges) {
        addBridgeCandidate(enToSw, row.english_term, row.swahili_term, Number(row.confidence || 0))
        addBridgeCandidate(swToEn, row.swahili_term, row.english_term, Number(row.confidence || 0))
      }

      let entriesQuery = admin
        .from('entries')
        .select('id, language_id, headword, english_translation, swahili_translation')
      if (languageFilter) entriesQuery = entriesQuery.eq('language_id', languageFilter)

      const { data: entriesData, error: entriesErr } = await entriesQuery
      if (entriesErr) throw entriesErr
      const entries = (entriesData || []) as EntryRow[]

      const items: Array<{
        entry_id: string
        old_row: Record<string, unknown>
        new_row: Record<string, unknown>
      }> = []

      for (const entry of entries) {
        if (items.length >= limit) break
        const code = languageCodeById.get(entry.language_id) || ''
        const updates = deriveBridgeUpdate(entry, code, enToSw, swToEn)

        if (Object.keys(updates).length === 0) continue

        items.push({
          entry_id: entry.id,
          old_row: {
            english_translation: entry.english_translation,
            swahili_translation: entry.swahili_translation
          },
          new_row: {
            english_translation: updates.english_translation ?? entry.english_translation,
            swahili_translation: updates.swahili_translation ?? entry.swahili_translation
          }
        })
      }

      const summary = {
        scanned: entries.length,
        proposed: items.length,
        language_id: languageFilter,
        limit
      }

      const { data: jobData, error: jobErr } = await admin
        .from('bulk_edit_jobs')
        .insert({
          initiated_by: authData.user.id,
          job_type: 'backfill_bridge',
          status: 'completed',
          dry_run: true,
          source_ref: 'api/moderation/bulk-jobs dry_run_backfill_bridge',
          summary
        })
        .select('id')
        .single()
      if (jobErr) throw jobErr
      const jobId = String((jobData as { id: string }).id)

      if (items.length > 0) {
        const payload = items.map((item) => ({
          job_id: jobId,
          entry_id: item.entry_id,
          old_row: item.old_row,
          new_row: item.new_row,
          applied: false
        }))
        const { error: itemErr } = await admin.from('bulk_edit_job_items').insert(payload)
        if (itemErr) throw itemErr
      }

      return NextResponse.json({
        ok: true,
        result: {
          job_id: jobId,
          summary,
          sample: items.slice(0, 20)
        }
      })
    }

    if (body.action === 'apply_job') {
      const jobId = clean(body.jobId)
      if (!jobId) return NextResponse.json({ error: 'jobId is required.' }, { status: 400 })

      const { data: jobData, error: jobErr } = await admin
        .from('bulk_edit_jobs')
        .select('id, status, summary')
        .eq('id', jobId)
        .single()
      if (jobErr || !jobData) {
        return NextResponse.json({ error: 'Bulk job not found.' }, { status: 404 })
      }
      const job = jobData as JobRow

      await setJobStatus(admin, jobId, 'running')

      const { data: itemsData, error: itemsErr } = await admin
        .from('bulk_edit_job_items')
        .select('id, entry_id, old_row, new_row, applied')
        .eq('job_id', jobId)
        .eq('applied', false)
      if (itemsErr) throw itemsErr
      const items = (itemsData || []) as JobItemRow[]

      let applied = 0
      let failed = 0

      for (const item of items) {
        try {
          const newEnglish = clean(item.new_row?.english_translation)
          const newSwahili = clean(item.new_row?.swahili_translation)
          const { error: entryErr } = await admin
            .from('entries')
            .update({
              english_translation: newEnglish,
              swahili_translation: newSwahili,
              updated_at: new Date().toISOString()
            })
            .eq('id', item.entry_id)
          if (entryErr) throw entryErr

          const { error: itemErr } = await admin
            .from('bulk_edit_job_items')
            .update({ applied: true, applied_at: new Date().toISOString(), error: null })
            .eq('id', item.id)
          if (itemErr) throw itemErr
          applied += 1
        } catch (err) {
          failed += 1
          const message = err instanceof Error ? err.message : 'Apply failed.'
          await admin.from('bulk_edit_job_items').update({ error: message }).eq('id', item.id)
        }
      }

      const summary = {
        ...(job.summary || {}),
        apply_attempted: items.length,
        apply_success: applied,
        apply_failed: failed
      }

      await setJobStatus(admin, jobId, nextApplyStatus(failed), summary, false)

      return NextResponse.json({
        ok: true,
        result: { job_id: jobId, attempted: items.length, applied, failed }
      })
    }

    if (body.action === 'rollback_job') {
      const jobId = clean(body.jobId)
      if (!jobId) return NextResponse.json({ error: 'jobId is required.' }, { status: 400 })

      const { data: jobData, error: jobErr } = await admin
        .from('bulk_edit_jobs')
        .select('id, status, summary')
        .eq('id', jobId)
        .single()
      if (jobErr || !jobData) {
        return NextResponse.json({ error: 'Bulk job not found.' }, { status: 404 })
      }
      const job = jobData as JobRow

      await setJobStatus(admin, jobId, 'running')

      const { data: itemsData, error: itemsErr } = await admin
        .from('bulk_edit_job_items')
        .select('id, entry_id, old_row, new_row, applied')
        .eq('job_id', jobId)
        .eq('applied', true)
      if (itemsErr) throw itemsErr
      const items = (itemsData || []) as JobItemRow[]

      let rolledBack = 0
      let failed = 0

      for (const item of items) {
        try {
          const oldEnglish = clean(item.old_row?.english_translation)
          const oldSwahili = clean(item.old_row?.swahili_translation)
          const { error: entryErr } = await admin
            .from('entries')
            .update({
              english_translation: oldEnglish,
              swahili_translation: oldSwahili,
              updated_at: new Date().toISOString()
            })
            .eq('id', item.entry_id)
          if (entryErr) throw entryErr

          const { error: itemErr } = await admin
            .from('bulk_edit_job_items')
            .update({ applied: false, applied_at: null, error: null })
            .eq('id', item.id)
          if (itemErr) throw itemErr
          rolledBack += 1
        } catch (err) {
          failed += 1
          const message = err instanceof Error ? err.message : 'Rollback failed.'
          await admin.from('bulk_edit_job_items').update({ error: message }).eq('id', item.id)
        }
      }

      const summary = {
        ...(job.summary || {}),
        rollback_attempted: items.length,
        rollback_success: rolledBack,
        rollback_failed: failed
      }

      await setJobStatus(admin, jobId, nextRollbackStatus(failed), summary, false)

      return NextResponse.json({
        ok: true,
        result: { job_id: jobId, attempted: items.length, rolled_back: rolledBack, failed }
      })
    }

    return NextResponse.json({ error: 'Unknown action.' }, { status: 400 })
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Bulk job request failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
