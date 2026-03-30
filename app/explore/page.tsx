'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { getLanguages } from '@/lib/api/languages'
import { supabase } from '@/lib/supabase'

type LanguageItem = {
  id: string
  code?: string | null
  name: string
  native_name?: string | null
}

const categories = [
  { id: 'family', name: 'Family & Relationships', icon: 'Family' },
  { id: 'food', name: 'Food & Cooking', icon: 'Food' },
  { id: 'home', name: 'Home & Daily Life', icon: 'Home' },
  { id: 'nature', name: 'Agriculture & Nature', icon: 'Nature' },
  { id: 'culture', name: 'Culture & Traditions', icon: 'Culture' },
  { id: 'business', name: 'Work & Business', icon: 'Business' },
  { id: 'tech', name: 'Technology & Modern Life', icon: 'Tech' },
  { id: 'health', name: 'Health & Body', icon: 'Health' },
  { id: 'education', name: 'Education', icon: 'Education' },
  { id: 'law', name: 'Law & Governance', icon: 'Law' }
]

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

export default function ExplorePage() {
  const router = useRouter()
  const [languages, setLanguages] = useState<LanguageItem[]>([])
  const [loading, setLoading] = useState(true)
  const [languageCounts, setLanguageCounts] = useState<Record<string, number>>({})
  const [categoryCounts, setCategoryCounts] = useState<Record<string, number>>({})
  const [searchQuery, setSearchQuery] = useState('')
  const [languageFilter, setLanguageFilter] = useState('all')
  const [categoryFilter, setCategoryFilter] = useState('all')
  const [entryKind, setEntryKind] = useState<'all' | 'word' | 'phrase'>('all')

  const goToSearch = (params: { q?: string; language?: string; category?: string; letter?: string; kind?: 'all' | 'word' | 'phrase' }) => {
    const query = new URLSearchParams()
    if (params.q && params.q.trim()) query.set('q', params.q.trim())
    if (params.language && params.language !== 'all') query.set('language', params.language)
    if (params.category && params.category !== 'all') query.set('category', params.category)
    if (params.letter && params.letter !== 'all') query.set('letter', params.letter)
    if (params.kind && params.kind !== 'all') query.set('kind', params.kind)
    router.push(`/search?${query.toString()}`)
  }

  useEffect(() => {
    async function loadData() {
      try {
        const langs = (await getLanguages()) as LanguageItem[]
        setLanguages(langs || [])

        const languageCountPairs = await Promise.all(
          (langs || []).map(async (lang) => {
            const { count } = await supabase
              .from('entries')
              .select('id', { count: 'exact', head: true })
              .eq('language_id', lang.id)
            return [lang.id, count || 0] as const
          })
        )

        const categoryCountPairs = await Promise.all(
          categories.map(async (category) => {
            const { count } = await supabase
              .from('entries')
              .select('id', { count: 'exact', head: true })
              .eq('category', category.id)
            return [category.id, count || 0] as const
          })
        )

        setLanguageCounts(Object.fromEntries(languageCountPairs))
        setCategoryCounts(Object.fromEntries(categoryCountPairs))
      } catch (err) {
        console.error('Failed to load data:', err)
      } finally {
        setLoading(false)
      }
    }
    loadData()
  }, [])

  if (loading) {
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-600"></div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-stone-50 pb-20">
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">Explore Dictionary</h1>
          <p className="text-xl text-emerald-100 max-w-2xl mx-auto font-medium opacity-90 leading-relaxed">
            Dictionary mode. Search directly, then refine by language, letter, topic, and whether you want words or phrases.
          </p>
          <div className="mt-10 bg-white/10 border border-white/20 rounded-2xl p-4 md:p-5 max-w-5xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-[minmax(0,1fr)_170px_170px_170px_auto] gap-3">
              <input
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && goToSearch({ q: searchQuery, language: languageFilter, category: categoryFilter, kind: entryKind })}
                placeholder="Search headword or meaning..."
                className="px-4 py-3 rounded-xl bg-white text-stone-900 font-semibold placeholder:text-stone-400"
              />
              <select
                value={languageFilter}
                onChange={(e) => setLanguageFilter(e.target.value)}
                className="px-4 py-3 rounded-xl bg-white text-stone-900 font-semibold"
              >
                <option value="all">All languages</option>
                {languages.map((lang) => (
                  <option key={lang.id} value={lang.id}>
                    {lang.name}
                  </option>
                ))}
              </select>
              <select
                value={categoryFilter}
                onChange={(e) => setCategoryFilter(e.target.value)}
                className="px-4 py-3 rounded-xl bg-white text-stone-900 font-semibold"
              >
                <option value="all">All topics</option>
                {categories.map((category) => (
                  <option key={category.id} value={category.id}>
                    {category.name}
                  </option>
                ))}
              </select>
              <select
                value={entryKind}
                onChange={(e) => setEntryKind(e.target.value as 'all' | 'word' | 'phrase')}
                className="px-4 py-3 rounded-xl bg-white text-stone-900 font-semibold"
              >
                <option value="all">Words + Phrases</option>
                <option value="word">Words only</option>
                <option value="phrase">Phrases only</option>
              </select>
              <button
                onClick={() => goToSearch({ q: searchQuery, language: languageFilter, category: categoryFilter, kind: entryKind })}
                className="w-full xl:w-auto px-6 py-3 rounded-xl bg-emerald-500 hover:bg-emerald-400 transition-colors font-black whitespace-nowrap"
              >
                Search
              </button>
            </div>
          </div>
          <div className="mt-6 flex flex-wrap justify-center gap-2">
            {ALPHABET.map((letter) => (
              <button
                key={letter}
                onClick={() => goToSearch({ letter, language: languageFilter, category: categoryFilter, kind: entryKind })}
                className="w-8 h-8 rounded-md bg-white/10 border border-white/20 hover:bg-white/20 text-xs font-black"
              >
                {letter}
              </button>
            ))}
          </div>
          <div className="mt-6 flex flex-wrap justify-center gap-3 text-sm">
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search?language=all&category=all&letter=all">
              Full Dictionary
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search?kind=phrase">
              Browse Phrases
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/search?letter=a">
              Browse A-Z
            </Link>
            <Link className="px-4 py-2 rounded-full bg-white/10 hover:bg-white/20 border border-white/20" href="/translate">
              Go to Translate
            </Link>
          </div>
        </div>
      </div>

      <section className="py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center gap-4 mb-12">
            <h2 className="text-4xl font-black text-gray-900 font-logo">By Community</h2>
            <div className="h-px flex-1 bg-stone-200"></div>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            {languages.map((lang) => (
              <Link href={`/search?language=${lang.id}`} key={lang.id} className="group">
                <div className="bg-white rounded-[2rem] p-6 border border-stone-200 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300">
                  <div className="flex justify-between items-start mb-6">
                    <div className="w-12 h-12 bg-stone-50 rounded-xl flex items-center justify-center text-xs font-black group-hover:bg-emerald-50 transition-colors">
                      KE
                    </div>
                    <span className="text-[10px] font-black text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full uppercase tracking-[0.15em]">
                      {lang.code || 'KEN'}
                    </span>
                  </div>
                  <h3 className="text-xl font-black text-gray-900 mb-1 font-logo group-hover:text-emerald-600 transition-colors">
                    {lang.name}
                  </h3>
                  <p className="text-stone-400 text-xs font-bold italic mb-6">{lang.native_name}</p>
                  <div className="pt-4 border-t border-stone-100 flex justify-between items-center">
                    <span className="text-xs font-black text-stone-400 uppercase tracking-widest">
                      <b className="text-emerald-600 text-sm">{languageCounts[lang.id] || 0}</b> Records
                    </span>
                    <span className="text-emerald-500 font-bold group-hover:translate-x-1 transition-transform">{'->'}</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="py-20 bg-emerald-50/50 border-y border-stone-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center gap-4 mb-12">
            <h2 className="text-4xl font-black text-gray-900 font-logo">By Topic</h2>
            <div className="h-px flex-1 bg-emerald-100"></div>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
            {categories.map((category) => (
              <Link href={`/search?category=${category.id}`} key={category.id} className="group">
                <div className="bg-white rounded-[2rem] p-8 text-center border border-stone-100 shadow-sm hover:border-emerald-200 hover:shadow-xl hover:-translate-y-1 transition-all duration-300 h-full flex flex-col items-center justify-center">
                  <span className="text-xl block mb-4 group-hover:scale-110 transition-transform duration-500">{category.icon}</span>
                  <h3 className="text-sm font-black text-gray-800 group-hover:text-emerald-600 transition-colors tracking-tight leading-tight">
                    {category.name}
                  </h3>
                  <div className="mt-3 inline-block bg-stone-50 px-3 py-1 rounded-full border border-stone-100">
                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-tighter">
                      {categoryCounts[category.id] || 0} words
                    </p>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="py-24">
        <div className="max-w-5xl mx-auto px-4">
          <div className="bg-emerald-900 rounded-[3rem] p-12 md:p-20 text-white shadow-2xl relative overflow-hidden text-center">
            <div className="relative z-10">
              <h2 className="text-4xl md:text-6xl font-black mb-8 font-logo tracking-tight">
                Be a Custodian <br className="hidden md:block" /> of Culture
              </h2>
              <p className="text-emerald-100 mb-12 text-xl font-medium opacity-90 max-w-2xl mx-auto leading-relaxed">
                Our languages are only as alive as our willingness to share them.
                Is your grandmother&apos;s favorite saying here?
              </p>
              <div className="flex flex-wrap items-center justify-center gap-3">
                <Link href="/contribute">
                  <button className="bg-white text-emerald-900 px-8 py-5 rounded-2xl hover:bg-emerald-50 transition-all font-black text-lg shadow-xl hover:scale-105 active:scale-95 flex items-center gap-4 mx-auto">
                    <span>+</span> Add a Word
                  </button>
                </Link>
                <Link href="/contribute?type=phrase">
                  <button className="bg-emerald-800 text-white px-8 py-5 rounded-2xl hover:bg-emerald-700 transition-all font-black text-lg shadow-xl hover:scale-105 active:scale-95 flex items-center gap-4 mx-auto border border-emerald-500/40">
                    <span>+</span> Add a Phrase
                  </button>
                </Link>
              </div>
            </div>
            <div className="absolute top-0 left-0 w-full h-full opacity-10 pointer-events-none">
              <div className="absolute -top-24 -left-24 w-96 h-96 border-[40px] border-white rounded-full"></div>
              <div className="absolute -bottom-24 -right-24 w-64 h-64 bg-white rounded-full"></div>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}
