'use client'

import { useState, useEffect } from 'react'
import { useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { searchEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'

export default function SearchContent() {
  const searchParams = useSearchParams()
  const query = searchParams.get('q') || ''
  const [searchQuery, setSearchQuery] = useState(query)
  const [selectedLanguage, setSelectedLanguage] = useState('all')
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
      if (!searchQuery.trim()) {
        setResults([])
        return
      }

      setLoading(true)
      try {
        const data = await searchEntries(
          searchQuery,
          selectedLanguage !== 'all' ? selectedLanguage : undefined
        )
        setResults(data || [])
      } catch (err) {
        console.error('Search failed:', err)
        setResults([])
      } finally {
        setLoading(false)
      }
    }

    search()
  }, [searchQuery, selectedLanguage])

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
              className={`px-4 py-2 rounded-full font-medium transition text-sm ${
                selectedLanguage === 'all'
                  ? 'bg-primary-500 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              All Languages
            </button>
            {languages.map((lang) => (
              <button
                key={lang.id}
                onClick={() => setSelectedLanguage(lang.id)}
                className={`px-4 py-2 rounded-full font-medium transition text-sm ${
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
        {loading ? (
          <div className="text-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
            <p className="text-gray-600">Searching...</p>
          </div>
        ) : (
          <>
            <div className="mb-6">
              <p className="text-gray-600 text-sm md:text-base">
                {results.length === 0 ? 'No results found' : `${results.length} result${results.length !== 1 ? 's' : ''} for "${searchQuery}"`}
              </p>
            </div>

            <div className="space-y-4">
              {results.map((entry) => (
                <Link href={`/entry/${entry.id}`} key={entry.id}>
                  <div className="bg-white rounded-xl shadow-md hover:shadow-xl transition p-4 md:p-6 border border-gray-100 cursor-pointer">
                    <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3 mb-3">
                      <div className="flex-1">
                        <h3 className="text-xl md:text-2xl font-bold text-gray-900 hover:text-primary-600 transition break-words">
                          {entry.headword}
                        </h3>
                        <p className="text-xs md:text-sm text-gray-500 mt-1">
                          {entry.language?.name} • {entry.part_of_speech || 'word'}
                        </p>
                      </div>
                      <div className="flex items-center gap-2 flex-shrink-0">
                        {entry.validation_status === 'verified' && (
                          <span className="bg-green-100 text-green-700 px-2 md:px-3 py-1 rounded-full text-xs font-bold whitespace-nowrap">
                            ✓ Verified
                          </span>
                        )}
                        {entry.validation_status === 'pending' && (
                          <span className="bg-yellow-100 text-yellow-700 px-2 md:px-3 py-1 rounded-full text-xs font-bold whitespace-nowrap">
                            ⏳ Pending
                          </span>
                        )}
                        <span className="text-xs md:text-sm text-gray-500 whitespace-nowrap">
                          {entry.trust_score}%
                        </span>
                      </div>
                    </div>

                    <p className="text-sm md:text-base text-gray-700 line-clamp-2">
                      {entry.primary_definition}
                    </p>
                  </div>
                </Link>
              ))}
            </div>

            {results.length === 0 && searchQuery && !loading && (
              <div className="text-center py-12">
                <p className="text-lg md:text-xl text-gray-600 mb-4">No results found for &quot;{searchQuery}&quot;</p>
                <p className="text-sm md:text-base text-gray-500 mb-6">Try a different search term or</p>
                <Link href="/contribute">
                  <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-medium text-sm md:text-base">
                    + Add this word
                  </button>
                </Link>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  )
}