import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'
import type { EntryValidationStatus } from '@/lib/types/database'
import { validateEntryRules } from '@/lib/validation/entry-rules'

type ModerationAction =
  | { action: 'approve_entry'; itemId: string; updates?: Record<string, string> }
  | { action: 'reject_entry'; itemId: string }
  | { action: 'flag_entry'; itemId: string }
  | { action: 'review_suggestion'; itemId: string; suggestionAction: 'accept' | 'reject'; note?: string }
  | { action: 'apply_suggestion'; itemId: string; note?: string; updates?: Record<string, string> }
  | { action: 'approve_recording'; itemId: string }
  | { action: 'reject_recording'; itemId: string; note?: string }

type TrustScoreEntry = {
  part_of_speech: string | null
  dialect_variant: string | null
  pronunciation_ipa: string | null
  etymology: string | null
  audio_url: string | null
}

type LooseSupabaseClient = ReturnType<typeof createClient<any>>

type EntryBridgeRow = {
  language_id: string
  headword: string
  primary_definition: string
  part_of_speech: string | null
  english_translation: string | null
  swahili_translation: string | null
}

function cleanText(value: unknown) {
  const s = String(value ?? '').trim()
  return s.length > 0 ? s : null
}

function parseSuggestionDetailsPatch(details: unknown) {
  if (typeof details !== 'string' || details.trim() === '') return null
  try {
    const parsed = JSON.parse(details)
    if (parsed && typeof parsed === 'object' && parsed.patch && typeof parsed.patch === 'object') {
      return parsed.patch as Record<string, unknown>
    }
    return null
  } catch {
    return null
  }
}

async function validateBridgeAfterUpdate(
  admin: LooseSupabaseClient,
  entryId: string,
  updates: Record<string, string>
) {
  const { data: entryRow, error: entryErr } = await admin
    .from('entries')
    .select('language_id, headword, primary_definition, part_of_speech, english_translation, swahili_translation')
    .eq('id', entryId)
    .single()

  if (entryErr || !entryRow) throw new Error('Failed to validate entry bridge requirements.')
  const entry = entryRow as EntryBridgeRow

  const { data: langRow, error: langErr } = await admin
    .from('languages')
    .select('code')
    .eq('id', entry.language_id)
    .single()

  if (langErr || !langRow) throw new Error('Failed to resolve entry language for validation.')

  const code = String((langRow as { code: string | null }).code || '').toLowerCase()
  validateEntryRules({
    languageCode: code,
    headword: updates.headword ?? entry.headword,
    primaryDefinition: updates.primary_definition ?? entry.primary_definition,
    partOfSpeech: updates.part_of_speech ?? entry.part_of_speech,
    englishTranslation: updates.english_translation ?? entry.english_translation,
    swahiliTranslation: updates.swahili_translation ?? entry.swahili_translation
  })
}

async function upsertUsageExample(
  admin: LooseSupabaseClient,
  entryId: string,
  usageExample: string | undefined,
  fallbackEnglish: string | null,
  fallbackSwahili: string | null,
  register: string | null,
  userId: string
) {
  const example = cleanText(usageExample)
  if (!example) return

  const { data: existing } = await admin
    .from('entry_usage_examples')
    .select('id')
    .eq('entry_id', entryId)
    .ilike('example_text', example)
    .maybeSingle()

  if (existing?.id) return

  await admin.from('entry_usage_examples').insert({
    entry_id: entryId,
    example_text: example,
    english_translation: fallbackEnglish,
    swahili_translation: fallbackSwahili,
    register: register || 'both',
    validation_status: 'pending',
    created_by: userId
  })
}

function getSupabaseEnv() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon || !serviceRole) return null
  return { url, anon, serviceRole }
}

async function computeTrustScore(
  admin: LooseSupabaseClient,
  entryId: string,
  status: EntryValidationStatus
) {
  const base: Record<EntryValidationStatus, number> = {
    pending: 0,
    flagged: 15,
    disputed: 25,
    verified: 60
  }

  if (status !== 'verified') return base[status]

  const { data: entryRow } = await admin
    .from('entries')
    .select('part_of_speech, dialect_variant, pronunciation_ipa, etymology, audio_url')
    .eq('id', entryId)
    .single()
  const entry = (entryRow ?? null) as TrustScoreEntry | null

  const { count: usageCount } = await admin
    .from('usage_contexts')
    .select('id', { count: 'exact', head: true })
    .eq('entry_id', entryId)

  const { count: likesCount } = await admin
    .from('entry_likes')
    .select('id', { count: 'exact', head: true })
    .eq('entry_id', entryId)

  let score = base.verified
  if (entry?.part_of_speech) score += 5
  if (entry?.dialect_variant) score += 5
  if (entry?.pronunciation_ipa) score += 10
  if (entry?.etymology) score += 10
  if (entry?.audio_url) score += 10

  score += Math.min(10, (usageCount || 0) * 2)
  score += Math.min(10, Math.floor((likesCount || 0) / 5))

  return Math.min(100, score)
}

