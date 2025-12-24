'use client'

import { useState } from 'react'
import { useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { mockEntries, mockLanguages } from '@/lib/mockData'

export default function SearchPage() {
  const searchParams = useSearchParams()
  const query = searchParams.get('q') || ''
  const [searchQuery, setSearchQuery] = useState(query)
  const [selectedLanguage, setSelectedLanguage] = useState('all')

  // Simple search filter
  const results = mockEntries.filter(entry => {
    const matchesQuery = entry.headword.toLowerCase().includes(searchQuery.toLowerCase()) ||
                        entry.primary_definition.toLowerCase().includes(searchQuery.toLowerCase())
    const matchesLanguage = selectedLanguage === 'all' || entry.language_id === selectedLanguage
    return matchesQuery && matchesLanguage
  })

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Search Header */}
      <div className="bg-white border-b border-gray-200 py-8">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Search Bar */}
          <div className="max-w-3xl mx-auto mb-6">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search in any language..."
              className="w-full px-6 py-4 text-lg border-2 border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              autoFocus
            />
          </div>

          {/* Language Filter */}
          <div className="flex flex-wrap gap-2 justify-center">
            <button
              onClick={() => setSelectedLanguage('all')}
              className={`px-4 py-2 rounded-full font-medium transition ${
                selectedLanguage === 'all'
                  ? 'bg-primary-500 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              All Languages
            </button>
            {mockLanguages.map((lang) => (
              <button
                key={lang.id}
                onClick={() => setSelectedLanguage(lang.id)}
                className={`px-4 py-2 rounded-full font-medium transition ${
                  selectedLanguage === lang.id
                    ? 'bg-primary-500 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {lang.name}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Results */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-6">
          <p className="text-gray-600">
            {results.length === 0 ? 'No results found' : `${results.length} result${results.length !== 1 ? 's' : ''} for "${searchQuery}"`}
          </p>
        </div>

        <div className="space-y-4">
          {results.map((entry) => {
            const language = mockLanguages.find(l => l.id === entry.language_id)
            return (
              <Link href={`/entry/${entry.id}`} key={entry.id}>
                <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-6 border border-gray-100 cursor-pointer">
                  <div className="flex items-start justify-between mb-3">
                    <div>
                      <h3 className="text-2xl font-bold text-gray-900 hover:text-primary-600 transition">
                        {entry.headword}
                      </h3>
                      <p className="text-sm text-gray-500 mt-1">
                        {language?.name} • {entry.part_of_speech}
                      </p>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="bg-green-100 text-green-700 px-3 py-1 rounded-full text-xs font-bold">
                        ✓ Verified
                      </span>
                      <span className="text-sm text-gray-500">
                        {entry.trust_score}% trust
                      </span>
                    </div>
                  </div>

                  <p className="text-gray-700 mb-3">
                    {entry.primary_definition}
                  </p>

                  {entry.translations && entry.translations.length > 0 && (
                    <div className="flex flex-wrap gap-2">
                      <span className="text-sm text-gray-500">Translations:</span>
                      {entry.translations.slice(0, 3).map((trans, idx) => (
                        <span key={idx} className="text-sm bg-gray-100 text-gray-700 px-3 py-1 rounded-full">
                          {trans.language}: {trans.word}
                        </span>
                      ))}
                    </div>
                  )}
                </div>
              </Link>
            )
          })}
        </div>

        {results.length === 0 && searchQuery && (
          <div className="text-center py-12">
            <p className="text-xl text-gray-600 mb-4">No results found for &quot;{searchQuery}&quot;</p>
            <p className="text-gray-500 mb-6">Try a different search term or</p>
            <Link href="/contribute">
              <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-medium">
                + Add this word
              </button>
            </Link>
          </div>
        )}
      </div>
    </div>
  )
}