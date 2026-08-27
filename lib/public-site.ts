import { unstable_cache } from 'next/cache'
import { attachLanguageGroup } from '@/lib/constants/languageGroups'
import { supabase } from '@/lib/supabase'
import { createServerSupabaseClient } from '@/lib/supabase-server'

type LanguageRow = {
  id: string
  code: string
  name: string
  native_name: string | null
  is_active: boolean
  created_at: string
}

type CountMap = Record<string, number>

const getActiveLanguagesCached = unstable_cache(
  async () => {
    const { data, error } = await supabase
      .from('languages')
      .select('id, code, name, native_name, is_active, created_at')
      .eq('is_active', true)
      .order('name')

    if (error) throw error
    return (data || []).map((language) => attachLanguageGroup(language as LanguageRow))
  },
  ['public-active-languages'],
  { revalidate: 60 }
)

// Fetches only the counts and small row sets the homepage actually needs.
// Avoids caching the full entry dataset which exceeds Next.js's 2MB cache limit.
const getHomepageStatsCached = unstable_cache(
  async () => {
    const today = new Date()
    const seed =
      today.getUTCFullYear() * 10000 + (today.getUTCMonth() + 1) * 100 + today.getUTCDate()

    // The headline counts indigenous-language entries only. English is bridge
    // infrastructure: fully searchable, but counting it inflated the one metric
    // that matters with the language that needs preserving least.
    const [headlineRes, entriesCountRes, phrasesCountRes, latestRes] = await Promise.all([
      supabase.from('corpus_headline').select('*').maybeSingle(),
      supabase
        .from('entries')
        .select('*', { count: 'exact', head: true })
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false),
      supabase
        .from('entries')
        .select('*', { count: 'exact', head: true })
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false)
        .ilike('part_of_speech', 'phrase'),
      supabase
        .from('entries')
        .select('id, language_id, headword, primary_definition')
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false)
        .order('created_at', { ascending: false })
        .limit(3),
    ])

    const headline = (headlineRes?.data ?? null) as {
      indigenous_entries: number
      public_entries_including_bridge: number
      languages: number
      awaiting_curation: number
      awaiting_orthography: number
    } | null

    const totalEntries = headline?.indigenous_entries ?? entriesCountRes.count ?? 0
    const totalPhrases = phrasesCountRes.count ?? 0
    const latest = (latestRes.data ?? []) as Array<{
      id: string
      language_id: string
      headword: string
      primary_definition: string | null
    }>

    // Word of the day: date-seeded daily rotation
    const offset = totalEntries > 0 ? seed % totalEntries : 0
    const { data: wotdRows } = await supabase
      .from('entries')
      .select('id, language_id, headword, primary_definition, part_of_speech')
      .eq('validation_status', 'verified')
      .eq('needs_orthography_review', false)
      .order('created_at', { ascending: true })
      .range(offset, offset)

    const wordOfTheDay = (wotdRows?.[0] as {
      id: string
      language_id: string
      headword: string
      primary_definition: string | null
      part_of_speech: string | null
    } | undefined) ?? null

    return { totalEntries, totalPhrases, latest, wordOfTheDay, headline }
  },
  ['public-homepage-stats'],
  { revalidate: 60 }
)

// Fetches only the two fields the explore page needs for its count maps.
// ~300KB vs ~2.2MB for the full entry rows.
const getExploreEntryMetaCached = unstable_cache(
  async () => {
    const { data } = await supabase
      .from('entries')
      .select('language_id, category')
      .eq('validation_status', 'verified')
      .eq('needs_orthography_review', false)
    return (data ?? []) as Array<{ language_id: string; category: string | null }>
  },
  ['public-explore-entry-meta'],
  { revalidate: 60 }
)

function createLanguageMap(languages: Awaited<ReturnType<typeof getActiveLanguagesCached>>) {
  return new Map(languages.map((language) => [language.id, language] as const))
}