async function updateEntryStatusAdmin(
  admin: LooseSupabaseClient,
  entryId: string,
  status: EntryValidationStatus,
  validatorId: string,
  updates?: Record<string, string>
) {
  if (updates && Object.keys(updates).length > 0) {
    await validateBridgeAfterUpdate(admin, entryId, updates)

    const usageExample = updates.usage_example
    const { data: updatedEntryRow, error: updateErr } = await admin
      .from('entries')
      .update({
        ...Object.fromEntries(Object.entries(updates).filter(([key]) => key !== 'usage_example')),
        updated_at: new Date().toISOString()
      })
      .eq('id', entryId)
      .select('english_translation, swahili_translation, register')
      .single()

    if (updateErr) throw updateErr

    await upsertUsageExample(
      admin,
      entryId,
      usageExample,
      updatedEntryRow?.english_translation ?? null,
      updatedEntryRow?.swahili_translation ?? null,
      updatedEntryRow?.register ?? null,
      validatorId
    )
  }

  const trustScore = await computeTrustScore(admin, entryId, status)
  const { error: entryError } = await admin
    .from('entries')
    .update({
      validation_status: status,
      trust_score: trustScore,
      updated_at: new Date().toISOString()
    })
    .eq('id', entryId)

  if (entryError) throw entryError

  const actionMap: Record<EntryValidationStatus, string> = {
    verified: 'approve',
    flagged: 'flag',
    disputed: 'reject',
    pending: 'reset'
  }

  await admin.from('validations').insert({
    entry_id: entryId,
    validator_id: validatorId,
    action: actionMap[status]
  })

  return { entryId, status, trust_score: trustScore }
}

async function reviewSuggestionAdmin(
  admin: LooseSupabaseClient,
  suggestionId: string,
  moderatorId: string,
  action: 'accept' | 'reject',
  note?: string
) {
  const newStatus = action === 'accept' ? 'accepted' : 'rejected'
  const { data: existing, error: fetchError } = await admin
    .from('entry_suggestions')
    .select('*')
    .eq('id', suggestionId)
    .single()

  if (fetchError) throw fetchError

  const keys = new Set(Object.keys(existing || {}))
  const statusColumn = ['status', 'review_status', 'state'].find((c) => keys.has(c))
  if (!statusColumn) {
    throw new Error('Could not determine suggestion status column in entry_suggestions.')
  }

  const payload: Record<string, string | null> = {
    [statusColumn]: newStatus
  }

  const notesColumn = ['moderator_notes', 'review_notes', 'notes'].find((c) => keys.has(c))
  if (notesColumn) payload[notesColumn] = note ?? null

  const reviewedByColumn = ['reviewed_by', 'moderated_by', 'validator_id'].find((c) => keys.has(c))
  if (reviewedByColumn) payload[reviewedByColumn] = moderatorId

  const reviewedAtColumn = ['reviewed_at', 'moderated_at'].find((c) => keys.has(c))
  if (reviewedAtColumn) payload[reviewedAtColumn] = new Date().toISOString()

  const { data, error } = await admin
    .from('entry_suggestions')
    .update(payload)
    .eq('id', suggestionId)
    .select()
    .single()

  if (error) throw error
  return data
}

