'use client'

import { useState, useEffect } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
import Link from 'next/link'
import { searchEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { getLanguageNote } from '@/lib/constants/languageNotes'
import { groupLanguages } from '@/lib/constants/languageGroups'
import { CATEGORIES } from '@/lib/constants'

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

type SearchSort = 'headword_asc' | 'newest' | 'trust_desc'
type EntryKind = 'all' | 'word' | 'phrase'

export default function SearchContent() {
  const searchParams = useSearchParams()
  const router = useRouter()

  const queryParam = searchParams.get('q') || ''
  const langParam = searchParams.get('language') || 'all'
  const catParam = searchParams.get('category') || 'all'
  const letterParam = searchParams.get('letter') || 'all'
  const sortParam = (searchParams.get('sort') as SearchSort) || 'headword_asc'
  const kindParam = (searchParams.get('kind') as EntryKind) || 'all'

  const [searchQuery, setSearchQuery] = useState(queryParam)
  const [results, setResults] = useState<any[]>([])
  const [totalCount, setTotalCount] = useState(0)
  const [languages, setLanguages] = useState<any[]>([])
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    setSearchQuery(queryParam)
  }, [queryParam])

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setLanguages(langs || [])
      } catch (err) {
        console.error('Failed to load languages:', err)
      }
    }
    loadLanguages()
  }, [])

  useEffect(() => {
    async function runSearch() {
      setLoading(true)
      try {
        const response = await searchEntries(
          queryParam,
          langParam !== 'all' ? langParam : undefined,
          catParam !== 'all' ? catParam : undefined,
          letterParam !== 'all' ? letterParam : undefined,
          sortParam,
          kindParam
        )
        setResults(response.rows || [])
        setTotalCount(response.total || 0)
      } catch (err) {
        console.error('Search failed:', err)
        setResults([])
        setTotalCount(0)
      } finally {
        setLoading(false)
      }
    }
    runSearch()
  }, [queryParam, langParam, catParam, letterParam, sortParam, kindParam])

  const updateUrl = (newParams: Record<string, string | null>) => {
    const params = new URLSearchParams(searchParams)
    Object.entries(newParams).forEach(([key, value]) => {
      if (!value || value === 'all') params.delete(key)
      else params.set(key, value)
    })
    router.push(`/search?${params.toString()}`)
  }

  const activeLanguage = languages.find((l) => l.id === langParam)
  const groupedLanguages = groupLanguages(languages)

  return (
    <div className="min-h-screen bg-stone-50 pb-20 font-sans">
      <div className="bg-emerald-900 text-white py-20 relative overflow-hidden border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="max-w-3xl">
            <h1 className="text-4xl md:text-6xl font-black font-logo tracking-tight mb-3 uppercase">
              {langParam !== 'all' && activeLanguage ? `${activeLanguage.name} Dictionary` : 'Dictionary Search'}
            </h1>
            {langParam !== 'all' && activeLanguage && (
              <p className="text-emerald-100/90 mb-6 text-sm md:text-base max-w-2xl">{getLanguageNote(activeLanguage.code)}</p>
            )}
            <div className="relative group">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && updateUrl({ q: searchQuery })}
                placeholder="Search headword or meaning..."
                className="w-full bg-white/10 backdrop-blur-md border border-white/20 text-white px-6 py-4 rounded-xl focus:bg-white focus:text-stone-900 transition-all font-bold placeholder:text-emerald-100/40"
              />
            </div>
          </div>
        </div>
      </div>

      <div className="sticky top-20 z-20 bg-white border-b border-stone-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col gap-3 py-4">
            <div className="flex items-center gap-2 overflow-x-auto no-scrollbar">
              <button
                onClick={() => updateUrl({ letter: 'all' })}
                className={`px-3 py-2 rounded-lg text-[9px] font-black uppercase shrink-0 transition-all ${
                  letterParam === 'all' ? 'bg-emerald-900 text-white' : 'bg-stone-100 text-stone-500'
                }`}
              >
                A-Z
              </button>
              {ALPHABET.map((letter) => (
                <button
                  key={letter}
                  onClick={() => updateUrl({ letter })}
                  className={`w-8 h-8 flex items-center justify-center rounded-lg text-[10px] font-black shrink-0 transition-all ${
                    letterParam === letter ? 'bg-emerald-900 text-white' : 'hover:bg-emerald-50 text-stone-500'
                  }`}
                >
                  {letter}
                </button>
              ))}
            </div>

            <div className="flex flex-wrap items-center gap-3">
              <select
                value={langParam}
                onChange={(e) => updateUrl({ language: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="all">All Communities</option>
                {groupedLanguages.map((group) => (
                  <optgroup key={group.key} label={group.label}>
                    {group.languages.map((l) => (
                      <option key={l.id} value={l.id}>
                        {l.name}
                      </option>
                    ))}
                  </optgroup>
                ))}
              </select>

              <select
                value={catParam}
                onChange={(e) => updateUrl({ category: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="all">Any Category</option>
                {CATEGORIES.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>

              <select
                value={sortParam}
                onChange={(e) => updateUrl({ sort: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="headword_asc">Sort: Headword A-Z</option>
                <option value="newest">Sort: Newest</option>
                <option value="trust_desc">Sort: Trust Score</option>
              </select>

              <select
                value={kindParam}
                onChange={(e) => updateUrl({ kind: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="all">Words + Phrases</option>
                <option value="word">Words Only</option>
                <option value="phrase">Phrases Only</option>
              </select>

              <button
                onClick={() => router.push('/search')}
                className="text-[10px] font-black uppercase tracking-widest text-stone-500 hover:text-emerald-700"
              >
                Reset filters
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-6 flex items-center justify-between gap-4">
          <p className="text-xs font-black uppercase tracking-widest text-stone-500">
            {loading ? 'Searching...' : `Showing ${results.length} of ${totalCount} entries`}
          </p>
          <Link href="/explore" className="text-xs font-black uppercase tracking-widest text-emerald-700 hover:text-emerald-800">
            Back to Explore
          </Link>
        </div>

        {loading ? (
          <div className="py-20 text-center animate-pulse font-black text-stone-300 uppercase tracking-[0.4em] text-[10px]">
            Filtering...
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {results.map((entry) => (
              <Link href={`/entry/${entry.id}`} key={entry.id} className="group">
                <div className="bg-white p-8 rounded-[2rem] border border-stone-200 hover:border-emerald-600 transition-all h-full flex flex-col shadow-sm hover:shadow-xl">
                  <div className="flex justify-between items-start mb-4">
                    <h3 className="text-2xl font-black font-logo text-stone-900 group-hover:text-emerald-700 truncate mr-2">{entry.headword}</h3>
                    <div className="flex flex-col items-end gap-1 shrink-0">
                      <span className="text-[8px] font-black bg-emerald-50 text-emerald-700 px-2 py-1 rounded-md uppercase tracking-tighter border border-emerald-100">
                        {entry.language?.name}
                      </span>
                      {String(entry.part_of_speech || '').toLowerCase() === 'phrase' && (
                        <span className="text-[8px] font-black bg-stone-100 text-stone-700 px-2 py-1 rounded-md uppercase tracking-tighter border border-stone-200">
                          Phrase
                        </span>
                      )}
                    </div>
                  </div>
                  <p className="text-stone-500 text-sm font-medium line-clamp-3 mb-6 flex-grow leading-relaxed">{entry.primary_definition}</p>
                  <div className="pt-4 border-t border-stone-50 flex justify-between items-center">
                    <span className="text-[9px] font-black text-stone-400 uppercase tracking-widest">Score: {entry.trust_score}%</span>
                    <span className="text-emerald-600 text-xs font-black group-hover:translate-x-1 transition-transform">{'->'}</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}

        {!loading && results.length === 0 && (
          <div className="text-center py-24 border-2 border-dashed border-stone-200 rounded-[3rem] bg-white">
            <p className="text-stone-500 font-black uppercase tracking-widest text-xs mb-4">No entries match this filter set</p>
            <div className="flex flex-wrap items-center justify-center gap-3">
              <button
                onClick={() => router.push('/search')}
                className="px-5 py-2 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white font-black text-xs uppercase tracking-widest"
              >
                Reset and browse all
              </button>
              <Link
                href={kindParam === 'phrase' ? '/contribute?type=phrase' : '/contribute'}
                className="px-5 py-2 rounded-xl border border-emerald-200 text-emerald-800 hover:bg-emerald-50 font-black text-xs uppercase tracking-widest"
              >
                {kindParam === 'phrase' ? 'Contribute a Phrase' : 'Contribute a Word'}
              </Link>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
