'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useState, useEffect, Suspense } from 'react'
import { getLanguages } from '@/lib/api/languages'
import { getLatestEntries, getWordOfTheDay } from '@/lib/api/entries'
import { useRouter } from 'next/navigation' 
import Link from 'next/link'

function HomeContent() {
  const router = useRouter()
  const [searchQuery, setSearchQuery] = useState('')
  const [loading, setLoading] = useState(true)
  const [wotd, setWotd] = useState<any>(null)
  const [latest, setLatest] = useState<any[]>([])
  const [languages, setLanguages] = useState<any[]>([])

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault()
    if (searchQuery.trim()) {
      router.push(`/search?q=${encodeURIComponent(searchQuery.trim())}`)
    }
  }

  useEffect(() => {
    async function loadPulse() {
      try {
        const [word, recent, langs] = await Promise.all([
          getWordOfTheDay(),
          getLatestEntries(),
          getLanguages()
        ])
        setWotd(word)
        setLatest(recent)
        setLanguages(langs)
      } catch (err) {
        console.error('Pulse load failed:', err)
      } finally {
        setLoading(false)
      }
    }
    loadPulse()
  }, [])

  if (loading) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center">
      <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-900"></div>
    </div>
  )

  return (
    <div className="min-h-screen bg-stone-50 font-sans pb-20">
      {/* Hero Section */}
      <div className="relative overflow-hidden bg-emerald-900 text-white py-24 md:py-32 border-b border-emerald-800">
        <div className="max-w-5xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 tracking-tight font-logo uppercase">
            Kamusi Yetu
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 mb-12 opacity-80 font-medium max-w-2xl mx-auto">
            Kenya’s community-powered linguistic archive.
          </p>
          <form onSubmit={handleSearch} className="max-w-2xl mx-auto relative group">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search the archive..."
              className="w-full px-8 py-6 rounded-2xl bg-white text-stone-900 text-lg shadow-2xl focus:outline-none font-bold placeholder:text-stone-300"
            />
            <button type="submit" className="absolute right-3 top-1/2 -translate-y-1/2 bg-emerald-800 text-white px-8 py-3.5 rounded-xl hover:bg-black font-black text-xs uppercase tracking-widest transition-all">
              Search
            </button>
          </form>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 -mt-12 relative z-20">
        <div className="grid lg:grid-cols-3 gap-8">
          
          {/* Word of the Day - The "Big Feature" */}
          <div className="lg:col-span-2">
            <Link href={wotd ? `/entry/${wotd.id}` : '#'}>
              <div className="bg-white rounded-[3rem] p-10 md:p-16 shadow-xl border border-stone-100 hover:border-emerald-500 transition-all group h-full">
                <div className="flex items-center gap-4 mb-8">
                  <span className="bg-emerald-100 text-emerald-700 px-4 py-1 rounded-full text-[10px] font-black uppercase tracking-widest">
                    Word of the Day
                  </span>
                  <div className="h-px flex-1 bg-stone-100"></div>
                </div>
                <h2 className="text-5xl md:text-7xl font-black text-stone-900 mb-6 font-logo group-hover:text-emerald-900 transition-colors">
                  {wotd?.headword || 'Salama'}
                </h2>
                <p className="text-emerald-600 font-black uppercase tracking-widest text-sm mb-8">
                  {wotd?.language?.name || 'Swahili'}
                </p>
                <p className="text-stone-500 text-xl md:text-2xl leading-relaxed font-medium line-clamp-3">
                  {wotd?.primary_definition || 'A state of peace, safety, and well-being.'}
                </p>
              </div>
            </Link>
          </div>

          {/* Latest Additions - "The Ledger" */}
          <div className="space-y-6">
            <div className="bg-stone-900 rounded-[3rem] p-10 text-white shadow-xl h-full">
              <h3 className="text-xs font-black uppercase tracking-[0.3em] mb-8 text-emerald-400">Latest Additions</h3>
              <div className="space-y-8">
                {latest.map((entry) => (
                  <Link key={entry.id} href={`/entry/${entry.id}`} className="block group">
                    <div className="border-b border-white/10 pb-6 group-last:border-0">
                      <p className="text-xl font-bold mb-1 group-hover:text-emerald-400 transition-colors">{entry.headword}</p>
                      <p className="text-[10px] font-black text-stone-500 uppercase tracking-widest mb-3">
                        {entry.language?.name}
                      </p>
                      <p className="text-sm text-stone-400 line-clamp-1 opacity-70 italic">
                        &ldquo;{entry.primary_definition}&rdquo;
                      </p>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          </div>
        </div>

        {/* Explore Gateway */}
        <div className="mt-24">
          <div className="flex items-center gap-6 mb-12">
            <h2 className="text-2xl font-black text-stone-900 font-logo uppercase tracking-tight">Communities</h2>
            <div className="h-px flex-1 bg-stone-200"></div>
            <Link href="/explore" className="text-[10px] font-black uppercase tracking-widest text-emerald-600">View All</Link>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
            {languages.slice(0, 6).map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="bg-white border border-stone-200 p-6 rounded-2xl text-center hover:border-emerald-500 hover:shadow-lg transition-all">
                  <p className="font-black text-stone-800 group-hover:text-emerald-700">{lang.name}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

export default function HomePage() {
  return (
    <Suspense fallback={<div className="min-h-screen bg-stone-50" />}>
      <HomeContent />
    </Suspense>
  )
}