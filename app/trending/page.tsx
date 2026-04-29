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
    <div className="min-h-screen bg-neutral-100 pb-24 font-sans">
      <div className="relative overflow-hidden bg-heritage-dark text-white py-20 md:py-28 px-4 sm:px-6">
        <div className="relative max-w-5xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold\">Where We Stand. Where We Need Help.</p>
          <h1 className="text-5xl md:text-6xl lg:text-7xl font-black leading-tight max-w-3xl mx-auto font-display\">The State of Our Languages</h1>
          <p className="mt-6 text-base md:text-lg text-white max-w-2xl mx-auto leading-8\">
            See which languages are thriving. Discover which ones need your voice. Every contribution writes the next chapter of Kenya's linguistic story.
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 -mt-10 relative z-20">
        {error && (
          <div className="mb-6 rounded-2xl border border-red-200 bg-red-50 px-5 py-4 text-red-700 font-bold text-sm">
            {error}
          </div>
        )}

        {/* SECTION 1: Dictionary Health Overview */}
        <section className="mb-16">
          <div className="mb-10 surface-card p-6 md:p-8">
            <h2 className="text-3xl md:text-4xl font-black text-heritage-dark font-display mb-2">Dictionary Health at a Glance</h2>
            <p className="text-neutral-600 font-medium">Real-time metrics showing our progress toward comprehensive Kenyan language coverage.</p>
          </div>
          <div className="grid md:grid-cols-3 xl:grid-cols-6 gap-4">
            {[
              { label: 'Verified Entries', value: summary.totalEntries },
              { label: 'Active Languages', value: summary.totalLanguages },
              { label: 'Bridge Coverage', value: `${summary.bridgePct}%` },
              { label: 'Verified Phrases', value: summary.phraseEntries },
              { label: 'Phrase-Ready', value: summary.phraseReadyLanguages },
              { label: 'Review-Heavy', value: summary.reviewHeavyLanguages },
            ].map((card) => (
              <div key={card.label} className="bg-white rounded-2xl border border-neutral-200 p-6 shadow-sm hover:shadow-md transition">
                <p className="text-[10px] text-neutral-500 uppercase tracking-widest font-black mb-2">{card.label}</p>
                <p className="text-3xl font-black text-heritage-dark font-display">{loading ? '...' : card.value}</p>
              </div>
            ))}
          </div>
        </section>

        {/* SECTION 2: Geographic Coverage */}
        <section className="mb-16">
          <div className="mb-6">
            <h2 className="text-3xl font-black text-heritage-dark font-display mb-2">Geographic Reach</h2>
            <p className="text-neutral-600 font-medium">Community presence across Kenya—where languages are strongest and where growth is needed most.</p>
          </div>
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
        </section>

        {/* SECTION 3: Community Strength */}
        <section className="mb-16">
          <div className="mb-6">
            <h2 className="text-3xl font-black text-heritage-dark font-display mb-2">Community Strength</h2>
            <p className="text-neutral-600 font-medium">Languages with proven coverage and the next tier ready for rapid growth.</p>
          </div>
          <div className="grid lg:grid-cols-[1.2fr_0.8fr] gap-6">
            <div className="bg-white rounded-3xl border border-neutral-200 p-8 shadow-sm">
              <h3 className="text-2xl font-black font-display text-heritage-dark mb-6">Popular Communities</h3>
              <div className="grid md:grid-cols-2 gap-4">
                {popularCommunities.map((language) => {
                  const maturity = getLanguageMaturityDefinition(language.maturity)
                  return (
                    <Link key={language.id} href={`/search?language=${encodeURIComponent(language.id)}`} className="block">
                    <div key={language.id} className="rounded-2xl border border-neutral-200 bg-neutral-50 p-5 hover:bg-neutral-100 hover:border-accent-300/40 transition">
                        <div className="flex items-start justify-between gap-4 mb-3">
                          <div>
                            <p className="text-lg font-black text-neutral-900">{language.name}</p>
                            <p className="text-[10px] font-black uppercase tracking-widest text-neutral-500">
                              {language.code} {language.native_name ? `| ${language.native_name}` : ''}
                            </p>
                          </div>
                          <span className={`px-2 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest whitespace-nowrap ${maturity.badgeClassName}`}>
                            {maturity.shortLabel}
                          </span>
                        </div>
                        <p className="text-sm text-neutral-600 font-medium leading-relaxed mb-4">{maturity.description}</p>
                        <div className="flex items-center justify-between text-[10px] font-black uppercase tracking-widest text-neutral-500">
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

            <div className="bg-accent-50 rounded-3xl border border-accent-100 p-8 shadow-sm">
              <h3 className="text-2xl font-black font-display text-heritage-dark mb-6">Next Growth Wave</h3>
              <div className="space-y-3">
                {growingCommunities.map((language) => {
                  const maturity = getLanguageMaturityDefinition(language.maturity)
                  return (
                    <div key={language.id} className="rounded-2xl bg-neutral-50 border border-accent-100 p-4 hover:border-accent-300/50 transition">
                      <div className="flex items-center justify-between gap-3 mb-2">
                        <div>
                          <p className="font-black text-neutral-900">{language.name}</p>
                          <p className="text-[10px] font-black uppercase tracking-widest text-neutral-500">{language.code}</p>
                        </div>
                        <span className={`px-2 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest ${maturity.badgeClassName}`}>
                          {maturity.shortLabel}
                        </span>
                      </div>
                      <p className="text-sm text-neutral-600 font-medium mb-3">
                        {language.phraseEntries > 0
                          ? 'Phrase coverage live—add examples to improve translation quality.'
                          : 'Ready for phrase expansion. Your contributions have immediate impact.'}
                      </p>
                      <div className="flex flex-wrap gap-2">
                        <Link
                          href={`/contribute?lang=${encodeURIComponent(language.code)}`}
                          className="px-3 py-2 rounded-xl bg-accent-300 text-heritage-dark text-[10px] font-black uppercase tracking-widest hover:bg-accent-400"
                        >
                          Add Word
                        </Link>
                        <Link
                          href={`/contribute?type=phrase&lang=${encodeURIComponent(language.code)}`}
                          className="px-3 py-2 rounded-xl bg-neutral-50 border border-neutral-200 text-[10px] font-black uppercase tracking-widest text-neutral-700 hover:bg-neutral-100"
                        >
                          Add Phrase
                        </Link>
                      </div>
                    </div>
                  )
                })}
              </div>
            </div>
          </div>
        </section>

        {/* SECTION 4: Community Activity */}
        <section className="mb-16">
          <div className="mb-6">
            <h2 className="text-3xl font-black text-heritage-dark font-display mb-2">Community Activity</h2>
            <p className="text-neutral-600 font-medium">Latest contributions and the words getting the most love from the community.</p>
          </div>
          <div className="grid lg:grid-cols-2 gap-6">
            <div className="bg-neutral-100 rounded-3xl border border-accent-300/30 p-8 shadow-soft">
              <h3 className="text-2xl font-black font-display text-heritage-dark mb-6">Latest Additions</h3>
              <div className="space-y-3">
                {newestEntries.map((entry) => (
                  <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                    <div className="rounded-2xl border border-neutral-200 bg-neutral-50 px-4 py-3 hover:bg-neutral-100 hover:border-accent-300/40 transition">
                      <div className="flex items-center justify-between gap-4">
                        <div className="min-w-0">
                          <p className="font-black text-neutral-900 truncate">{entry.headword}</p>
                          <p className="text-[10px] font-black uppercase tracking-widest text-neutral-500">
                            {entry.languageName}
                          </p>
                        </div>
                      </div>
                    </div>
                  </Link>
                ))}
                {!loading && newestEntries.length === 0 && (
                  <p className="text-sm text-neutral-500">Check back soon for new additions.</p>
                )}
              </div>
            </div>

            <div className="bg-neutral-100 rounded-3xl border border-accent-300/30 p-8 shadow-soft">
              <h3 className="text-2xl font-black font-display text-heritage-dark mb-6">Most Appreciated</h3>
              <div className="space-y-3">
                {topEntries.map((entry) => (
                  <Link key={entry.id} href={`/entry/${entry.id}`} className="block">
                    <div className="rounded-2xl border border-neutral-200 bg-neutral-50 px-4 py-3 hover:bg-neutral-100 hover:border-accent-300/40 transition">
                      <div className="flex items-center justify-between gap-4">
                        <div className="min-w-0">
                          <p className="font-black text-neutral-900 truncate">{entry.headword}</p>
                          <p className="text-[10px] font-black uppercase tracking-widest text-neutral-500">
                            {entry.languageName} ({entry.languageCode || 'N/A'})
                          </p>
                        </div>
                        <p className="text-[10px] font-black uppercase tracking-widest text-accent-700 whitespace-nowrap">
                          ❤️ {entry.likes} | 💾 {entry.saves}
                        </p>
                      </div>
                    </div>
                  </Link>
                ))}
                {!loading && topEntries.length === 0 && (
                  <p className="text-sm text-neutral-500">No interaction data yet.</p>
                )}
              </div>
            </div>
          </div>
        </section>

        {/* SECTION 5: Phrase Expansion */}
        <section className="mb-16">
          <div className="mb-6">
            <h2 className="text-3xl font-black text-heritage-dark font-display mb-2">Next Phase: Phrase Expansion</h2>
            <p className="text-neutral-600 font-medium">Context and multi-word expressions are the next layer. These languages need more phrase entries and usage examples.</p>
          </div>
          <div className="grid lg:grid-cols-[0.8fr_1.2fr] gap-6">
            <div className="bg-heritage-dark rounded-3xl border border-accent-300/20 p-8 shadow-soft text-white">
              <h3 className="text-2xl font-black font-display mb-6">Phrase Spotlight</h3>
              <div className="space-y-4">
                {phraseSpotlights.map((phrase) => (
                  <Link key={phrase.id} href={`/entry/${phrase.id}`} className="block">
                    <div className="rounded-2xl border border-neutral-700 bg-neutral-800 px-4 py-4 hover:border-accent-300 transition">
                      <p className="text-lg font-black mb-2">{phrase.headword}</p>
                      <p className="text-[10px] font-black uppercase tracking-widest text-accent-300 mb-3">
                        {phrase.languageName}
                      </p>
                      <p className="text-sm text-neutral-300 italic mb-2">&quot;{phrase.englishTranslation}&quot;</p>
                      {phrase.swahiliTranslation && (
                        <p className="text-sm text-neutral-400">(SW: {phrase.swahiliTranslation})</p>
                      )}
                    </div>
                  </Link>
                ))}
                {!loading && phraseSpotlights.length === 0 && (
                  <p className="text-sm text-neutral-400">Phrases coming soon.</p>
                )}
              </div>
            </div>

            <div className="bg-accent-50 rounded-3xl border border-accent-100 p-8 shadow-soft">
              <h3 className="text-2xl font-black font-display text-heritage-dark mb-6">Phrase Missions</h3>
              <p className="text-neutral-600 font-medium mb-6">
                These languages have phrase foundations and will improve fastest with more contextual examples.
              </p>
              <div className="space-y-3">
                {phraseMissions.map((language) => (
                  <div key={language.id} className="rounded-2xl bg-neutral-50 border border-accent-100 p-4 hover:border-accent-300/50 transition">
                    <div className="flex items-center justify-between gap-3 mb-2">
                      <div>
                        <p className="font-black text-neutral-900">{language.name}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-neutral-500">
                          {language.totalEntries} entries, {language.phraseEntries} phrases
                        </p>
                      </div>
                      <span className="text-[10px] font-black text-accent-700 bg-accent-100 px-2 py-1 rounded-lg">
                        {language.phraseMissingExamples} need examples
                      </span>
                    </div>
                    <Link
                      href={`/contribute?type=phrase&lang=${encodeURIComponent(language.code)}`}
                      className="inline-block px-3 py-2 rounded-xl bg-heritage-dark text-white text-[10px] font-black uppercase tracking-widest hover:bg-heritage-darker mt-2"
                    >
                      Add Phrase
                    </Link>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* SECTION 6: Call to Action */}
        <section className="mb-0">
          <div className="bg-heritage-dark rounded-2xl p-12 md:p-16 text-white shadow-strong">
            <div className="text-center">
              <h2 className="text-4xl font-black font-display mb-4">Your Impact Starts Here</h2>
              <p className="text-white text-lg font-medium mb-8 max-w-3xl mx-auto">
                Every word, phrase, and example brings us closer to a complete dictionary and stronger translation for all Kenyan languages.
              </p>
              <div className="flex flex-wrap justify-center gap-4">
                <Link href="/contribute" className="px-8 py-4 rounded-lg bg-accent-300 text-heritage-dark font-black text-lg hover:bg-accent-400 transition shadow-soft">
                  Start Contributing
                </Link>
                <Link href="/explore" className="px-8 py-4 rounded-lg border-2 border-accent-300 text-white font-black text-lg hover:bg-accent-300/20 transition">
                  Explore Dictionary
                </Link>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  )
}
