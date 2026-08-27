'use client'

import { useEffect, useState } from 'react'
import { getLanguages } from '@/lib/api/languages'
import { getEntries } from '@/lib/api/entries'
import Link from 'next/link'

export default function LanguagesPage() {
  const [languages, setLanguages] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [languageCounts, setLanguageCounts] = useState<Record<string, number>>({})

  useEffect(() => {
    async function loadData() {
      try {
        const langs = await getLanguages()
        setLanguages(langs)

        const entries = await getEntries({})
        const counts: Record<string, number> = {}
        entries?.forEach((entry: any) => {
          counts[entry.language_id] = (counts[entry.language_id] || 0) + 1
        })
        setLanguageCounts(counts)
      } catch (err) {
        console.error('Failed to load languages:', err)
      } finally {
        setLoading(false)
      }
    }
    loadData()
  }, [])

  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      {/* Hero Section */}
      <div className="bg-heritage-dark text-white py-24 border-b border-heritage-darker">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-display tracking-tight">
            Our Languages
          </h1>
          <p className="text-xl text-white/90 max-w-2xl mx-auto font-medium opacity-90">
            Explore the rich tapestry of Kenya's languages, 
            preserved by the community.
          </p>
        </div>
      </div>

      {/* Content Area */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10">
        {loading ? (
          <div className="bg-neutral-100 rounded-[2.5rem] shadow-soft p-20 text-center border border-accent-200">
            <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-accent-300 mx-auto mb-6"></div>
            <p className="text-neutral-500 font-black uppercase tracking-widest text-xs">Gathering Dialects...</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {languages.map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="bg-accent-50 rounded-[2rem] shadow-soft border border-accent-300/30 p-8 h-full flex flex-col hover:shadow-lg hover:-translate-y-2 transition-all duration-300">
                  <div className="flex items-start justify-between mb-8">
                    <div className="flex-1">
                      <h3 className="text-3xl font-black text-heritage-dark mb-2 font-display group-hover:text-accent-700 transition-colors">
                        {lang.name}
                      </h3>
                      {lang.native_name && lang.native_name !== lang.name && (
                        <p className="text-neutral-600 font-bold italic text-sm">
                          &ldquo;{lang.native_name}&rdquo;
                        </p>
                      )}
                    </div>
                    <div className="w-14 h-14 bg-accent-100 rounded-2xl flex items-center justify-center text-3xl group-hover:bg-accent-200 transition-colors">
                      🗣️
                    </div>
                  </div>
                  
                  <div className="mt-auto">
                    <div className="flex items-center justify-between py-4 border-t border-accent-100">
                      <span className="text-xs font-black text-neutral-600 uppercase tracking-widest">Database</span>
                      <span className="font-display font-black text-accent-700 text-xl">
                        {languageCounts[lang.id] || 0} <span className="text-xs text-neutral-600 tracking-normal font-sans">words</span>
                      </span>
                    </div>
                    
                    <div className="mt-4 flex items-center gap-2 text-accent-700 font-black text-sm uppercase tracking-tighter group-hover:gap-4 transition-all">
                      Open Dictionary <span>→</span>
                    </div>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}

        {/* Empty State */}
        {!loading && languages.length === 0 && (
          <div className="text-center py-20 bg-neutral-100 rounded-[2.5rem] border-2 border-dashed border-accent-200">
            <div className="text-6xl mb-6">🌍</div>
            <h3 className="text-2xl font-black text-heritage-dark font-display mb-2">No Languages Found</h3>
            <p className="text-neutral-500 mb-8 max-w-xs mx-auto">Be the pioneer who adds the first linguistic data for your community.</p>
            <Link href="/contribute">
              <button className="bg-heritage-dark text-white px-10 py-4 rounded-2xl font-black hover:bg-heritage-darker transition shadow-soft">
                Add a New Language
              </button>
            </Link>
          </div>
        )}
      </div>
    </div>
  )
}