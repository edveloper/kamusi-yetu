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

export default function SearchContent() {
  const searchParams = useSearchParams()
  const router = useRouter()
  
  const queryParam = searchParams.get('q') || ''
  const langParam = searchParams.get('language') || 'all'
  const catParam = searchParams.get('category') || 'all'

  const [searchQuery, setSearchQuery] = useState(queryParam)
  const [selectedLanguage, setSelectedLanguage] = useState(langParam)
  const [selectedCategory, setSelectedCategory] = useState(catParam)
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
    setSearchQuery(searchParams.get('q') || '')
    setSelectedLanguage(searchParams.get('language') || 'all')
    setSelectedCategory(searchParams.get('category') || 'all')
  }, [searchParams])

  useEffect(() => {
    async function search() {
      if (!searchQuery.trim() && selectedLanguage === 'all' && selectedCategory === 'all') {
        setResults([])
        return
      }

      setLoading(true)
      try {
        const data = await searchEntries(
          searchQuery,
          selectedLanguage !== 'all' ? selectedLanguage : undefined,
          selectedCategory !== 'all' ? selectedCategory : undefined
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
  }, [searchQuery, selectedLanguage, selectedCategory])

  const updateUrl = (newParams: Record<string, string | null>) => {
    const params = new URLSearchParams(searchParams)
    Object.entries(newParams).forEach(([key, value]) => {
      if (!value || value === 'all') {
        params.delete(key)
      } else {
        params.set(key, value)
      }
    })
    router.push(`/search?${params.toString()}`)
  }

  return (
    <div className="min-h-screen bg-stone-50 pb-20 font-sans">
      {/* Search Hero: Professional, Deep Header */}
      <div className="bg-emerald-900 text-white py-24 md:py-32 relative overflow-hidden border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <h1 className="text-5xl md:text-8xl font-black font-logo tracking-tight mb-8">
            Search Archive
          </h1>
          
          <div className="max-w-3xl mx-auto relative group">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search by word or definition..."
              className="w-full bg-white text-stone-900 px-8 py-6 text-xl rounded-2xl shadow-2xl focus:outline-none transition-all font-bold placeholder:text-stone-300 placeholder:font-medium"
            />
            <div className="absolute right-6 top-1/2 -translate-y-1/2 text-stone-300 group-focus-within:text-emerald-600 transition-colors text-2xl">
              🔍
            </div>
          </div>
        </div>
        
        {/* Signature Circle DNA */}
        <div className="absolute top-0 right-0 opacity-10 translate-x-1/4 -translate-y-1/4 pointer-events-none">
          <div className="w-[500px] h-[500px] border-[50px] border-white rounded-full"></div>
        </div>
      </div>

      {/* Filters Bar: Architectural backdrop */}
      <div className="sticky top-20 z-20 bg-white/90 backdrop-blur-md border-b border-stone-100 py-6">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
          {/* Language Selection */}
          <div className="flex items-center gap-4 overflow-x-auto no-scrollbar">
            <span className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] shrink-0">Communities</span>
            <button
              onClick={() => updateUrl({ language: 'all' })}
              className={`px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest transition-all ${
                selectedLanguage === 'all' ? 'bg-emerald-900 text-white shadow-lg shadow-emerald-900/20' : 'bg-stone-50 text-stone-500 border border-stone-200 hover:border-emerald-300'
              }`}
            >
              All
            </button>
            {languages.map((lang) => (
              <button
                key={lang.id}
                onClick={() => updateUrl({ language: lang.id })}
                className={`px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest whitespace-nowrap transition-all ${
                  selectedLanguage === lang.id ? 'bg-emerald-900 text-white shadow-lg shadow-emerald-900/20' : 'bg-stone-50 text-stone-500 border border-stone-200 hover:border-emerald-300'
                }`}
              >
                {lang.name}
              </button>
            ))}
          </div>

          {/* Category Selection */}
          <div className="flex items-center gap-4 overflow-x-auto no-scrollbar border-t border-stone-50 pt-6">
            <span className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] shrink-0">Categories</span>
            <button
              onClick={() => updateUrl({ category: 'all' })}
              className={`px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest transition-all ${
                selectedCategory === 'all' ? 'bg-stone-900 text-white shadow-lg shadow-stone-900/20' : 'bg-stone-50 text-stone-500 border border-stone-200 hover:border-stone-300'
              }`}
            >
              Any
            </button>
            {CATEGORIES.map((cat) => (
              <button
                key={cat.id}
                onClick={() => updateUrl({ category: cat.id })}
                className={`px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest whitespace-nowrap transition-all flex items-center gap-2 ${
                  selectedCategory === cat.id ? 'bg-stone-900 text-white shadow-lg shadow-stone-900/20' : 'bg-stone-50 text-stone-500 border border-stone-200 hover:border-stone-300'
                }`}
              >
                <span>{cat.icon}</span>
                {cat.name}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Results Section */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        {loading ? (
          <div className="text-center py-32">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-900 mx-auto mb-6"></div>
            <p className="text-stone-400 font-black uppercase tracking-[0.2em] text-[10px]">Processing Archive...</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 lg:grid-cols-4 gap-16">
            <div className="lg:col-span-3 space-y-8">
              <div className="flex items-center gap-6 mb-12">
                <h2 className="text-[11px] font-black text-stone-400 uppercase tracking-[0.4em] whitespace-nowrap">
                  Showing {results.length} Archive {results.length === 1 ? 'Record' : 'Records'}
                </h2>
                <div className="h-px w-full bg-stone-100"></div>
              </div>
              
              {results.map((entry) => (
                <Link href={`/entry/${entry.id}`} key={entry.id} className="block group">
                  <div className="bg-white rounded-[2.5rem] p-10 border border-stone-100 shadow-sm group-hover:shadow-2xl group-hover:border-emerald-200 group-hover:-translate-y-1 transition-all duration-500">
                    <div className="flex justify-between items-start mb-6">
                      <div>
                        <h3 className="text-3xl font-black text-stone-900 font-logo group-hover:text-emerald-900 transition-colors tracking-tight">
                          {entry.headword}
                        </h3>
                        <p className="text-[10px] text-emerald-600 font-black uppercase tracking-[0.2em] mt-2">
                          {entry.language?.name}
                        </p>
                      </div>
                      <span className="text-[9px] font-black bg-stone-50 text-stone-400 px-4 py-2 rounded-xl border border-stone-100 uppercase tracking-widest">
                        Trust Score: {entry.trust_score}%
                      </span>
                    </div>
                    
                    <p className="text-stone-700 text-lg leading-relaxed font-medium mb-8">
                      {entry.primary_definition}
                    </p>
                    
                    <div className="flex items-center justify-between pt-8 border-t border-stone-50">
                       <div className="flex gap-2">
                        {entry.category && (
                          <span className="text-[9px] font-black bg-emerald-50 text-emerald-700 px-4 py-1.5 rounded-lg uppercase tracking-widest border border-emerald-100">
                            {entry.category}
                          </span>
                        )}
                       </div>
                       <span className="text-emerald-600 font-black text-xs uppercase tracking-widest opacity-0 group-hover:opacity-100 translate-x-[-10px] group-hover:translate-x-0 transition-all duration-300">
                         View Full Record →
                       </span>
                    </div>
                  </div>
                </Link>
              ))}

              {results.length === 0 && !loading && (
                <div className="bg-white rounded-[3rem] p-24 text-center border border-stone-100 shadow-sm">
                  <p className="text-stone-400 text-xl font-medium mb-10 leading-relaxed max-w-sm mx-auto">No archive entries match your specific search criteria.</p>
                  <Link href="/contribute">
                    <button className="bg-stone-900 text-white px-12 py-5 rounded-2xl font-black text-xs uppercase tracking-[0.3em] hover:bg-emerald-900 transition-all shadow-xl">
                      + Add New Word
                    </button>
                  </Link>
                </div>
              )}
            </div>
            
            {/* Sidebar Context */}
            <div className="hidden lg:block">
               <div className="sticky top-64 space-y-8">
                  <div className="bg-stone-900 rounded-[2.5rem] p-10 text-white relative overflow-hidden shadow-2xl">
                    <div className="relative z-10">
                      <h4 className="font-black font-logo text-2xl mb-4 tracking-tight leading-tight">Digital Preservation</h4>
                      <p className="text-sm text-stone-400 leading-relaxed font-medium mb-10">
                        The archive is powered by the community. Every entry helps bridge the gap between oral history and the digital world.
                      </p>
                      <Link href="/contribute" className="block text-center bg-white text-stone-900 py-5 rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-50 transition-all">
                        Contribute Entry
                      </Link>
                    </div>
                    <div className="absolute top-0 right-0 w-32 h-32 border-[20px] border-white/5 rounded-full -mr-16 -mt-16"></div>
                  </div>

                  <div className="bg-white rounded-[2.5rem] p-10 border border-stone-100">
                    <h5 className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-6 border-b border-stone-50 pb-4">Search System</h5>
                    <p className="text-xs text-stone-500 leading-relaxed font-medium">
                      Queries are processed against headwords and primary definitions. Filter by language community or topical category for precise archival records.
                    </p>
                  </div>
               </div>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}