import { unstable_cache } from 'next/cache'
import { attachLanguageGroup } from '@/lib/constants/languageGroups'
import { supabase } from '@/lib/supabase'

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

    const [entriesCountRes, phrasesCountRes, latestRes] = await Promise.all([
      supabase
        .from('entries')
        .select('*', { count: 'exact', head: true })
        .eq('validation_status', 'verified'),
      supabase
        .from('entries')
        .select('*', { count: 'exact', head: true })
        .eq('validation_status', 'verified')
        .ilike('part_of_speech', 'phrase'),
      supabase
        .from('entries')
        .select('id, language_id, headword, primary_definition')
        .eq('validation_status', 'verified')
        .order('created_at', { ascending: false })
        .limit(3),
    ])

    const totalEntries = entriesCountRes.count ?? 0
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
      .order('created_at', { ascending: true })
      .range(offset, offset)

    const wordOfTheDay = (wotdRows?.[0] as {
      id: string
      language_id: string
      headword: string
      primary_definition: string | null
      part_of_speech: string | null
    } | undefined) ?? null

    return { totalEntries, totalPhrases, latest, wordOfTheDay }
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
  const { totalEntries, totalPhrases, latest, wordOfTheDay } = homepageStats

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
      totalLanguages: languages.length,
      totalEntries,
      totalPhrases,
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
