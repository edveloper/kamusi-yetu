'use client'

import { useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { getLanguages } from '@/lib/api/languages'
import { supabase } from '@/lib/supabase'
import KenyaCountyCoverageMap from '@/components/trending/KenyaCountyCoverageMap'
import {
  computeLanguageMaturity,
  getLanguageMaturityDefinition,
  type LanguageMaturity,
} from '@/lib/constants/languageMaturity'

type LanguageRow = {
  id: string
  code: string
  name: string
  native_name?: string | null
}

type EntryMetricRow = {
  id: string
  language_id: string
  headword: string
  part_of_speech: string | null
  english_translation: string | null
  swahili_translation: string | null
  validation_status: string
  created_at: string
}

type EntryLite = {
  id: string
  headword: string
  languageName: string
  languageCode: string
  likes: number
  saves: number
  score: number
}

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

type PhraseSpotlight = {
  id: string
  headword: string
  languageName: string
  languageCode: string
  englishTranslation: string
  swahiliTranslation: string
}

const ENTRY_PAGE_SIZE = 1000

async function fetchAllEntriesForTrending() {
  const allRows: EntryMetricRow[] = []
  let from = 0

  while (true) {
    const to = from + ENTRY_PAGE_SIZE - 1
    const { data, error } = await supabase
      .from('entries')
      .select('id, language_id, headword, part_of_speech, english_translation, swahili_translation, validation_status, created_at')
      .eq('validation_status', 'verified')
      .range(from, to)

    if (error) throw error
    if (!data || data.length === 0) break

    allRows.push(...(data as EntryMetricRow[]))
    if (data.length < ENTRY_PAGE_SIZE) break
    from += ENTRY_PAGE_SIZE
  }

  return allRows
}

export default function TrendingPage() {
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [languages, setLanguages] = useState<LanguageRow[]>([])
  const [entries, setEntries] = useState<EntryMetricRow[]>([])
  const [likesByEntry, setLikesByEntry] = useState<Record<string, number>>({})
  const [savesByEntry, setSavesByEntry] = useState<Record<string, number>>({})
  const [exampleEntryIds, setExampleEntryIds] = useState<Set<string>>(new Set())

  useEffect(() => {
    async function load() {
      setLoading(true)
      setError(null)
      try {
        const langs = (await getLanguages()) as LanguageRow[]
        setLanguages(langs || [])

        const allEntries = await fetchAllEntriesForTrending()
        setEntries(allEntries)

        const exampleIds = new Set<string>()

        try {
          const { data: structuredRows } = await supabase.from('entry_usage_examples').select('entry_id')
          for (const row of structuredRows || []) {
            const id = String((row as { entry_id?: string | null }).entry_id || '')
            if (id) exampleIds.add(id)
          }
        } catch {
          // no-op
        }

        try {
          const { data: legacyRows } = await supabase.from('usage_contexts').select('entry_id')
          for (const row of legacyRows || []) {
            const id = String((row as { entry_id?: string | null }).entry_id || '')
            if (id) exampleIds.add(id)
          }
        } catch {
          // no-op
        }

        setExampleEntryIds(exampleIds)

        try {
          const { data: likesRows } = await supabase.from('entry_likes').select('entry_id')
          const likesAgg: Record<string, number> = {}
          for (const row of likesRows || []) {
            const id = String((row as { entry_id?: string | null }).entry_id || '')
            if (!id) continue
            likesAgg[id] = (likesAgg[id] || 0) + 1
          }
          setLikesByEntry(likesAgg)
        } catch {
          setLikesByEntry({})
        }

        try {
          const { data: saveRows } = await supabase.from('saved_words').select('entry_id')
          const savesAgg: Record<string, number> = {}
          for (const row of saveRows || []) {
            const id = String((row as { entry_id?: string | null }).entry_id || '')
            if (!id) continue
            savesAgg[id] = (savesAgg[id] || 0) + 1
          }
          setSavesByEntry(savesAgg)
        } catch {
          setSavesByEntry({})
        }
      } catch (err) {
        console.error('Failed to load trending metrics:', err)
        setError('Could not load trending metrics right now.')
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  const languageById = useMemo(() => {
    const map = new Map<string, LanguageRow>()
    for (const language of languages) map.set(language.id, language)
    return map
  }, [languages])

  const languageMetrics = useMemo<LanguageMetric[]>(() => {
    const metrics: Record<string, LanguageMetric> = {}

    for (const language of languages) {
      metrics[language.id] = {
        id: language.id,
        code: language.code,
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
      if (!metrics[entry.language_id]) continue
      metrics[entry.language_id].totalEntries += 1

      const english = String(entry.english_translation || '').trim()
      const swahili = String(entry.swahili_translation || '').trim()
      const isPhrase = String(entry.part_of_speech || '').toLowerCase() === 'phrase'

      if (!english && !swahili) {
        metrics[entry.language_id].missingBridge += 1
      }

      if (isPhrase) {
        metrics[entry.language_id].phraseEntries += 1
        if (!exampleEntryIds.has(entry.id)) {
          metrics[entry.language_id].phraseMissingExamples += 1
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
  }, [entries, exampleEntryIds, languages])

  const topEntries = useMemo<EntryLite[]>(() => {
    return entries
      .map((entry) => {
        const likes = likesByEntry[entry.id] || 0
        const saves = savesByEntry[entry.id] || 0
        const language = languageById.get(entry.language_id)
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
  }, [entries, likesByEntry, savesByEntry, languageById])

  const newestEntries = useMemo(() => {
    return [...entries]
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
      .slice(0, 8)
      .map((entry) => ({
        id: entry.id,
        headword: entry.headword,
        languageName: languageById.get(entry.language_id)?.name || 'Unknown',
        createdAt: new Date(entry.created_at).toLocaleDateString(),
      }))
  }, [entries, languageById])

  const popularCommunities = useMemo(() => {
    return [...languageMetrics]
      .filter((language) => language.totalEntries > 0)
      .sort((a, b) => b.totalEntries - a.totalEntries || b.phraseEntries - a.phraseEntries)
      .slice(0, 6)
  }, [languageMetrics])

  const growingCommunities = useMemo(() => {
    return [...languageMetrics]
      .filter((language) => (language.maturity === 'growing' || language.maturity === 'starter') && language.totalEntries > 0)
      .sort((a, b) => a.totalEntries - b.totalEntries || b.phraseEntries - a.phraseEntries)
      .slice(0, 6)
  }, [languageMetrics])

  const contributionRequests = useMemo(() => {
    return [...languageMetrics]
      .filter((language) => language.totalEntries > 0)
      .sort((a, b) => a.totalEntries - b.totalEntries || a.bridgeCoveragePct - b.bridgeCoveragePct)
      .slice(0, 8)
  }, [languageMetrics])

  const phraseMissions = useMemo(() => {
    return [...languageMetrics]
      .filter((language) => language.phraseEntries > 0 || language.totalEntries > 0)
      .sort((a, b) => b.phraseMissingExamples - a.phraseMissingExamples || a.phraseEntries - b.phraseEntries || a.totalEntries - b.totalEntries)
      .slice(0, 8)
  }, [languageMetrics])

  const phraseSpotlights = useMemo<PhraseSpotlight[]>(() => {
    return entries
      .filter((entry) => String(entry.part_of_speech || '').toLowerCase() === 'phrase')
      .map((entry) => {
        const language = languageById.get(entry.language_id)
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
  }, [entries, languageById])

  const summary = useMemo(() => {
    const totalEntries = entries.length
    const totalLanguages = languages.length
    const totalMissingBridge = languageMetrics.reduce((acc, language) => acc + language.missingBridge, 0)
    const totalWithBridge = totalEntries - totalMissingBridge
    const bridgePct = totalEntries > 0 ? Math.round((totalWithBridge / totalEntries) * 100) : 0
    const phraseEntries = languageMetrics.reduce((acc, language) => acc + language.phraseEntries, 0)
    const phraseReadyLanguages = languageMetrics.filter((language) => language.maturity === 'phrase_ready').length
    const reviewHeavyLanguages = languageMetrics.filter((language) => language.maturity === 'review_heavy').length

    return {
      totalEntries,
      totalLanguages,
      bridgePct,
      phraseEntries,
      phraseReadyLanguages,
      reviewHeavyLanguages,
    }
  }, [entries, languages.length, languageMetrics])

  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-6xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">Trending</h1>
          <p className="text-lg md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium">
            Community pulse, dictionary health, and live opportunities to strengthen Kenya&apos;s languages.
          </p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 -mt-10 relative z-20">
        {error && (
          <div className="mb-6 rounded-2xl border border-red-200 bg-red-50 px-5 py-4 text-red-700 font-bold text-sm">
            {error}
          </div>
        )}

        <section className="grid md:grid-cols-3 xl:grid-cols-6 gap-4 mb-10">
          {[
            { label: 'Verified Entries', value: summary.totalEntries },
            { label: 'Active Languages', value: summary.totalLanguages },
            { label: 'Bridge Coverage', value: `${summary.bridgePct}%` },
            { label: 'Verified Phrases', value: summary.phraseEntries },
            { label: 'Phrase-Ready', value: summary.phraseReadyLanguages },
            { label: 'Review-Heavy', value: summary.reviewHeavyLanguages },
          ].map((card) => (
            <div key={card.label} className="bg-white rounded-2xl border border-stone-200 p-6 shadow-sm">
              <p className="text-[10px] text-stone-500 uppercase tracking-widest font-black mb-2">{card.label}</p>
              <p className="text-3xl font-black text-stone-900 font-logo">{loading ? '...' : card.value}</p>
            </div>
          ))}
        </section>

        <KenyaCountyCoverageMap
          languageMetrics={languageMetrics.map((language) => ({
            id: language.id,
            code: language.code,
            name: language.name,
            totalEntries: language.totalEntries,
            phraseEntries: language.phraseEntries,
            maturity: language.maturity,
          }))}
        />

        <section className="grid lg:grid-cols-[1.2fr_0.8fr] gap-6 mb-10">
          <div className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm">
            <div className="flex items-center justify-between mb-6">
              <div>
                <p className="text-[10px] font-black uppercase tracking-[0.25em] text-emerald-700 mb-2">Communities</p>
                <h2 className="text-2xl font-black font-logo text-stone-900">Popular Communities</h2>
              </div>
              <Link href="/explore" className="text-xs font-black uppercase tracking-widest text-emerald-700">
                Explore
              </Link>
            </div>
            <div className="grid md:grid-cols-2 gap-4">
              {popularCommunities.map((language) => {
                const maturity = getLanguageMaturityDefinition(language.maturity)
                return (
                  <Link key={language.id} href={`/search?language=${encodeURIComponent(language.id)}`} className="block">
                    <div className="rounded-2xl border border-stone-100 bg-stone-50 p-5 hover:bg-white hover:border-emerald-200 transition">
                      <div className="flex items-start justify-between gap-4 mb-3">
                        <div>
                          <p className="text-lg font-black text-stone-900">{language.name}</p>
                          <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                            {language.code} {language.native_name ? `| ${language.native_name}` : ''}
                          </p>
                        </div>
                        <span className={`px-2 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest ${maturity.badgeClassName}`}>
                          {maturity.shortLabel}
                        </span>
                      </div>
                      <p className="text-sm text-stone-600 font-medium leading-relaxed mb-4">{maturity.description}</p>
                      <div className="flex items-center justify-between text-[10px] font-black uppercase tracking-widest text-stone-500">
                        <span>{language.totalEntries} entries</span>
                        <span>{language.phraseEntries} phrases</span>
                        <span>{language.bridgeCoveragePct}% bridge</span>
                      </div>
                    </div>
                  </Link>
                )
              })}
            </div>
          </div>

          <div className="bg-emerald-50 rounded-3xl border border-emerald-100 p-8 shadow-sm">
            <div className="mb-6">
              <p className="text-[10px] font-black uppercase tracking-[0.25em] text-emerald-700 mb-2">Growing Coverage</p>
              <h2 className="text-2xl font-black font-logo text-stone-900">Where contributions matter most</h2>
            </div>
            <div className="space-y-3">
              {growingCommunities.map((language) => {
                const maturity = getLanguageMaturityDefinition(language.maturity)
                return (
                  <div key={language.id} className="rounded-2xl bg-white border border-emerald-100 p-4">
                    <div className="flex items-center justify-between gap-3 mb-2">
                      <div>
                        <p className="font-black text-stone-900">{language.name}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">{language.code}</p>
                      </div>
                      <span className={`px-2 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest ${maturity.badgeClassName}`}>
                        {maturity.shortLabel}
                      </span>
                    </div>
                    <p className="text-sm text-stone-600 font-medium mb-3">
                      {language.phraseEntries > 0
                        ? 'This language has live phrase coverage and will improve quickly with more examples and context.'
                        : 'This language is live and can become much more useful with the next wave of phrase and example contributions.'}
                    </p>
                    <div className="flex flex-wrap gap-2">
                      <Link
                        href={`/contribute?lang=${encodeURIComponent(language.code)}`}
                        className="px-3 py-2 rounded-xl bg-emerald-600 text-white text-[10px] font-black uppercase tracking-widest hover:bg-emerald-500"
                      >
                        Add Word
                      </Link>
                      <Link
                        href={`/contribute?type=phrase&lang=${encodeURIComponent(language.code)}`}
                        className="px-3 py-2 rounded-xl bg-white border border-stone-200 text-[10px] font-black uppercase tracking-widest text-stone-700"
                      >
                        Add Phrase
                      </Link>
                    </div>
                  </div>
                )
              })}
            </div>
          </div>
        </section>

        <section className="grid lg:grid-cols-2 gap-6 mb-10">
          <div className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-2xl font-black font-logo text-stone-900">Most Appreciated Entries</h2>
              <Link href="/search" className="text-xs font-black uppercase tracking-widest text-emerald-700">
                Browse all
              </Link>
            </div>
            <div className="space-y-3">
              {topEntries.map((entry) => (
                <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                  <div className="rounded-2xl border border-stone-100 bg-stone-50 px-4 py-3 hover:bg-white hover:border-emerald-200 transition">
                    <div className="flex items-center justify-between gap-4">
                      <div className="min-w-0">
                        <p className="font-black text-stone-900 truncate">{entry.headword}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                          {entry.languageName} ({entry.languageCode || 'N/A'})
                        </p>
                      </div>
                      <p className="text-[10px] font-black uppercase tracking-widest text-emerald-700 whitespace-nowrap">
                        Likes {entry.likes} | Saves {entry.saves}
                      </p>
                    </div>
                  </div>
                </Link>
              ))}
              {!loading && topEntries.length === 0 && (
                <p className="text-sm text-stone-500">No interaction data yet.</p>
              )}
            </div>
          </div>

          <div className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-2xl font-black font-logo text-stone-900">Latest Additions</h2>
              <Link href="/contribute" className="text-xs font-black uppercase tracking-widest text-emerald-700">
                Add word
              </Link>
            </div>
            <div className="space-y-3">
              {newestEntries.map((entry) => (
                <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                  <div className="rounded-2xl border border-stone-100 bg-stone-50 px-4 py-3 hover:bg-white hover:border-emerald-200 transition">
                    <div className="flex items-center justify-between gap-4">
                      <div className="min-w-0">
                        <p className="font-black text-stone-900 truncate">{entry.headword}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                          {entry.languageName}
                        </p>
                      </div>
                      <p className="text-[10px] font-black uppercase tracking-widest text-stone-500 whitespace-nowrap">
                        {entry.createdAt}
                      </p>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

        <section className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm mb-10">
          <div className="flex items-center justify-between mb-6">
            <div>
              <p className="text-[10px] font-black uppercase tracking-[0.25em] text-emerald-700 mb-2">Phrase Spotlight</p>
              <h2 className="text-2xl font-black font-logo text-stone-900">Context worth preserving</h2>
            </div>
            <Link href="/search?kind=phrase" className="text-xs font-black uppercase tracking-widest text-emerald-700">
              Browse phrases
            </Link>
          </div>
          <div className="grid md:grid-cols-2 xl:grid-cols-4 gap-4">
            {phraseSpotlights.map((entry) => (
              <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                <div className="rounded-2xl border border-stone-100 bg-stone-50 p-5 hover:bg-white hover:border-emerald-200 transition h-full">
                  <div className="mb-3">
                    <p className="text-xl font-black text-stone-900">{entry.headword}</p>
                    <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                      {entry.languageName} ({entry.languageCode || 'N/A'})
                    </p>
                  </div>
                  <div className="space-y-2">
                    {entry.englishTranslation && (
                      <p className="text-sm text-stone-700 font-medium">
                        <span className="text-[10px] font-black uppercase tracking-widest text-stone-400 block mb-1">English</span>
                        {entry.englishTranslation}
                      </p>
                    )}
                    {entry.swahiliTranslation && (
                      <p className="text-sm text-stone-700 font-medium">
                        <span className="text-[10px] font-black uppercase tracking-widest text-stone-400 block mb-1">Swahili</span>
                        {entry.swahiliTranslation}
                      </p>
                    )}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>

        <section className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm mb-10">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-black font-logo text-stone-900">Contribution Requests: Lesser-Known Languages</h2>
            <Link href="/contribute" className="text-xs font-black uppercase tracking-widest text-emerald-700">
              Open contribute
            </Link>
          </div>
          <p className="text-sm text-stone-600 mb-6">
            Focus on languages with fewer entries and lower bridge coverage. These missions help close discovery gaps quickly.
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            {contributionRequests.map((language) => (
              <div key={language.id} className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
                <div className="flex items-center justify-between gap-3 mb-3">
                  <div>
                    <p className="text-lg font-black text-stone-900">{language.name}</p>
                    <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                      {language.code} {language.native_name ? `| ${language.native_name}` : ''}
                    </p>
                  </div>
                  <span className={`text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded-lg ${getLanguageMaturityDefinition(language.maturity).badgeClassName}`}>
                    {getLanguageMaturityDefinition(language.maturity).shortLabel}
                  </span>
                </div>
                <div className="text-[11px] font-bold text-stone-600 uppercase tracking-widest mb-4">
                  Bridge coverage: {language.bridgeCoveragePct}% | Missing bridge: {language.missingBridge}
                </div>
                <div className="flex flex-wrap gap-2">
                  <Link
                    href={`/contribute?lang=${encodeURIComponent(language.code)}`}
                    className="px-3 py-2 rounded-xl bg-emerald-600 text-white text-[10px] font-black uppercase tracking-widest hover:bg-emerald-500"
                  >
                    Contribute in {language.code}
                  </Link>
                  <Link
                    href={`/search?language=${encodeURIComponent(language.id)}`}
                    className="px-3 py-2 rounded-xl bg-white border border-stone-200 text-[10px] font-black uppercase tracking-widest text-stone-700"
                  >
                    Review entries
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className="bg-white rounded-3xl border border-stone-200 p-8 shadow-sm mb-10">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-2xl font-black font-logo text-stone-900">Phrase Missions</h2>
            <Link href="/contribute?type=phrase" className="text-xs font-black uppercase tracking-widest text-emerald-700">
              Add phrase
            </Link>
          </div>
          <p className="text-sm text-stone-600 mb-6">
            Phrase coverage is the next quality layer. These languages need more phrase entries or better contextual examples.
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            {phraseMissions.map((language) => (
              <div key={language.id} className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
                <div className="flex items-center justify-between gap-3 mb-3">
                  <div>
                    <p className="text-lg font-black text-stone-900">{language.name}</p>
                    <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                      {language.code} {language.native_name ? `| ${language.native_name}` : ''}
                    </p>
                  </div>
                  <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded-lg bg-stone-900 text-white">
                    {language.phraseEntries} phrases
                  </span>
                </div>
                <div className="text-[11px] font-bold text-stone-600 uppercase tracking-widest mb-4">
                  Missing phrase examples: {language.phraseMissingExamples} | Total entries: {language.totalEntries}
                </div>
                <div className="flex flex-wrap gap-2">
                  <Link
                    href={`/contribute?type=phrase&lang=${encodeURIComponent(language.code)}`}
                    className="px-3 py-2 rounded-xl bg-emerald-600 text-white text-[10px] font-black uppercase tracking-widest hover:bg-emerald-500"
                  >
                    Add phrase in {language.code}
                  </Link>
                  <Link
                    href={`/search?language=${encodeURIComponent(language.id)}&kind=phrase`}
                    className="px-3 py-2 rounded-xl bg-white border border-stone-200 text-[10px] font-black uppercase tracking-widest text-stone-700"
                  >
                    Review phrases
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </section>
      </div>
    </div>
  )
}
