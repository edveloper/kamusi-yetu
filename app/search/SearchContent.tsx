'use client'

import { useState, useEffect } from 'react'
import { useSearchParams, useRouter } from 'next/navigation'
import Link from 'next/link'
import { searchEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'

const CATEGORIES = [
  { id: 'family', name: 'Family', icon: '👨‍👩‍👧‍👦' },
  { id: 'food', name: 'Food', icon: '🍲' },
  { id: 'home', name: 'Home', icon: '🏠' },
  { id: 'nature', name: 'Nature', icon: '🌾' },
  { id: 'culture', name: 'Culture', icon: '🏛️' },
  { id: 'business', name: 'Work', icon: '💼' },
  { id: 'tech', name: 'Tech', icon: '📱' },
  { id: 'health', name: 'Health', icon: '🏥' },
  { id: 'education', name: 'Education', icon: '🎓' },
  { id: 'law', name: 'Law', icon: '⚖️' },
]

const ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")

export default function SearchContent() {
  const searchParams = useSearchParams()
  const router = useRouter()
  
  const queryParam = searchParams.get('q') || ''
  const langParam = searchParams.get('language') || 'all'
  const catParam = searchParams.get('category') || 'all'
  const letterParam = searchParams.get('letter') || 'all'

  const [searchQuery, setSearchQuery] = useState(queryParam)
  const [results, setResults] = useState<any[]>([])
  const [languages, setLanguages] = useState<any[]>([])
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setLanguages(langs)
      } catch (err) {
        console.error('Failed to load languages:', err)
      }
    }
    loadLanguages()
  }, [])

  useEffect(() => {
    async function search() {
      setLoading(true)
      try {
        const data = await searchEntries(
          queryParam,
          langParam !== 'all' ? langParam : undefined,
          catParam !== 'all' ? catParam : undefined,
          letterParam !== 'all' ? letterParam : undefined
        )
        setResults(data || [])
      } catch (err) {
        console.error('Search failed:', err)
      } finally {
        setLoading(false)
      }
    }
    search()
  }, [queryParam, langParam, catParam, letterParam])

  const updateUrl = (newParams: Record<string, string | null>) => {
    const params = new URLSearchParams(searchParams)
    Object.entries(newParams).forEach(([key, value]) => {
      if (!value || value === 'all') params.delete(key)
      else params.set(key, value)
    })
    router.push(`/search?${params.toString()}`)
  }

  return (
    <div className="min-h-screen bg-stone-50 pb-20 font-sans">
      {/* Search Hero */}
      <div className="bg-emerald-900 text-white py-20 relative overflow-hidden border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="max-w-3xl">
            <h1 className="text-4xl md:text-6xl font-black font-logo tracking-tight mb-6 uppercase">
              {langParam !== 'all' 
                ? `${languages.find(l => l.id === langParam)?.name} Lexicon` 
                : 'The Archive'}
            </h1>
            <div className="relative group">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && updateUrl({ q: searchQuery })}
                placeholder="Search words..."
                className="w-full bg-white/10 backdrop-blur-md border border-white/20 text-white px-6 py-4 rounded-xl focus:bg-white focus:text-stone-900 transition-all font-bold placeholder:text-emerald-100/30"
              />
            </div>
          </div>
        </div>
      </div>

      {/* COMPACT Filter Bar */}
      <div className="sticky top-20 z-20 bg-white border-b border-stone-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row md:items-center justify-between py-4 gap-4">
            
            {/* 1. Alphabet Ribbon - Now more compact */}
            <div className="flex items-center gap-2 overflow-x-auto no-scrollbar py-1 flex-1">
              <button
                onClick={() => updateUrl({ letter: 'all' })}
                className={`px-3 py-2 rounded-lg text-[9px] font-black uppercase shrink-0 transition-all ${
                  letterParam === 'all' ? 'bg-emerald-900 text-white' : 'bg-stone-100 text-stone-400'
                }`}
              >
                A-Z
              </button>
              {ALPHABET.map((letter) => (
                <button
                  key={letter}
                  onClick={() => updateUrl({ letter: letter })}
                  className={`w-8 h-8 flex items-center justify-center rounded-lg text-[10px] font-black shrink-0 transition-all ${
                    letterParam === letter ? 'bg-emerald-900 text-white' : 'hover:bg-emerald-50 text-stone-400'
                  }`}
                >
                  {letter}
                </button>
              ))}
            </div>

            {/* 2. Consolidated Selectors */}
            <div className="flex items-center gap-3 shrink-0 border-t md:border-t-0 pt-3 md:pt-0">
              <select 
                value={langParam}
                onChange={(e) => updateUrl({ language: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="all">All Communities</option>
                {languages.map(l => <option key={l.id} value={l.id}>{l.name}</option>)}
              </select>

              <select 
                value={catParam}
                onChange={(e) => updateUrl({ category: e.target.value })}
                className="bg-stone-50 border border-stone-200 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
              >
                <option value="all">Any Category</option>
                {CATEGORIES.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
          </div>
        </div>
      </div>

      {/* Results Section */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {loading ? (
          <div className="py-20 text-center animate-pulse font-black text-stone-300 uppercase tracking-[0.4em] text-[10px]">Filtering...</div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {results.map((entry) => (
              <Link href={`/entry/${entry.id}`} key={entry.id} className="group">
                <div className="bg-white p-8 rounded-[2rem] border border-stone-200 hover:border-emerald-600 transition-all h-full flex flex-col shadow-sm hover:shadow-xl">
                  <div className="flex justify-between items-start mb-4">
                    <h3 className="text-2xl font-black font-logo text-stone-900 group-hover:text-emerald-700 truncate mr-2">{entry.headword}</h3>
                    <span className="text-[8px] font-black bg-emerald-50 text-emerald-700 px-2 py-1 rounded-md uppercase tracking-tighter shrink-0 border border-emerald-100">
                      {entry.language?.name}
                    </span>
                  </div>
                  <p className="text-stone-500 text-sm font-medium line-clamp-3 mb-6 flex-grow leading-relaxed">
                    {entry.primary_definition}
                  </p>
                  <div className="pt-4 border-t border-stone-50 flex justify-between items-center">
                    <span className="text-[9px] font-black text-stone-300 uppercase tracking-widest">Score: {entry.trust_score}%</span>
                    <span className="text-emerald-600 text-xs font-black group-hover:translate-x-1 transition-transform">→</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}

        {!loading && results.length === 0 && (
          <div className="text-center py-40 border-2 border-dashed border-stone-200 rounded-[3rem]">
             <p className="text-stone-400 font-bold uppercase tracking-widest text-xs">No records found in this section</p>
          </div>
        )}
      </div>
    </div>
  )
}