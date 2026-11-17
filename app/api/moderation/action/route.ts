import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'
type EntryValidationStatus = 'pending' | 'verified' | 'flagged' | 'disputed' | 'seeded'
import { validateEntryRules } from '@/lib/validation/entry-rules'

type ModerationAction =
  | { action: 'approve_entry'; itemId: string; updates?: Record<string, string> }
  | { action: 'reject_entry'; itemId: string; note?: string }
  | { action: 'flag_entry'; itemId: string; note?: string }
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

/**
 * The only entry columns a moderator's edits may touch. Anything else in a
 * request body (validation_status, trust_score, created_by...) is dropped, so
 * status and attribution can only change through the actions themselves.
 */
const EDITABLE_ENTRY_FIELDS = [
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
] as const

function pickEditableFields(input: unknown): Record<string, string> {
  if (!input || typeof input !== 'object') return {}
  const source = input as Record<string, unknown>
  const picked: Record<string, string> = {}
  for (const field of EDITABLE_ENTRY_FIELDS) {
    const value = source[field]
    if (typeof value === 'string' && value.trim() !== '') picked[field] = value.trim()
  }
  return picked
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

/**
 * Trust now comes from who vouched for the entry, not from how many optional
 * fields were filled in. The previous version awarded 10 points for an IPA
 * string, which measured tidiness rather than truth. entry_trust_score() in
 * 114 weighs attestations by the attester's verified credential, adds a little
 * for verified recordings and provenance, and subtracts heavily for disputes.
 */
async function computeTrustScore(
  admin: LooseSupabaseClient,
  entryId: string,
  status: EntryValidationStatus
) {
  const { data, error } = await admin.rpc('entry_trust_score', { p_entry: entryId })
  if (!error && typeof data === 'number') return data

  // If the function is unavailable, fall back to a status-only floor rather
  // than to the old field-counting heuristic.
  const floor: Record<EntryValidationStatus, number> = {
    seeded: 0, pending: 10, flagged: 5, disputed: 0, verified: 40
  }
  return floor[status] ?? 0
}

/** Tell the contributor what happened to their word. */
async function notifyContributor(
  admin: LooseSupabaseClient,
  entryId: string,
  kind: 'approved' | 'needs_changes' | 'rejected',
  message: string
) {
  try {
    const { data: entry } = await admin
      .from('entries')
      .select('created_by')
      .eq('id', entryId)
      .single()

    const userId = entry?.created_by
    if (!userId) return   // seeded rows have no contributor to notify

    await admin.from('contributor_notices').insert({
      user_id: userId,
      entry_id: entryId,
      kind,
      message
    })
  } catch {
    // A failed notification must never fail the moderation action itself.
  }
}

async function updateEntryStatusAdmin(
  admin: LooseSupabaseClient,
  entryId: string,
  status: EntryValidationStatus,
  validatorId: string,
  rawUpdates?: Record<string, string>
) {
  const updates = pickEditableFields(rawUpdates)
  if (Object.keys(updates).length > 0) {
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
    pending: 'reset',
    seeded: 'reset'
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

  const updatableFields: readonly string[] = EDITABLE_ENTRY_FIELDS

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

    /**
     * Authority is per language. A global moderator role gave one person
     * approval rights over all 37 languages at once, which will not survive
     * contact with academic collaborators - a Luo linguist has no standing on
     * Kipsigis. 114 seeds grants from the old flat roles so nobody loses
     * access today, but from here on grants are issued per language.
     */
    const moderatorId = authData.user.id

    // TEMPORARY: admins may review their own work while LughaKonnect has a
    // single reviewer. Remove this exemption once a second reviewer exists,
    // so that "checked by a reviewer" always means someone other than the
    // contributor. Everyone else is already held to the rule.
    const exemptFromSelfReview = role === 'admin'

    type Level = 'review' | 'approve'

    // Fails closed: anything other than an explicit true (an error, a missing
    // function, a null) is treated as no authority. The previous check only
    // refused on an explicit false, so a failed lookup let the action through.
    async function assertGrant(languageId: string, level: Level) {
      const { data: allowed, error } = await admin.rpc('has_language_grant', {
        p_user: moderatorId,
        p_language: languageId,
        p_level: level
      })
      if (error || allowed !== true) {
        throw new Error('You do not have review rights for this language.')
      }
    }

    async function assertLanguageAuthority(entryId: string, level: Level) {
      const { data: entry } = await admin
        .from('entries')
        .select('language_id, created_by')
        .eq('id', entryId)
        .single()

      if (!entry) throw new Error('Entry not found.')

      if (!exemptFromSelfReview && entry.created_by && entry.created_by === moderatorId) {
        throw new Error('You cannot review an entry you contributed yourself.')
      }

      await assertGrant(entry.language_id, level)
    }

    async function assertSuggestionAuthority(suggestionId: string, level: Level) {
      const { data: suggestion } = await admin
        .from('entry_suggestions')
        .select('entry_id, suggested_by')
        .eq('id', suggestionId)
        .single()

      if (!suggestion?.entry_id) throw new Error('Suggestion not found.')
      if (!exemptFromSelfReview && suggestion.suggested_by === moderatorId) {
        throw new Error('You cannot review a change you suggested yourself.')
      }

      const { data: entry } = await admin
        .from('entries')
        .select('language_id')
        .eq('id', suggestion.entry_id)
        .single()
      if (!entry) throw new Error('Entry not found.')

      await assertGrant(entry.language_id, level)
    }

    async function assertRecordingAuthority(recordingId: string) {
      const { data: recording } = await admin
        .from('recordings')
        .select('entry_id, speaker:speaker_profiles(user_id)')
        .eq('id', recordingId)
        .single()

      if (!recording?.entry_id) throw new Error('Recording not found.')

      const speakerValue = recording.speaker as { user_id?: string } | Array<{ user_id?: string }> | null
      const speaker = Array.isArray(speakerValue) ? speakerValue[0] : speakerValue
      if (!exemptFromSelfReview && speaker?.user_id === moderatorId) {
        throw new Error('You cannot review your own recording.')
      }

      const { data: entry } = await admin
        .from('entries')
        .select('language_id')
        .eq('id', recording.entry_id)
        .single()
      if (!entry) throw new Error('Entry not found.')

      await assertGrant(entry.language_id, 'approve')
    }

    const body = (await req.json()) as ModerationAction
    if (!body || !('action' in body) || !('itemId' in body) || !body.itemId) {
      return NextResponse.json({ error: 'Invalid payload.' }, { status: 400 })
    }

    switch (body.action) {
      case 'approve_entry': {
        await assertLanguageAuthority(body.itemId, 'approve')
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'verified', authData.user.id, body.updates)
        await notifyContributor(
          admin,
          body.itemId,
          'approved',
          'Your entry has been approved and is now public. Asante sana.'
        )
        return NextResponse.json({ ok: true, result })
      }
      case 'reject_entry': {
        await assertLanguageAuthority(body.itemId, 'approve')
        const reason = String(body.note || '').trim()
        if (!reason) {
          return NextResponse.json(
            { error: 'A rejection needs a reason. The contributor will be shown it.' },
            { status: 400 }
          )
        }
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'disputed', authData.user.id)
        await admin
          .from('entries')
          .update({ review_note: reason, reviewed_by: authData.user.id, reviewed_at: new Date().toISOString() })
          .eq('id', body.itemId)
        await notifyContributor(admin, body.itemId, 'rejected', reason)
        return NextResponse.json({ ok: true, result })
      }
      case 'flag_entry': {
        await assertLanguageAuthority(body.itemId, 'review')
        const reason = String(body.note || '').trim()
        const result = await updateEntryStatusAdmin(admin, body.itemId, 'flagged', authData.user.id)
        if (reason) {
          await admin
            .from('entries')
            .update({ review_note: reason, reviewed_by: authData.user.id, reviewed_at: new Date().toISOString() })
            .eq('id', body.itemId)
          await notifyContributor(admin, body.itemId, 'needs_changes', reason)
        }
        return NextResponse.json({ ok: true, result })
      }
      case 'review_suggestion': {
        await assertSuggestionAuthority(body.itemId, 'review')
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
        await assertRecordingAuthority(body.itemId)
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
        await assertRecordingAuthority(body.itemId)
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
        await assertSuggestionAuthority(body.itemId, 'approve')
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
