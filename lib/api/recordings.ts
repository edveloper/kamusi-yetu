import { supabase } from '@/lib/supabase'
import { CONSENT_VERSION } from '@/lib/constants/consent'

const RECORDINGS_BUCKET =
  process.env.NEXT_PUBLIC_SUPABASE_RECORDINGS_BUCKET || 'recordings'

/** 3 minutes of speech is far more than any single prompt needs. */
const MAX_RECORDING_BYTES = 12 * 1024 * 1024
const MAX_DURATION_MS = 180_000

export type SpeakerProfile = {
  id: string
  user_id: string
  first_language_id: string | null
  also_speaks: string[]
  home_county: string | null
  current_county: string | null
  age_band: string | null
  gender: string | null
  speaker_type: 'native' | 'heritage' | 'learner'
}

export type ConsentRecord = {
  id: string
  consent_version: string
  allow_publication: boolean
  allow_model_training: boolean
  allow_redistribution: boolean
  allow_attribution: boolean
  granted_at: string
  revoked_at: string | null
}

export type RecordingRow = {
  id: string
  entry_id: string
  prompt_text: string
  prompt_kind: string
  duration_ms: number | null
  validation_status: string
  created_at: string
}

/* -------------------------------------------------------------------------- */
/* Consent                                                                    */
/* -------------------------------------------------------------------------- */

/**
 * The user's live consent for the current consent version, or null.
 *
 * A consent granted against an older version does not carry forward: if the
 * wording changed, they agreed to something else and must be asked again.
 */
