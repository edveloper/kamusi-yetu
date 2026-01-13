'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useState, useEffect } from 'react'
import { getUserProfile, updateUserProfile } from '@/lib/api/users'
import { getLanguages } from '@/lib/api/languages'
import { getEntries } from '@/lib/api/entries' // REAL DATA FETCH
import { useRouter, useSearchParams } from 'next/navigation' 
import Link from 'next/link'
import LanguageSelector from '@/components/LanguageSelector'

export default function HomePage() {
  const { user } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()
  
  const [searchQuery, setSearchQuery] = useState(searchParams.get('q') || '')
  const [userLanguages, setUserLanguages] = useState<string[]>([])
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [showLanguageSelector, setShowLanguageSelector] = useState(false)
  const [loading, setLoading] = useState(true)
  
  // Real counts state
  const [languageCounts, setLanguageCounts] = useState<Record<string, number>>({})
  const [totalWordCount, setTotalWordCount] = useState(0)

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
          getEntries({}) // REAL DATA
        ])
        
        if (isMounted) {
          setAllLanguages(langs)
          setTotalWordCount(entries?.length || 0)

          // Calculate REAL counts exactly like your Explore page
          const counts: Record<string, number> = {}
          entries?.forEach((entry: any) => {
            if (entry.language_id) {
              counts[entry.language_id] = (counts[entry.language_id] || 0) + 1
            }
          })
          setLanguageCounts(counts)

          if (user) {
            const profile = await getUserProfile(user.id)
            setUserLanguages(profile.languages || [])
          }
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

  const getLanguageName = (languageId: string) => {
    const lang = allLanguages.find(l => l.id === languageId)
    return lang?.name || languageId
  }

  return (
    <div className="min-h-screen bg-stone-50">
      {/* Hero */}
      <div className="relative overflow-hidden bg-gradient-to-br from-emerald-900 to-emerald-700 text-white py-20 md:py-32">
        <div className="max-w-5xl mx-auto px-4 text-center relative z-10">
          <h1 className="text-5xl md:text-7xl font-black mb-6 tracking-tight font-logo">
            Kamusi Yetu
          </h1>
          <p className="text-xl md:text-2xl text-emerald-100 mb-12 opacity-90 font-medium max-w-2xl mx-auto">
            Kenya&apos;s Living Dictionary. Built by you.
          </p>
          <div className="max-w-2xl mx-auto">
            <form onSubmit={handleSearch} className="relative md:scale-110 transform transition-transform duration-300">
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search a word in any language..."
                className="w-full px-8 py-5 rounded-2xl bg-white text-gray-900 text-lg shadow-2xl focus:outline-none focus:ring-4 focus:ring-emerald-500/30"
              />
              <button type="submit" className="absolute right-3 top-1/2 -translate-y-1/2 bg-emerald-600 text-white px-8 py-3 rounded-xl hover:bg-emerald-500 font-bold shadow-lg">
                Search
              </button>
            </form>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 py-16">
        {/* Quick Actions */}
        <div className="grid md:grid-cols-2 gap-8 mb-20">
           <Link href="/contribute" className="group bg-white rounded-3xl p-10 shadow-sm border border-gray-200 hover:border-emerald-500 hover:shadow-2xl transition-all">
              <div className="text-4xl mb-6">✍️</div>
              <h3 className="text-3xl font-black text-gray-900 mb-3">Add a Word</h3>
              <p className="text-gray-500 text-lg leading-relaxed">Preserve your heritage. Contribute definitions and usage examples.</p>
           </Link>
           <Link href="/categories" className="group bg-white rounded-3xl p-10 shadow-sm border border-gray-200 hover:border-emerald-500 hover:shadow-2xl transition-all">
              <div className="text-4xl mb-6">🌍</div>
              <h3 className="text-3xl font-black text-gray-900 mb-3">Explore Topics</h3>
              <p className="text-gray-500 text-lg leading-relaxed">Discover the richness of Kenya through organized categories.</p>
           </Link>
        </div>

        {/* Real Data Featured Languages */}
        <div className="bg-white rounded-[2.5rem] shadow-sm border border-gray-200 p-8 md:p-12">
          <div className="flex justify-between items-end mb-10">
            <div>
              <h2 className="text-3xl font-black text-gray-900 font-logo">Featured Languages</h2>
              <div className="h-1.5 w-12 bg-emerald-500 mt-2 rounded-full"></div>
            </div>
            <Link href="/languages" className="text-emerald-700 font-bold hover:underline">View All →</Link>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {allLanguages.slice(0, 8).map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="p-6 border border-gray-100 rounded-2xl bg-stone-50/50 hover:bg-white hover:border-emerald-500 hover:shadow-xl transition-all text-center">
                  <p className="text-xl font-bold text-gray-900 group-hover:text-emerald-700">{lang.name}</p>
                  <p className="text-emerald-600 text-sm font-bold mt-2 uppercase tracking-tight">
                    {languageCounts[lang.id] || 0} words
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