import { supabase } from '@/lib/supabase'

type ModerationPayload =
  | { action: 'approve_entry'; itemId: string; updates?: Record<string, string> }
  | { action: 'reject_entry'; itemId: string; note: string }
  | { action: 'flag_entry'; itemId: string; note?: string }
  | { action: 'review_suggestion'; itemId: string; suggestionAction: 'accept' | 'reject'; note?: string }
  | { action: 'apply_suggestion'; itemId: string; note?: string; updates?: Record<string, string> }
  | { action: 'approve_recording'; itemId: string }
  | { action: 'reject_recording'; itemId: string; note?: string }

export async function runModerationAction(payload: ModerationPayload) {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to perform moderation actions.')

  const res = await fetch('/api/moderation/action', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Moderation request failed.')
  }

  return json
}

export type BridgeHealthResponse = {
  summary: {
    total: number
    with_bridge: number
    missing_both: number
    english_without_swahili: number
    swahili_without_english: number
    phrase_total: number
    phrase_with_examples: number
    phrase_missing_examples: number
  }
  by_language: Array<{
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
  }>
}

export async function getBridgeHealth() {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to view bridge health.')

  const res = await fetch('/api/moderation/bridge-health', {
    method: 'GET',
    headers: {
      Authorization: `Bearer ${token}`
    }
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Bridge health request failed.')
  }
  return json as { ok: true } & BridgeHealthResponse
}

type BulkJobPayload =
  | { action: 'dry_run_backfill_bridge'; languageId?: string; limit?: number }
  | { action: 'apply_job'; jobId: string }
  | { action: 'rollback_job'; jobId: string }

export async function runBulkJobAction(payload: BulkJobPayload) {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to perform bulk actions.')

  const res = await fetch('/api/moderation/bulk-jobs', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Bulk action request failed.')
  }
  return json
}

/* -------------------------------------------------------------------------- */
/* Queues                                                                     */
/* -------------------------------------------------------------------------- */

export type PendingRecording = {
  id: string
  entry_id: string
  prompt_text: string
  prompt_kind: string
  duration_ms: number | null
  created_at: string
  storage_path: string
  entry: { headword: string; language: { name: string; code: string } | null } | null
  speaker: { speaker_type: string; home_county: string | null; age_band: string | null } | null
}

/**
 * Recordings waiting on a reviewer.
 *
 * Nothing surfaced these before, so every recording submitted would have sat at
 * 'pending' forever and never appeared on an entry page.
 */
export async function getPendingRecordings(limit = 40) {
  const { data, error } = await supabase
    .from('recordings')
    .select(
      `id, entry_id, prompt_text, prompt_kind, duration_ms, created_at, storage_path,
       entry:entries(headword, language:languages(name, code)),
       speaker:speaker_profiles(speaker_type, home_county, age_band)`
    )
    .eq('validation_status', 'pending')
    .eq('is_withdrawn', false)
    .order('created_at', { ascending: true })
    .limit(limit)

  if (error) throw error

  return ((data ?? []) as Array<Record<string, unknown>>).map((row) => {
    const entry = Array.isArray(row.entry) ? row.entry[0] : row.entry
    const speaker = Array.isArray(row.speaker) ? row.speaker[0] : row.speaker
    const language = entry
      ? Array.isArray((entry as Record<string, unknown>).language)
        ? ((entry as Record<string, unknown>).language as unknown[])[0]
        : (entry as Record<string, unknown>).language
      : null
    return {
      ...(row as unknown as PendingRecording),
      entry: entry
        ? { headword: String((entry as Record<string, unknown>).headword ?? ''), language: (language as PendingRecording['entry'])?.language ?? (language as never) }
        : null,
      speaker: (speaker as PendingRecording['speaker']) ?? null,
    } as PendingRecording
  })
}

export type OrthographyItem = {
  id: string
  headword: string
  primary_definition: string | null
  english_translation: string | null
  swahili_translation: string | null
  language: { id: string; name: string; code: string } | null
}

/**
 * The quarantined spellings. 358 entries whose orthography was destroyed by an
 * old import, held back until a speaker of that language confirms the correct
 * form. This is the queue where a first-language speaker outranks everyone.
 */
export async function getOrthographyQueue(languageId?: string, limit = 40) {
  let query = supabase
    .from('entries')
    .select('id, headword, primary_definition, english_translation, swahili_translation, language:languages(id, name, code)')
    .eq('needs_orthography_review', true)
    .order('headword')
    .limit(limit)

  if (languageId && languageId !== 'all') query = query.eq('language_id', languageId)

  const { data, error } = await query
  if (error) throw error

  return ((data ?? []) as Array<Record<string, unknown>>).map((row) => {
    const language = Array.isArray(row.language) ? row.language[0] : row.language
    return { ...(row as unknown as OrthographyItem), language: (language as OrthographyItem['language']) ?? null }
  })
}

/** Save a corrected spelling and release the entry from quarantine. */
export async function repairOrthography(entryId: string, headword: string) {
  const clean = headword.trim()
  if (!clean) throw new Error('Enter the corrected spelling.')
  if (/[?�]/.test(clean)) {
    throw new Error('That still contains a damaged character. Type the word as it should be written.')
  }

  const { error } = await supabase
    .from('entries')
    .update({ headword: clean, needs_orthography_review: false, updated_at: new Date().toISOString() })
    .eq('id', entryId)

  if (error) throw error
}