export async function getActiveConsent(userId: string): Promise<ConsentRecord | null> {
  const { data, error } = await supabase
    .from('consents')
    .select('id, consent_version, allow_publication, allow_model_training, allow_redistribution, allow_attribution, granted_at, revoked_at')
    .eq('user_id', userId)
    .eq('consent_version', CONSENT_VERSION)
    .is('revoked_at', null)
    .order('granted_at', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (error) throw error
  return (data as ConsentRecord | null) ?? null
}

export async function grantConsent(
  userId: string,
  scopes: {
    allow_publication: boolean
    allow_model_training: boolean
    allow_redistribution: boolean
    allow_attribution: boolean
  },
  locale = 'en'
) {
  if (!scopes.allow_publication || !scopes.allow_model_training || !scopes.allow_redistribution) {
    throw new Error(
      'Recording needs all three permissions: publishing, training, and sharing under CC BY 4.0.'
    )
  }

  const { data, error } = await supabase
    .from('consents')
    .insert({
      user_id: userId,
      consent_version: CONSENT_VERSION,
      locale,
      confirmed_adult: true,
      ...scopes,
    })
    .select()
    .single()

  if (error) throw error
  return data as ConsentRecord
}

/**
 * Withdraw a consent and flag its recordings for deletion.
 * Returns how many recordings were affected.
 */
export async function withdrawConsent(consentId: string, note?: string) {
  const { data, error } = await supabase.rpc('withdraw_consent', {
    p_consent_id: consentId,
    p_note: note ?? null,
  })
  if (error) throw error
  return Number(data ?? 0)
}

/* -------------------------------------------------------------------------- */
/* Speaker profile                                                            */
/* -------------------------------------------------------------------------- */

export async function getSpeakerProfile(userId: string): Promise<SpeakerProfile | null> {
  const { data, error } = await supabase
    .from('speaker_profiles')
    .select('id, user_id, first_language_id, also_speaks, home_county, current_county, age_band, gender, speaker_type')
    .eq('user_id', userId)
    .maybeSingle()

  if (error) throw error
  return (data as SpeakerProfile | null) ?? null
}

export async function upsertSpeakerProfile(
  userId: string,
  profile: Partial<Omit<SpeakerProfile, 'id' | 'user_id'>>
) {
  const existing = await getSpeakerProfile(userId)

  if (existing) {
    const { data, error } = await supabase
      .from('speaker_profiles')
      .update({ ...profile, updated_at: new Date().toISOString() })
      .eq('id', existing.id)
      .select()
      .single()
    if (error) throw error
    return data as SpeakerProfile
  }

  const { data, error } = await supabase
    .from('speaker_profiles')
    .insert({ user_id: userId, ...profile })
    .select()
    .single()

  if (error) throw error
  return data as SpeakerProfile
}

/* -------------------------------------------------------------------------- */
/* Recordings                                                                 */
/* -------------------------------------------------------------------------- */

function extensionFor(mimeType: string) {
  if (mimeType.includes('webm')) return 'webm'
  if (mimeType.includes('ogg')) return 'ogg'
  if (mimeType.includes('mp4') || mimeType.includes('m4a')) return 'm4a'
  if (mimeType.includes('wav')) return 'wav'
  if (mimeType.includes('mpeg')) return 'mp3'
  return 'webm'
}

/**
 * Store one recording and its metadata.
 *
 * The audio goes to a PRIVATE bucket. Playback is served through short-lived
 * signed URLs generated on the server, so a withdrawn recording stops being
 * reachable rather than lingering on a public URL.
 */
export async function submitRecording(params: {
  blob: Blob
  entryId: string
  languageCode: string
  speakerId: string
  consentId: string
  promptText: string
  promptKind?: 'headword' | 'usage_example' | 'phrase' | 'free'
  durationMs?: number
  sampleRateHz?: number
  channels?: number
  captureMethod?: 'browser_recorder' | 'upload'
}) {
  const {
    blob, entryId, languageCode, speakerId, consentId, promptText,
    promptKind = 'headword', durationMs, sampleRateHz, channels,
    captureMethod = 'browser_recorder',
  } = params

  if (!blob.size) throw new Error('That recording is empty. Try again.')
  if (blob.size > MAX_RECORDING_BYTES) {
    throw new Error('That recording is too large. Keep it under about three minutes.')
  }
  if (durationMs && durationMs > MAX_DURATION_MS) {
    throw new Error('That recording is longer than three minutes.')
  }
  if (!promptText.trim()) {
    throw new Error('A recording needs to know what was said, or it cannot be used.')
  }

  const mimeType = blob.type || 'audio/webm'
  const path = `${languageCode || 'unknown'}/${entryId}/${speakerId}-${Date.now()}.${extensionFor(mimeType)}`

  const { error: uploadError } = await supabase.storage
    .from(RECORDINGS_BUCKET)
    .upload(path, blob, { contentType: mimeType, upsert: false })

  if (uploadError) throw uploadError

  const { data, error } = await supabase
    .from('recordings')
    .insert({
      entry_id: entryId,
      speaker_id: speakerId,
      consent_id: consentId,
      storage_path: path,
      mime_type: mimeType,
      byte_size: blob.size,
      duration_ms: durationMs ?? null,
      sample_rate_hz: sampleRateHz ?? null,
      channels: channels ?? null,
      prompt_text: promptText.trim(),
      prompt_kind: promptKind,
      capture_method: captureMethod,
      device_hint: typeof navigator !== 'undefined' ? navigator.userAgent.slice(0, 200) : null,
    })
    .select()
    .single()

  if (error) {
    // Do not leave an orphaned object behind if the metadata insert failed.
    await supabase.storage.from(RECORDINGS_BUCKET).remove([path])
    if (error.code === '23505') {
      throw new Error('You have already recorded this one. Thank you!')
    }
    throw error
  }

  return data as RecordingRow
}

/** This speaker's own recordings, including ones still awaiting review. */
export async function getMyRecordings(speakerId: string) {
  const { data, error } = await supabase
    .from('recordings')
    .select('id, entry_id, prompt_text, prompt_kind, duration_ms, validation_status, created_at')
    .eq('speaker_id', speakerId)
    .eq('is_withdrawn', false)
    .order('created_at', { ascending: false })

  if (error) throw error
  return (data ?? []) as RecordingRow[]
}
