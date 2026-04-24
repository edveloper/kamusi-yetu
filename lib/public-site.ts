import { unstable_cache } from 'next/cache'
import { attachLanguageGroup } from '@/lib/constants/languageGroups'
import {
  computeLanguageMaturity,
  getLanguageMaturityDefinition,
  type LanguageMaturity,
} from '@/lib/constants/languageMaturity'
import { createServerSupabaseClient } from '@/lib/supabase-server'

type LanguageRow = {
  id: string
  code: string | null
  name: string
  native_name?: string | null
}

type EntryRow = {
  id: string
  language_id: string
  headword: string
  primary_definition: string | null
  category: string | null
  part_of_speech: string | null
  english_translation: string | null
  swahili_translation: string | null
  created_at: string
}

type CountMap = Record<string, number>

type LanguageMetric = {
  id: string
  code: string
  name: string
  native_name?: string | null
  totalEntries: number
  missingBridge: number
  bridgeCoveragePct: number
  phraseEntries: number
  phraseMissingExamples: number
  maturity: LanguageMaturity
}

const ENTRY_PAGE_SIZE = 1000

async function fetchAllVerifiedEntries() {
  const supabase = createServerSupabaseClient()
  const allRows: EntryRow[] = []
  let from = 0

  while (true) {
    const to = from + ENTRY_PAGE_SIZE - 1
    const { data, error } = await supabase
      .from('entries')
      .select('id, language_id, headword, primary_definition, category, part_of_speech, english_translation, swahili_translation, created_at')
      .eq('validation_status', 'verified')
      .range(from, to)

    if (error) throw error
    if (!data || data.length === 0) break

    allRows.push(...(data as EntryRow[]))
    if (data.length < ENTRY_PAGE_SIZE) break
    from += ENTRY_PAGE_SIZE
  }

  return allRows
}

const getActiveLanguagesCached = unstable_cache(
  async () => {
    const supabase = createServerSupabaseClient()
    const { data, error } = await supabase
      .from('languages')
      .select('id, code, name, native_name')
      .eq('is_active', true)
      .order('name')

    if (error) throw error
    return (data || []).map((language) => attachLanguageGroup(language as LanguageRow))
  },
  ['public-active-languages'],
  { revalidate: 900 }
)

const getVerifiedEntriesCached = unstable_cache(
  async () => fetchAllVerifiedEntries(),
  ['public-verified-entries'],
  { revalidate: 900 }
)

const getUsageExampleEntryIdsCached = unstable_cache(
  async () => {
    const supabase = createServerSupabaseClient()
    const ids = new Set<string>()

    try {
      const { data } = await supabase.from('entry_usage_examples').select('entry_id')
      for (const row of data || []) {
        const id = String((row as { entry_id?: string | null }).entry_id || '')
        if (id) ids.add(id)
      }
    } catch {
      // Ignore missing table or transient read failures on public metrics.
    }

    try {
      const { data } = await supabase.from('usage_contexts').select('entry_id')
      for (const row of data || []) {
        const id = String((row as { entry_id?: string | null }).entry_id || '')
        if (id) ids.add(id)
      }
    } catch {
      // Ignore missing table or transient read failures on public metrics.
    }

    return Array.from(ids)
  },
  ['public-usage-example-entry-ids'],
  { revalidate: 900 }
)

const getEntryLikesCountCached = unstable_cache(
  async () => {
    const supabase = createServerSupabaseClient()
    const counts: CountMap = {}

    try {
      const { data } = await supabase.from('entry_likes').select('entry_id')
      for (const row of data || []) {
        const id = String((row as { entry_id?: string | null }).entry_id || '')
        if (id) counts[id] = (counts[id] || 0) + 1
      }
    } catch {
      return {}
    }

    return counts
  },
  ['public-entry-likes-count'],
  { revalidate: 900 }
)

const getSavedWordsCountCached = unstable_cache(
  async () => {
    const supabase = createServerSupabaseClient()
    const counts: CountMap = {}

    try {
      const { data } = await supabase.from('saved_words').select('entry_id')
      for (const row of data || []) {
        const id = String((row as { entry_id?: string | null }).entry_id || '')
        if (id) counts[id] = (counts[id] || 0) + 1
      }
    } catch {
      return {}
    }

    return counts
  },
  ['public-saved-words-count'],
  { revalidate: 900 }
)