async function applySuggestionAdmin(
  admin: LooseSupabaseClient,
  suggestionId: string,
  moderatorId: string,
  note?: string,
  overrideUpdates?: Record<string, string>
) {
  const { data: suggestion, error: fetchErr } = await admin
    .from('entry_suggestions')
    .select('*')
    .eq('id', suggestionId)
    .single()

  if (fetchErr) throw fetchErr

  const entryId =
    suggestion?.entry_id ?? suggestion?.entry ?? suggestion?.entry_ref ?? suggestion?.entryid ?? null
  if (!entryId) throw new Error('Suggestion does not reference an entry')

  const updatableFields = [
    'headword',
    'primary_definition',
    'part_of_speech',
    'dialect_variant',
    'pronunciation_ipa',
    'etymology',
    'audio_url',
    'english_translation',
    'swahili_translation',
    'register',
    'category',
    'usage_example'
  ]

  const updates: Record<string, string> = {}
  for (const field of updatableFields) {
    if (typeof suggestion[field] === 'string' && suggestion[field].trim() !== '') {
      updates[field] = suggestion[field]
    }
  }

  // Backward-compatible patch support from details JSON payload.
  // Expected shape in details: { note: string|null, patch: { ...entry fields... } }
  const patch = parseSuggestionDetailsPatch(suggestion?.details)
  if (patch) {
    for (const field of updatableFields) {
      if (!updates[field] && typeof patch[field] === 'string' && String(patch[field]).trim() !== '') {
        updates[field] = String(patch[field]).trim()
      }
    }
  }

  if (overrideUpdates) {
    for (const field of updatableFields) {
      if (typeof overrideUpdates[field] === 'string' && String(overrideUpdates[field]).trim() !== '') {
        updates[field] = String(overrideUpdates[field]).trim()
      }
    }
  }

  if (Object.keys(updates).length === 0) {
    throw new Error('No updatable fields found on suggestion')
  }

  await validateBridgeAfterUpdate(admin, entryId, updates)

  const usageExample = updates.usage_example
  const entryUpdates = Object.fromEntries(Object.entries(updates).filter(([key]) => key !== 'usage_example'))

  const { data: updatedEntry, error: updateErr } = await admin
    .from('entries')
    .update(entryUpdates)
    .eq('id', entryId)
    .select()
    .single()

  if (updateErr) throw updateErr

  await upsertUsageExample(
    admin,
    entryId,
    usageExample,
    updatedEntry?.english_translation ?? null,
    updatedEntry?.swahili_translation ?? null,
    updatedEntry?.register ?? null,
    moderatorId
  )

  await reviewSuggestionAdmin(admin, suggestionId, moderatorId, 'accept', note || `Applied by ${moderatorId}`)
  return updatedEntry
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

    const userClient = createClient<any>(env.url, env.anon)
    const { data: authData, error: authError } = await userClient.auth.getUser(token)
    if (authError || !authData?.user) {
      return NextResponse.json({ error: 'Unauthorized.' }, { status: 401 })
    }

    const admin = createClient<any>(env.url, env.serviceRole, {
      auth: { autoRefreshToken: false, persistSession: false }
    })

    const { data: profile, error: roleErr } = await admin
      .from('user_profiles')
      .select('role')
      .eq('id', authData.user.id)
      .single()

    if (roleErr || !profile) {
      return NextResponse.json({ error: 'Forbidden.' }, { status: 403 })
    }

    const role = String(profile.role || '').toLowerCase()
    if (!['moderator', 'admin', 'guardian'].includes(role)) {
      return NextResponse.json({ error: 'Forbidden.' }, { status: 403 })
    }

    const body = (await req.json()) as ModerationAction
    if (!body || !('action' in body) || !('itemId' in body) || !body.itemId) {
      return NextResponse.json({ error: 'Invalid payload.' }, { status: 400 })
    }

    switch (body.action) {
      case 'approve_entry': {
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'verified', authData.user.id, body.updates)
        return NextResponse.json({ ok: true, result })
      }
      case 'reject_entry': {
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'disputed', authData.user.id)
        return NextResponse.json({ ok: true, result })
      }
      case 'flag_entry': {
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'flagged', authData.user.id)
        return NextResponse.json({ ok: true, result })
      }
      case 'review_suggestion': {
        const result = await reviewSuggestionAdmin(
          admin,
          body.itemId,
          authData.user.id,
          body.suggestionAction,
          body.note
        )
        return NextResponse.json({ ok: true, result })
      }
      case 'approve_recording': {
        const { data, error } = await admin
          .from('recordings')
          .update({
            validation_status: 'verified',
            reviewed_by: authData.user.id,
            reviewed_at: new Date().toISOString(),
            reject_reason: null
          })
          .eq('id', body.itemId)
          .select('id, entry_id, validation_status')
          .single()
        if (error) throw error
        return NextResponse.json({ ok: true, result: data })
      }
      case 'reject_recording': {
        const { data, error } = await admin
          .from('recordings')
          .update({
            validation_status: 'rejected',
            reviewed_by: authData.user.id,
            reviewed_at: new Date().toISOString(),
            reject_reason: body.note ?? null
          })
          .eq('id', body.itemId)
          .select('id, entry_id, validation_status')
          .single()
        if (error) throw error
        return NextResponse.json({ ok: true, result: data })
      }
      case 'apply_suggestion': {
        const result = await applySuggestionAdmin(admin, body.itemId, authData.user.id, body.note, body.updates)
        return NextResponse.json({ ok: true, result })
      }
      default:
        return NextResponse.json({ error: 'Unknown action.' }, { status: 400 })
    }
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Moderation action failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
