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

        // Get entry counts for each language
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
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Browse Languages</h1>
          <p className="text-xl text-green-100">
            Explore Kenya's 40+ languages and dialects
          </p>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {loading ? (
          <div className="text-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
            <p className="text-gray-600">Loading languages...</p>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {languages.map((lang) => (
              <Link key={lang.id} href={`/search?language=${lang.id}`}>
                <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 cursor-pointer border-2 border-transparent hover:border-primary-300">
                  <div className="flex items-start justify-between mb-4">
                    <div className="flex-1">
                      <h3 className="text-2xl font-bold text-gray-900 mb-1">
                        {lang.name}
                      </h3>
                      {lang.native_name && lang.native_name !== lang.name && (
                        <p className="text-gray-600">{lang.native_name}</p>
                      )}
                    </div>
                    <span className="text-3xl">🗣️</span>
                  </div>
                  
                  <div className="border-t border-gray-200 pt-4">
                    <div className="flex items-center justify-between text-sm">
                      <span className="text-gray-600">Words</span>
                      <span className="font-bold text-primary-600">
                        {languageCounts[lang.id] || 0}
                      </span>
                    </div>
                  </div>
                  
                  <button className="mt-4 w-full bg-primary-50 text-primary-600 py-2 rounded-lg hover:bg-primary-100 transition font-medium text-sm">
                    Explore →
                  </button>
                </div>
              </Link>
            ))}
          </div>
        )}

        {!loading && languages.length === 0 && (
          <div className="text-center py-12">
            <p className="text-gray-600 mb-4">No languages found yet.</p>
            <Link href="/contribute">
              <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition">
                Be the First to Contribute
              </button>
            </Link>
          </div>
        )}
      </div>
    </div>
  )
}