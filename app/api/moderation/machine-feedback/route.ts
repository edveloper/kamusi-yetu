import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

// Reviewing speakers' corrections of machine translations (sql/124).
//
//   GET   the pending corrections in the languages this reviewer holds
//   POST  { id, decision: 'accept' | 'reject', text? }
//
// Accepting stores the speaker's own sentence, as the reviewer leaves it, as a
// sentence pair in source_sentences (CC BY 4.0, credited to LughaKonnect
// speakers), where it helps example suggestions, sentence memory and the
// translation test. Only the speaker's sentence is stored: the machine's
// wording is NLLB's (CC BY-NC) and never enters the dictionary's data, which
// is also why a plain "it is right" vote is counted but not stored as a pair.

const BRIDGES = new Set(['en', 'sw'])

type Feedback = {
  id: string
  user_id: string | null
  verdict: string
  better_text: string | null
  created_at: string
  machine_translation: {
    source_code: string
    target_code: string
    source_text: string
    translation: string
  } | null
}

/** The language whose speakers decide: the one that is not English or Kiswahili. */
function judgedLanguage(source: string, target: string) {
  return BRIDGES.has(target) && !BRIDGES.has(source) ? source : target
}

async function reviewer(req: Request) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const service = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon || !service) throw Object.assign(new Error('Not configured.'), { status: 500 })

  const token = req.headers.get('authorization')?.replace(/^Bearer\s+/i, '').trim()
  if (!token) throw Object.assign(new Error('Sign in first.'), { status: 401 })
  const { data: auth } = await createClient(url, anon).auth.getUser(token)
  if (!auth?.user) throw Object.assign(new Error('Sign in first.'), { status: 401 })

  const admin = createClient(url, service, { auth: { autoRefreshToken: false, persistSession: false } })
  const { data: profile } = await admin.from('user_profiles').select('role').eq('id', auth.user.id).single()
  const role = String(profile?.role ?? '').toLowerCase()
  if (!['moderator', 'admin', 'guardian'].includes(role)) throw Object.assign(new Error('Forbidden.'), { status: 403 })

  const { data: langs } = await admin.from('languages').select('id, code, name')
  const byCode = new Map((langs ?? []).map((l) => [String(l.code), l as { id: string; code: string; name: string }]))

  // Fails closed, like the main moderation route: only an explicit true counts.
  const grants = new Map<string, boolean>()
  async function holds(code: string) {
    if (!grants.has(code)) {
      const language = byCode.get(code)
      const { data, error } = language
        ? await admin.rpc('has_language_grant', { p_user: auth!.user!.id, p_language: language.id, p_level: 'approve' })
        : { data: false, error: null }
      grants.set(code, !error && data === true)
    }
    return grants.get(code)!
  }

  // TEMPORARY, as in the main moderation route: admins may review their own
  // corrections while there is a single reviewer.
  return { admin, userId: auth.user.id, exempt: role === 'admin', byCode, holds }
}

function fail(err: unknown) {
  const status = (err as { status?: number })?.status ?? 500
  return NextResponse.json({ error: err instanceof Error ? err.message : 'Failed.' }, { status })
}

export async function GET(req: Request) {
  try {
    const r = await reviewer(req)
    const { data, error } = await r.admin
      .from('machine_translation_feedback')
      .select('id, user_id, verdict, better_text, created_at, machine_translation:machine_translations(source_code, target_code, source_text, translation)')
      .eq('status', 'pending')
      .not('better_text', 'is', null)
      .order('created_at', { ascending: true })
      .limit(200)
    if (error) throw error

    const items = []
    for (const row of (data ?? []) as unknown as Feedback[]) {
      const mt = Array.isArray(row.machine_translation) ? row.machine_translation[0] : row.machine_translation
      if (!mt) continue
      const judged = judgedLanguage(mt.source_code, mt.target_code)
      if (!(await r.holds(judged))) continue
      items.push({
        id: row.id,
        own: row.user_id === r.userId,
        createdAt: row.created_at,
        from: { code: mt.source_code, name: r.byCode.get(mt.source_code)?.name ?? mt.source_code },
        to: { code: mt.target_code, name: r.byCode.get(mt.target_code)?.name ?? mt.target_code },
        sourceText: mt.source_text,
        machine: mt.translation,
        better: row.better_text,
      })
    }

    const { count: confirmations } = await r.admin
      .from('machine_translation_feedback')
      .select('id', { count: 'exact', head: true })
      .eq('verdict', 'right')
    return NextResponse.json({ items, confirmations: confirmations ?? 0 })
  } catch (err) {
    return fail(err)
  }
}

export async function POST(req: Request) {
  try {
    const r = await reviewer(req)
    const body = (await req.json().catch(() => ({}))) as { id?: string; decision?: string; text?: string }
    const decision = body.decision === 'accept' || body.decision === 'reject' ? body.decision : null
    if (!body.id || !decision) return NextResponse.json({ error: 'Invalid request.' }, { status: 400 })

    const { data: row } = await r.admin
      .from('machine_translation_feedback')
      .select('id, user_id, status, better_text, machine_translation:machine_translations(source_code, target_code, source_text)')
      .eq('id', body.id)
      .single()
    const mt = row && (Array.isArray(row.machine_translation) ? row.machine_translation[0] : row.machine_translation)
    if (!row || !mt) return NextResponse.json({ error: 'Not found.' }, { status: 404 })
    if (row.status !== 'pending') return NextResponse.json({ error: 'Already decided.' }, { status: 409 })
    if (!(await r.holds(judgedLanguage(mt.source_code, mt.target_code)))) {
      return NextResponse.json({ error: 'You do not have review rights for this language.' }, { status: 403 })
    }
    if (!r.exempt && row.user_id === r.userId) {
      return NextResponse.json({ error: 'You cannot review your own correction.' }, { status: 403 })
    }

    if (decision === 'accept') {
      const text = String(body.text ?? row.better_text ?? '').replace(/\s+/g, ' ').trim()
      if (!text || text.length > 400) return NextResponse.json({ error: 'The sentence is empty or too long.' }, { status: 400 })

      // Stored as a pair only between a language and English or Kiswahili,
      // which is how source_sentences is shaped.
      const fromBridge = BRIDGES.has(mt.source_code)
      const toBridge = BRIDGES.has(mt.target_code)
      if (fromBridge !== toBridge) {
        const nativeCode = fromBridge ? mt.target_code : mt.source_code
        const nativeText = fromBridge ? text : mt.source_text
        const bridgeCode = fromBridge ? mt.source_code : mt.target_code
        const bridgeText = fromBridge ? mt.source_text : text
        const language = r.byCode.get(nativeCode)
        if (language) {
          const { error } = await r.admin.from('source_sentences').upsert(
            {
              language_id: language.id,
              text: nativeText,
              translation_en: bridgeCode === 'en' ? bridgeText : null,
              translation_sw: bridgeCode === 'sw' ? bridgeText : null,
              source: 'LughaKonnect speakers',
              source_url: 'https://lughakonnect.co.ke/translate',
              source_origin: 'a speaker correcting a machine translation',
              source_ref: row.id,
              licence: 'CC-BY-4.0',
              kind: 'parallel',
            },
            { onConflict: 'language_id,text_key', ignoreDuplicates: true }
          )
          if (error) throw error
        }
      }
    }

    const { error } = await r.admin
      .from('machine_translation_feedback')
      .update({ status: decision === 'accept' ? 'accepted' : 'rejected' })
      .eq('id', row.id)
    if (error) throw error
    return NextResponse.json({ ok: true })
  } catch (err) {
    return fail(err)
  }
}