export async function getHomepageData() {
  const [languages, homepageStats] = await Promise.all([
    getActiveLanguagesCached(),
    getHomepageStatsCached(),
  ])

  const languageMap = createLanguageMap(languages)
  const { totalEntries, totalPhrases, latest, wordOfTheDay, headline } = homepageStats

  return {
    languages,
    latest: latest.map((entry) => ({
      ...entry,
      language: languageMap.get(entry.language_id) ?? null,
    })),
    wordOfTheDay: wordOfTheDay
      ? { ...wordOfTheDay, language: languageMap.get(wordOfTheDay.language_id) ?? null }
      : null,
    stats: {
      // Bridge languages are searchable but are not what we are preserving.
      totalLanguages: headline?.languages ?? languages.length,
      totalEntries,
      totalPhrases,
      awaitingCuration: headline?.awaiting_curation ?? 0,
      awaitingOrthography: headline?.awaiting_orthography ?? 0,
    },
  }
}

export async function getExplorePageData() {
  const [languages, entryMeta] = await Promise.all([
    getActiveLanguagesCached(),
    getExploreEntryMetaCached(),
  ])

  const languageCounts: CountMap = {}
  const categoryCounts: CountMap = {}

  for (const entry of entryMeta) {
    languageCounts[entry.language_id] = (languageCounts[entry.language_id] || 0) + 1
    const category = String(entry.category || '').trim()
    if (category) categoryCounts[category] = (categoryCounts[category] || 0) + 1
  }

  return { languages, languageCounts, categoryCounts }
}

// ---------------------------------------------------------------------------
// Server-rendered entry pages (Wave 3)
//
// Until now every entry page was a client component that shipped a spinner to
// the server, so all ~6,400 entries were invisible to search engines and to
// link previews. These two functions back the server shell and the sitemap.
// ---------------------------------------------------------------------------

export type SitemapEntry = { id: string; updated_at: string | null }

/**
 * Every publicly visible entry id, for the sitemap.
 *
 * PostgREST caps a response at 1,000 rows, so this pages through the corpus
 * explicitly rather than silently returning the first page.
 */
export const getSitemapEntries = unstable_cache(
  async (): Promise<SitemapEntry[]> => {
    const pageSize = 1000
    const all: SitemapEntry[] = []

    for (let from = 0; ; from += pageSize) {
      const { data, error } = await supabase
        .from('entries')
        .select('id, updated_at')
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false)
        .order('id')
        .range(from, from + pageSize - 1)

      if (error) throw error
      const rows = (data ?? []) as SitemapEntry[]
      all.push(...rows)
      if (rows.length < pageSize) break
    }

    return all
  },
  ['public-sitemap-entries'],
  { revalidate: 86400 }
)

export type PublicEntry = {
  id: string
  headword: string
  primary_definition: string | null
  part_of_speech: string | null
  category: string | null
  pronunciation_ipa: string | null
  dialect_variant: string | null
  etymology: string | null
  audio_url: string | null
  english_translation: string | null
  swahili_translation: string | null
  trust_score: number | null
  updated_at: string | null
  source_type: string | null
  source_reference: string | null
  language: { id: string; name: string; code: string; native_name: string | null } | null
  usage_examples: Array<{ text: string; english: string | null; swahili: string | null }>
  /** Who has vouched for this entry, and in what capacity. */
  attestations: { affirmations: number; disputes: number; nativeSpeakerConfirmed: boolean }
}

/**
 * One entry, shaped for server rendering and metadata. Returns null for a
 * missing or non-public entry so the route can render a proper 404.
 */
export async function getPublicEntry(id: string): Promise<PublicEntry | null> {
  if (!id) return null

  const { data, error } = await supabase
    .from('entries')
    .select(
      `id, headword, primary_definition, part_of_speech, category, pronunciation_ipa,
       dialect_variant, etymology, audio_url, english_translation, swahili_translation,
       trust_score, updated_at, validation_status, needs_orthography_review,
       source_type, source_reference,
       language:languages(id, name, code, native_name)`
    )
    .eq('id', id)
    .maybeSingle()

  if (error || !data) return null

  const row = data as Record<string, unknown>
  if (row.validation_status !== 'verified' || row.needs_orthography_review === true) return null

  type AttestationRow = { verdict: string; user_id: string; credential_kind: string }

  const [exampleResult, attestationResult] = await Promise.all([
    supabase
      .from('entry_usage_examples')
      .select('example_text, english_translation, swahili_translation')
      .eq('entry_id', id)
      .order('created_at', { ascending: true }),
    supabase
      .from('attestations')
      .select('verdict, user_id, credential_kind')
      .eq('entry_id', id),
  ])

  const exampleRows = exampleResult.data
  const attestationRows = (attestationResult.data ?? []) as AttestationRow[]
  const affirmations = attestationRows.filter((a) => a.verdict === 'affirm')
  const attestations = {
    affirmations: affirmations.length,
    disputes: attestationRows.filter((a) => a.verdict === 'dispute').length,
    nativeSpeakerConfirmed: affirmations.some(
      (a) => a.credential_kind === 'native_speaker' || a.credential_kind === 'heritage_speaker'
    ),
  }

  const languageValue = row.language
  const language = Array.isArray(languageValue) ? languageValue[0] : languageValue

  return {
    ...(row as unknown as PublicEntry),
    language: (language as PublicEntry['language']) ?? null,
    attestations,
    usage_examples: ((exampleRows ?? []) as Array<Record<string, string | null>>)
      .map((example) => ({
        text: String(example.example_text ?? '').trim(),
        english: example.english_translation,
        swahili: example.swahili_translation,
      }))
      .filter((example) => example.text.length > 0),
  }
}

