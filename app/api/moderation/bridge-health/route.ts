import { NextResponse } from 'next/server'
import { createClient, type SupabaseClient } from '@supabase/supabase-js'

type LooseSupabaseClient = SupabaseClient

function clean(v: string | null | undefined) {
  return String(v || '').trim()
}

function getSupabaseEnv() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon || !serviceRole) return null
  return { url, anon, serviceRole }
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

export async function GET(req: Request) {
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

    const rows: Array<{
      id: string | null
      language_id: string | null
      part_of_speech: string | null
      english_translation: string | null
      swahili_translation: string | null
      language?: { name?: string | null; code?: string | null } | Array<{ name?: string | null; code?: string | null }> | null
    }> = []

    const pageSize = 1000
    let from = 0

    while (true) {
      const to = from + pageSize - 1
      const { data: chunk, error } = await admin
        .from('entries')
        .select(`
          id,
          language_id,
          part_of_speech,
          english_translation,
          swahili_translation,
          language:languages(name, code)
        `)
        .range(from, to)

      if (error) throw error
      if (!chunk || chunk.length === 0) break

      rows.push(...(chunk as typeof rows))
      if (chunk.length < pageSize) break
      from += pageSize
    }

    const exampleEntryIds = new Set<string>()
    const legacyExampleEntryIds = new Set<string>()
    from = 0

    while (true) {
      const to = from + pageSize - 1
      const { data: chunk, error } = await admin
        .from('entry_usage_examples')
        .select('entry_id')
        .range(from, to)

      if (error) throw error
      if (!chunk || chunk.length === 0) break

      for (const row of chunk as Array<{ entry_id: string | null }>) {
        const entryId = String(row.entry_id || '')
        if (entryId) exampleEntryIds.add(entryId)
      }

      if (chunk.length < pageSize) break
      from += pageSize
    }

    from = 0
    while (true) {
      const to = from + pageSize - 1
      const { data: chunk, error } = await admin
        .from('usage_contexts')
        .select('entry_id')
        .range(from, to)

      if (error) break
      if (!chunk || chunk.length === 0) break

      for (const row of chunk as Array<{ entry_id: string | null }>) {
        const entryId = String(row.entry_id || '')
        if (entryId) legacyExampleEntryIds.add(entryId)
      }

      if (chunk.length < pageSize) break
      from += pageSize
    }

    const byLanguage = new Map<string, {
      language_id: string
      language_name: string
      language_code: string
      total: number
      with_bridge: number
      missing_both: number
      english_without_swahili: number
      swahili_without_english: number
      phrase_total: number
      phrase_with_examples: number
      phrase_missing_examples: number
    }>()

    let total = 0
    let withBridge = 0
    let missingBoth = 0
    let englishWithoutSwahili = 0
    let swahiliWithoutEnglish = 0
    let phraseTotal = 0
    let phraseWithExamples = 0
    let phraseMissingExamples = 0

    for (const row of rows || []) {
      const entryId = String(row.id || '')
      const languageId = String(row.language_id || '')
      const rawLanguage = row.language
      const languageInfo = Array.isArray(rawLanguage) ? rawLanguage[0] : rawLanguage
      const languageName = String(languageInfo?.name || 'Unknown')
      const languageCode = String(languageInfo?.code || '').toLowerCase()
      const isPhrase = String(row.part_of_speech || '').toLowerCase() === 'phrase'
      const en = clean(row.english_translation)
      const sw = clean(row.swahili_translation)
      const hasExamples = !!entryId && (exampleEntryIds.has(entryId) || legacyExampleEntryIds.has(entryId))

      const hasBridge = !!(en || sw)
      const missingBothRow = !en && !sw
      const enMissingSwRow = languageCode === 'en' && !sw
      const swMissingEnRow = languageCode === 'sw' && !en

      total += 1
      if (hasBridge) withBridge += 1
      if (missingBothRow) missingBoth += 1
      if (enMissingSwRow) englishWithoutSwahili += 1
      if (swMissingEnRow) swahiliWithoutEnglish += 1
      if (isPhrase) phraseTotal += 1
      if (isPhrase && hasExamples) phraseWithExamples += 1
      if (isPhrase && !hasExamples) phraseMissingExamples += 1

      const existing = byLanguage.get(languageId) || {
        language_id: languageId,
        language_name: languageName,
        language_code: languageCode,
        total: 0,
        with_bridge: 0,
        missing_both: 0,
        english_without_swahili: 0,
        swahili_without_english: 0,
        phrase_total: 0,
        phrase_with_examples: 0,
        phrase_missing_examples: 0
      }

      existing.total += 1
      if (hasBridge) existing.with_bridge += 1
      if (missingBothRow) existing.missing_both += 1
      if (enMissingSwRow) existing.english_without_swahili += 1
      if (swMissingEnRow) existing.swahili_without_english += 1
      if (isPhrase) existing.phrase_total += 1
      if (isPhrase && hasExamples) existing.phrase_with_examples += 1
      if (isPhrase && !hasExamples) existing.phrase_missing_examples += 1

      byLanguage.set(languageId, existing)
    }

    const list = Array.from(byLanguage.values()).sort((a, b) => {
      const aRisk = a.missing_both + a.english_without_swahili + a.swahili_without_english
      const bRisk = b.missing_both + b.english_without_swahili + b.swahili_without_english
      return bRisk - aRisk || b.total - a.total
    })

    return NextResponse.json({
      ok: true,
      summary: {
        total,
        with_bridge: withBridge,
        missing_both: missingBoth,
        english_without_swahili: englishWithoutSwahili,
        swahili_without_english: swahiliWithoutEnglish,
        phrase_total: phraseTotal,
        phrase_with_examples: phraseWithExamples,
        phrase_missing_examples: phraseMissingExamples
      },
      by_language: list
    })
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Bridge health request failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
