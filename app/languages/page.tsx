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
    <div className="min-h-screen bg-stone-50 pb-20">
      {/* Hero Section */}
      <div className="bg-emerald-900 text-white py-24 border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-5xl md:text-7xl font-black mb-6 font-logo tracking-tight">
            Our Languages
          </h1>
          <p className="text-xl text-emerald-100 max-w-2xl mx-auto font-medium opacity-90">
            Explore the rich tapestry of Kenya's 40+ linguistic traditions, 
            preserved by the community.
          </p>
        </div>
      </div>

      {/* Content Area */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10">
        {loading ? (
          <div className="bg-white rounded-[2.5rem] shadow-xl p-20 text-center border border-stone-200">
            <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-emerald-600 mx-auto mb-6"></div>
            <p className="text-stone-500 font-black uppercase tracking-widest text-xs">Gathering Dialects...</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {languages.map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`} className="group">
                <div className="bg-white rounded-[2rem] shadow-sm border border-stone-200 p-8 h-full flex flex-col hover:shadow-2xl hover:-translate-y-2 transition-all duration-300">
                  <div className="flex items-start justify-between mb-8">
                    <div className="flex-1">
                      <h3 className="text-3xl font-black text-gray-900 mb-2 font-logo group-hover:text-emerald-600 transition-colors">
                        {lang.name}
                      </h3>
                      {lang.native_name && lang.native_name !== lang.name && (
                        <p className="text-stone-400 font-bold italic text-sm">
                          &ldquo;{lang.native_name}&rdquo;
                        </p>
                      )}
                    </div>
                    <div className="w-14 h-14 bg-stone-50 rounded-2xl flex items-center justify-center text-3xl group-hover:bg-emerald-50 transition-colors">
                      🗣️
                    </div>
                  </div>
                  
                  <div className="mt-auto">
                    <div className="flex items-center justify-between py-4 border-t border-stone-100">
                      <span className="text-xs font-black text-stone-400 uppercase tracking-widest">Database</span>
                      <span className="font-logo font-black text-emerald-600 text-xl">
                        {languageCounts[lang.id] || 0} <span className="text-xs text-stone-400 tracking-normal font-sans">words</span>
                      </span>
                    </div>
                    
                    <div className="mt-4 flex items-center gap-2 text-emerald-600 font-black text-sm uppercase tracking-tighter group-hover:gap-4 transition-all">
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
          <div className="text-center py-20 bg-white rounded-[2.5rem] border-2 border-dashed border-stone-200">
            <div className="text-6xl mb-6">🌍</div>
            <h3 className="text-2xl font-black text-gray-900 font-logo mb-2">No Languages Found</h3>
            <p className="text-stone-500 mb-8 max-w-xs mx-auto">Be the pioneer who adds the first linguistic data for your community.</p>
            <Link href="/contribute">
              <button className="bg-emerald-600 text-white px-10 py-4 rounded-2xl font-black hover:bg-emerald-700 transition shadow-lg">
                Add a New Language
              </button>
            </Link>
          </div>
        )}
      </div>
    </div>
  )
}