/** The other languages that share this entry's meaning, via the bridge glosses. */
export async function getEntryEquivalents(entry: PublicEntry, limit = 12) {
  const english = String(entry.english_translation ?? '').trim()
  const swahili = String(entry.swahili_translation ?? '').trim()
  if (!english && !swahili) return []

  const filters: string[] = []
  if (english) filters.push(`english_translation.ilike.${english.replace(/[%_]/g, '')}`)
  if (swahili) filters.push(`swahili_translation.ilike.${swahili.replace(/[%_]/g, '')}`)

  const { data } = await supabase
    .from('entries')
    .select('id, headword, language:languages(id, name, code)')
    .eq('validation_status', 'verified')
    .eq('needs_orthography_review', false)
    .neq('id', entry.id)
    .or(filters.join(','))
    .limit(limit)

  return ((data ?? []) as Array<Record<string, unknown>>).map((row) => {
    const lang = Array.isArray(row.language) ? row.language[0] : row.language
    return {
      id: String(row.id),
      headword: String(row.headword),
      language: (lang as { id: string; name: string; code: string } | null) ?? null,
    }
  })
}

// ---------------------------------------------------------------------------
// Recordings (Wave 4)
//
// Audio lives in a PRIVATE bucket, so playback is served through short-lived
// signed URLs generated here on the server. A withdrawn recording therefore
// stops being reachable, rather than lingering on a public URL forever — which
// is the whole point of the consent model.
// ---------------------------------------------------------------------------

const RECORDINGS_BUCKET =
  process.env.NEXT_PUBLIC_SUPABASE_RECORDINGS_BUCKET || 'recordings'

export type EntryRecording = {
  id: string
  url: string
  durationMs: number | null
  speakerType: string | null
  homeCounty: string | null
  ageBand: string | null
}

export async function getEntryRecordings(entryId: string): Promise<EntryRecording[]> {
  const admin = createServerSupabaseClient()

  const { data, error } = await admin
    .from('recordings')
    .select('id, storage_path, duration_ms, speaker:speaker_profiles(speaker_type, home_county, age_band)')
    .eq('entry_id', entryId)
    .eq('validation_status', 'verified')
    .eq('is_withdrawn', false)
    .order('created_at', { ascending: true })
    .limit(12)

  if (error || !data) return []

  const rows = data as Array<Record<string, unknown>>
  const signed = await Promise.all(
    rows.map(async (row) => {
      const path = String(row.storage_path)
      const { data: link } = await admin.storage
        .from(RECORDINGS_BUCKET)
        .createSignedUrl(path, 60 * 60)

      if (!link?.signedUrl) return null

      const speakerValue = row.speaker
      const speaker = (Array.isArray(speakerValue) ? speakerValue[0] : speakerValue) as
        | { speaker_type?: string; home_county?: string; age_band?: string }
        | null

      return {
        id: String(row.id),
        url: link.signedUrl,
        durationMs: (row.duration_ms as number | null) ?? null,
        speakerType: speaker?.speaker_type ?? null,
        homeCounty: speaker?.home_county ?? null,
        ageBand: speaker?.age_band ?? null,
      } satisfies EntryRecording
    })
  )

  return signed.filter((item): item is EntryRecording => item !== null)
}