function createLanguageMap(languages: Awaited<ReturnType<typeof getActiveLanguagesCached>>) {
  return new Map(languages.map((language) => [language.id, language] as const))
}

function isoDateLabel(value: string) {
  return new Intl.DateTimeFormat('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
  }).format(new Date(value))
}

export async function getHomepageData() {
  const [languages, entries] = await Promise.all([
    getActiveLanguagesCached(),
    getVerifiedEntriesCached(),
  ])

  const languageMap = createLanguageMap(languages)
  const sortedByCreated = [...entries].sort(
    (a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  )
  const latest = sortedByCreated.slice(0, 3).map((entry) => ({
    ...entry,
    language: languageMap.get(entry.language_id) || null,
  }))

  const wordOfTheDay =
    entries.length > 0
      ? (() => {
          const today = new Date()
          const seed = today.getUTCFullYear() * 1000 + today.getUTCMonth() * 100 + today.getUTCDate()
          const entry = entries[seed % entries.length]
          return {
            ...entry,
            language: languageMap.get(entry.language_id) || null,
          }
        })()
      : null

  return {
    languages,
    latest,
    wordOfTheDay,
  }
}

export async function getExplorePageData() {
  const [languages, entries] = await Promise.all([
    getActiveLanguagesCached(),
    getVerifiedEntriesCached(),
  ])

  const languageCounts: CountMap = {}
  const categoryCounts: CountMap = {}

  for (const entry of entries) {
    languageCounts[entry.language_id] = (languageCounts[entry.language_id] || 0) + 1
    const category = String(entry.category || '').trim()
    if (category) categoryCounts[category] = (categoryCounts[category] || 0) + 1
  }

  return {
    languages,
    languageCounts,
    categoryCounts,
  }
}

function buildLanguageMetrics(
  languages: Awaited<ReturnType<typeof getActiveLanguagesCached>>,
  entries: EntryRow[],
  exampleEntryIds: Set<string>
) {
  const metrics: Record<string, LanguageMetric> = {}

  for (const language of languages) {
    metrics[language.id] = {
      id: language.id,
      code: String(language.code || ''),
      name: language.name,
      native_name: language.native_name,
      totalEntries: 0,
      missingBridge: 0,
      bridgeCoveragePct: 100,
      phraseEntries: 0,
      phraseMissingExamples: 0,
      maturity: 'not_yet_covered',
    }
  }

  for (const entry of entries) {
    const metric = metrics[entry.language_id]
    if (!metric) continue

    metric.totalEntries += 1

    const english = String(entry.english_translation || '').trim()
    const swahili = String(entry.swahili_translation || '').trim()
    const isPhrase = String(entry.part_of_speech || '').toLowerCase() === 'phrase'

    if (!english && !swahili) {
      metric.missingBridge += 1
    }

    if (isPhrase) {
      metric.phraseEntries += 1
      if (!exampleEntryIds.has(entry.id)) {
        metric.phraseMissingExamples += 1
      }
    }
  }

  const list = Object.values(metrics)
  for (const metric of list) {
    metric.bridgeCoveragePct =
      metric.totalEntries > 0
        ? Math.round(((metric.totalEntries - metric.missingBridge) / metric.totalEntries) * 100)
        : 100
    metric.maturity = computeLanguageMaturity({
      totalEntries: metric.totalEntries,
      bridgeCoveragePct: metric.bridgeCoveragePct,
      phraseEntries: metric.phraseEntries,
      phraseMissingExamples: metric.phraseMissingExamples,
    })
  }

  return list
}

export async function getTrendingPageData() {
  const [languages, entries, exampleEntryIdsArray, likesByEntry, savesByEntry] = await Promise.all([
    getActiveLanguagesCached(),
    getVerifiedEntriesCached(),
    getUsageExampleEntryIdsCached(),
    getEntryLikesCountCached(),
    getSavedWordsCountCached(),
  ])

  const exampleEntryIds = new Set(exampleEntryIdsArray)
  const languageMap = createLanguageMap(languages)
  const languageMetrics = buildLanguageMetrics(languages, entries, exampleEntryIds)

  const summary = {
    totalEntries: entries.length,
    totalLanguages: languages.length,
    bridgePct:
      entries.length > 0
        ? Math.round(
            ((entries.length - languageMetrics.reduce((acc, language) => acc + language.missingBridge, 0)) /
              entries.length) *
              100
          )
        : 0,
    phraseEntries: languageMetrics.reduce((acc, language) => acc + language.phraseEntries, 0),
    phraseReadyLanguages: languageMetrics.filter((language) => language.maturity === 'phrase_ready').length,
    reviewHeavyLanguages: languageMetrics.filter((language) => language.maturity === 'review_heavy').length,
  }

  const topEntries = entries
    .map((entry) => {
      const language = languageMap.get(entry.language_id)
      const likes = likesByEntry[entry.id] || 0
      const saves = savesByEntry[entry.id] || 0
      return {
        id: entry.id,
        headword: entry.headword,
        languageName: language?.name || 'Unknown',
        languageCode: String(language?.code || '').toUpperCase(),
        likes,
        saves,
        score: likes * 2 + saves,
      }
    })
    .sort((a, b) => b.score - a.score || b.likes - a.likes || b.saves - a.saves)
    .slice(0, 8)

  const newestEntries = [...entries]
    .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    .slice(0, 8)
    .map((entry) => ({
      id: entry.id,
      headword: entry.headword,
      languageName: languageMap.get(entry.language_id)?.name || 'Unknown',
      createdAt: isoDateLabel(entry.created_at),
    }))

  const popularCommunities = [...languageMetrics]
    .filter((language) => language.totalEntries > 0)
    .sort((a, b) => b.totalEntries - a.totalEntries || b.phraseEntries - a.phraseEntries)
    .slice(0, 6)

  const growingCommunities = [...languageMetrics]
    .filter((language) => (language.maturity === 'growing' || language.maturity === 'starter') && language.totalEntries > 0)
    .sort((a, b) => a.totalEntries - b.totalEntries || b.phraseEntries - a.phraseEntries)
    .slice(0, 6)

  const contributionRequests = [...languageMetrics]
    .filter((language) => language.totalEntries > 0)
    .sort((a, b) => a.totalEntries - b.totalEntries || a.bridgeCoveragePct - b.bridgeCoveragePct)
    .slice(0, 8)

  const phraseMissions = [...languageMetrics]
    .filter((language) => language.phraseEntries > 0 || language.totalEntries > 0)
    .sort(
      (a, b) =>
        b.phraseMissingExamples - a.phraseMissingExamples ||
        a.phraseEntries - b.phraseEntries ||
        a.totalEntries - b.totalEntries
    )
    .slice(0, 8)

  const phraseSpotlights = entries
    .filter((entry) => String(entry.part_of_speech || '').toLowerCase() === 'phrase')
    .map((entry) => {
      const language = languageMap.get(entry.language_id)
      return {
        id: entry.id,
        headword: entry.headword,
        languageName: language?.name || 'Unknown',
        languageCode: String(language?.code || '').toUpperCase(),
        englishTranslation: String(entry.english_translation || '').trim(),
        swahiliTranslation: String(entry.swahili_translation || '').trim(),
      }
    })
    .filter((entry) => entry.englishTranslation || entry.swahiliTranslation)
    .sort((a, b) => a.languageName.localeCompare(b.languageName))
    .slice(0, 4)

  const countyLanguageMetrics = languageMetrics.map((language) => ({
    id: language.id,
    code: language.code,
    name: language.name,
    totalEntries: language.totalEntries,
    phraseEntries: language.phraseEntries,
    maturity: language.maturity,
  }))

  const maturityDefinitions = Object.fromEntries(
    languageMetrics.map((language) => [language.id, getLanguageMaturityDefinition(language.maturity)])
  )

  return {
    summary,
    topEntries,
    newestEntries,
    popularCommunities,
    growingCommunities,
    contributionRequests,
    phraseMissions,
    phraseSpotlights,
    countyLanguageMetrics,
    maturityDefinitions,
  }
}
