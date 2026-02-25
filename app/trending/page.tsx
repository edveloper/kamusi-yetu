'use client'

import { useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { getLanguages } from '@/lib/api/languages'
import { supabase } from '@/lib/supabase'

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
}

const ENTRY_PAGE_SIZE = 1000

async function fetchAllEntriesForTrending() {
  const allRows: EntryMetricRow[] = []
  let from = 0

  while (true) {
    const to = from + ENTRY_PAGE_SIZE - 1
    const { data, error } = await supabase
      .from('entries')
      .select('id, language_id, headword, english_translation, swahili_translation, validation_status, created_at')
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

  useEffect(() => {
    async function load() {
      setLoading(true)
      setError(null)
      try {
        const langs = (await getLanguages()) as LanguageRow[]
        setLanguages(langs || [])

        const allEntries = await fetchAllEntriesForTrending()
        setEntries(allEntries)

        // Best-effort: likes
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

        // Best-effort: saves
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
    for (const l of languages) map.set(l.id, l)
    return map
  }, [languages])

  const languageMetrics = useMemo<LanguageMetric[]>(() => {
    const metrics: Record<string, LanguageMetric> = {}
    for (const lang of languages) {
      metrics[lang.id] = {
        id: lang.id,
        code: lang.code,
        name: lang.name,
        native_name: lang.native_name,
        totalEntries: 0,
        missingBridge: 0,
        bridgeCoveragePct: 100
      }
    }

    for (const e of entries) {
      if (!metrics[e.language_id]) continue
      metrics[e.language_id].totalEntries += 1

      const en = String(e.english_translation || '').trim()
      const sw = String(e.swahili_translation || '').trim()
      if (!en && !sw) {
        metrics[e.language_id].missingBridge += 1
      }
    }

    const list = Object.values(metrics)
    for (const m of list) {
      m.bridgeCoveragePct =
        m.totalEntries > 0 ? Math.round(((m.totalEntries - m.missingBridge) / m.totalEntries) * 100) : 100
    }
    return list
  }, [entries, languages])

  const topEntries = useMemo<EntryLite[]>(() => {
    return entries
      .map((e) => {
        const likes = likesByEntry[e.id] || 0
        const saves = savesByEntry[e.id] || 0
        const lang = languageById.get(e.language_id)
        const score = likes * 2 + saves
        return {
          id: e.id,
          headword: e.headword,
          languageName: lang?.name || 'Unknown',
          languageCode: String(lang?.code || '').toUpperCase(),
          likes,
          saves,
          score
        }
      })
      .sort((a, b) => b.score - a.score || b.likes - a.likes || b.saves - a.saves)
      .slice(0, 8)
  }, [entries, likesByEntry, savesByEntry, languageById])

  const newestEntries = useMemo(() => {
    return [...entries]
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
      .slice(0, 8)
      .map((e) => ({
        id: e.id,
        headword: e.headword,
        languageName: languageById.get(e.language_id)?.name || 'Unknown',
        createdAt: new Date(e.created_at).toLocaleDateString()
      }))
  }, [entries, languageById])

  const contributionRequests = useMemo(() => {
    return [...languageMetrics]
      .sort((a, b) => a.totalEntries - b.totalEntries || a.bridgeCoveragePct - b.bridgeCoveragePct)
      .slice(0, 8)
  }, [languageMetrics])

  const summary = useMemo(() => {
    const totalEntries = entries.length
    const totalLanguages = languages.length
    const totalMissingBridge = languageMetrics.reduce((acc, l) => acc + l.missingBridge, 0)
    const totalWithBridge = totalEntries - totalMissingBridge
    const bridgePct = totalEntries > 0 ? Math.round((totalWithBridge / totalEntries) * 100) : 0
    return { totalEntries, totalLanguages, totalMissingBridge, bridgePct }
  }, [entries, languages.length, languageMetrics])

  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800 relative overflow-hidden">
        <div className="max-w-6xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">Trending</h1>
          <p className="text-lg md:text-2xl text-emerald-100 opacity-90 leading-relaxed font-medium">
            Community pulse, dictionary health, and live missions for preserving lesser-known languages.
          </p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 -mt-10 relative z-20">
        {error && (
          <div className="mb-6 rounded-2xl border border-red-200 bg-red-50 px-5 py-4 text-red-700 font-bold text-sm">
            {error}
          </div>
        )}

        <section className="grid md:grid-cols-4 gap-4 mb-10">
          {[
            { label: 'Verified Entries', value: summary.totalEntries },
            { label: 'Active Languages', value: summary.totalLanguages },
            { label: 'Bridge Coverage', value: `${summary.bridgePct}%` },
            { label: 'Missing Bridge', value: summary.totalMissingBridge }
          ].map((card) => (
            <div key={card.label} className="bg-white rounded-2xl border border-stone-200 p-6 shadow-sm">
              <p className="text-[10px] text-stone-500 uppercase tracking-widest font-black mb-2">{card.label}</p>
              <p className="text-3xl font-black text-stone-900 font-logo">{loading ? '...' : card.value}</p>
            </div>
          ))}
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
              {topEntries.map((e) => (
                <Link key={e.id} href={`/entry/${e.id}`} className="block">
                  <div className="rounded-2xl border border-stone-100 bg-stone-50 px-4 py-3 hover:bg-white hover:border-emerald-200 transition">
                    <div className="flex items-center justify-between gap-4">
                      <div className="min-w-0">
                        <p className="font-black text-stone-900 truncate">{e.headword}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                          {e.languageName} ({e.languageCode || 'N/A'})
                        </p>
                      </div>
                      <p className="text-[10px] font-black uppercase tracking-widest text-emerald-700 whitespace-nowrap">
                        Likes {e.likes} | Saves {e.saves}
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
              {newestEntries.map((e) => (
                <Link key={e.id} href={`/entry/${e.id}`} className="block">
                  <div className="rounded-2xl border border-stone-100 bg-stone-50 px-4 py-3 hover:bg-white hover:border-emerald-200 transition">
                    <div className="flex items-center justify-between gap-4">
                      <div className="min-w-0">
                        <p className="font-black text-stone-900 truncate">{e.headword}</p>
                        <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                          {e.languageName}
                        </p>
                      </div>
                      <p className="text-[10px] font-black uppercase tracking-widest text-stone-500 whitespace-nowrap">
                        {e.createdAt}
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
            <h2 className="text-2xl font-black font-logo text-stone-900">Contribution Requests: Lesser-Known Languages</h2>
            <Link href="/contribute" className="text-xs font-black uppercase tracking-widest text-emerald-700">
              Open contribute
            </Link>
          </div>
          <p className="text-sm text-stone-600 mb-6">
            Focus on languages with fewer entries and lower bridge coverage. These missions help close discovery gaps quickly.
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            {contributionRequests.map((lang) => (
              <div key={lang.id} className="rounded-2xl border border-stone-100 bg-stone-50 p-5">
                <div className="flex items-center justify-between gap-3 mb-3">
                  <div>
                    <p className="text-lg font-black text-stone-900">{lang.name}</p>
                    <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                      {lang.code} {lang.native_name ? `| ${lang.native_name}` : ''}
                    </p>
                  </div>
                  <span className="text-[10px] font-black uppercase tracking-widest px-2 py-1 rounded-lg bg-amber-100 text-amber-700">
                    {lang.totalEntries} entries
                  </span>
                </div>
                <div className="text-[11px] font-bold text-stone-600 uppercase tracking-widest mb-4">
                  Bridge coverage: {lang.bridgeCoveragePct}% | Missing bridge: {lang.missingBridge}
                </div>
                <div className="flex flex-wrap gap-2">
                  <Link
                    href={`/contribute?lang=${encodeURIComponent(lang.code)}`}
                    className="px-3 py-2 rounded-xl bg-emerald-600 text-white text-[10px] font-black uppercase tracking-widest hover:bg-emerald-500"
                  >
                    Contribute in {lang.code}
                  </Link>
                  <Link
                    href={`/search?language=${encodeURIComponent(lang.id)}`}
                    className="px-3 py-2 rounded-xl bg-white border border-stone-200 text-[10px] font-black uppercase tracking-widest text-stone-700"
                  >
                    Review entries
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
