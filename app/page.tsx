'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useState, useEffect, Suspense } from 'react'
import { getUserProfile } from '@/lib/api/users'
import { getLanguages } from '@/lib/api/languages'
import { getEntries } from '@/lib/api/entries'
import { useRouter, useSearchParams } from 'next/navigation' 
import Link from 'next/link'

function HomeContent() {
  const { user } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()
  
  const [searchQuery, setSearchQuery] = useState(searchParams.get('q') || '')
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [languageCounts, setLanguageCounts] = useState<Record<string, number>>({})

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault()
    if (searchQuery.trim()) {
      router.push(`/search?q=${encodeURIComponent(searchQuery.trim())}`)
    }
  }

  useEffect(() => {
    let isMounted = true
    async function loadData() {
      try {
        const [langs, entries] = await Promise.all([
          getLanguages(),
          getEntries({})
        ])
        
        if (isMounted) {
          setAllLanguages(langs)
          const counts: Record<string, number> = {}
          entries?.forEach((entry: any) => {
            if (entry.language_id) {
              counts[entry.language_id] = (counts[entry.language_id] || 0) + 1
            }
          })
          setLanguageCounts(counts)
        }
      } catch (err) {
        console.error('Failed to load data:', err)
      } finally {
        if (isMounted) setLoading(false)
      }
    }
    loadData()
    return () => { isMounted = false }
  }, [user])

  return (
    <div className="min-h-screen bg-stone-50 font-sans">
      {/* Hero: Matches Archive Header DNA */}
      <div className="relative overflow-hidden bg-emerald-900 text-white py-24 md:py-32 border-b border-emerald-800">
        <div className="max-w-5xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-6xl md:text-8xl font-black mb-8 tracking-tight font-logo">
            Kamusi Yetu
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 mb-12 opacity-90 font-medium max-w-2xl mx-auto">
            Kenya&apos;s Living Dictionary. Built by the community.
          </p>
          <div className="max-w-2xl mx-auto">
            <form onSubmit={handleSearch} className="relative group">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search a word in any language..."
                className="w-full px-8 py-6 rounded-2xl bg-white text-stone-900 text-lg shadow-2xl focus:outline-none transition-all font-bold placeholder:text-stone-300 placeholder:font-medium"
              />
              <button type="submit" className="absolute right-3 top-1/2 -translate-y-1/2 bg-emerald-700 text-white px-8 py-3.5 rounded-xl hover:bg-emerald-600 font-black text-xs uppercase tracking-widest transition-all shadow-lg">
                Search
              </button>
            </form>
          </div>
        </div>
        
        {/* Decorative DNA */}
        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[600px] h-[600px] border-[60px] border-white rounded-full"></div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 py-20">
        {/* Quick Actions */}
        <div className="grid md:grid-cols-2 gap-8 mb-24">
           <Link href="/contribute" className="group bg-white rounded-[2.5rem] p-12 shadow-sm border border-stone-200 hover:border-emerald-500 hover:shadow-2xl transition-all duration-500">
              <div className="text-4xl mb-8 group-hover:scale-110 transition-transform duration-500">✍️</div>
              <h3 className="text-3xl font-black text-stone-900 mb-4 font-logo">Add Word</h3>
              <p className="text-stone-500 text-lg leading-relaxed font-medium">Preserve your heritage. Contribute definitions and usage examples to the archive.</p>
           </Link>
           <Link href="/categories" className="group bg-white rounded-[2.5rem] p-12 shadow-sm border border-stone-200 hover:border-emerald-500 hover:shadow-2xl transition-all duration-500">
              <div className="text-4xl mb-8 group-hover:scale-110 transition-transform duration-500">🌍</div>
              <h3 className="text-3xl font-black text-stone-900 mb-4 font-logo">Explore Topics</h3>
              <p className="text-stone-500 text-lg leading-relaxed font-medium">Discover the richness of Kenya through professionally organized linguistic categories.</p>
           </Link>
        </div>

        {/* Featured Languages */}
        <div className="bg-white rounded-[3rem] shadow-sm border border-stone-200 p-10 md:p-16">
          <div className="flex justify-between items-end mb-12">
            <div>
              <h2 className="text-4xl font-black text-stone-900 font-logo tracking-tight">Featured Languages</h2>
              <div className="h-1.5 w-12 bg-emerald-500 mt-4 rounded-full"></div>
            </div>
            <Link href="/languages" className="text-emerald-700 font-black text-xs uppercase tracking-[0.2em] hover:text-emerald-500 transition-colors">View All →</Link>
          </div>
          
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {allLanguages.slice(0, 8).map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="p-8 border border-stone-100 rounded-[2rem] bg-stone-50/50 hover:bg-white hover:border-emerald-500 hover:shadow-xl transition-all duration-500 text-center">
                  <p className="text-xl font-black text-stone-900 group-hover:text-emerald-900 transition-colors">{lang.name}</p>
                  <p className="text-emerald-600 text-[10px] font-black mt-3 uppercase tracking-widest">
                    {languageCounts[lang.id] || 0} Records
                  </p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

// Final Export with Suspense to fix Vercel Build Error
export default function HomePage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-stone-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-900"></div>
      </div>
    }>
      <HomeContent />
    </Suspense>
  )
}