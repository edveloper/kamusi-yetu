'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useState, useEffect } from 'react'
import { getUserProfile } from '@/lib/api/users'
import { getLanguages } from '@/lib/api/languages'
import Link from 'next/link'
import LanguageSelector from '@/components/LanguageSelector'
import { updateUserProfile } from '@/lib/api/users'

export default function HomePage() {
  const { user } = useAuth()
  const [userLanguages, setUserLanguages] = useState<string[]>([])
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [showLanguageSelector, setShowLanguageSelector] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function loadData() {
      try {
        // Load all languages
        const langs = await getLanguages()
        setAllLanguages(langs)

        // If user is logged in, load their language preferences
        if (user) {
          const profile = await getUserProfile(user.id)
          setUserLanguages(profile.languages || [])
        }
      } catch (err) {
        console.error('Failed to load languages:', err)
      } finally {
        setLoading(false)
      }
    }

    loadData()
  }, [user])

  const handleLanguagesChange = async (newLanguages: string[]) => {
    if (!user) return
    
    try {
      await updateUserProfile(user.id, { languages: newLanguages })
      setUserLanguages(newLanguages)
    } catch (err) {
      console.error('Failed to save languages:', err)
      alert('Failed to save languages. Please try again.')
    } finally {
      setShowLanguageSelector(false)
    }
  }

  const getLanguageName = (languageId: string) => {
    const lang = allLanguages.find(l => l.id === languageId)
    return lang?.name || languageId
  }

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col">
      {/* Hero Section */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-16 md:py-24">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-6xl font-bold mb-6 break-words">
            Kamusi Yetu
          </h1>
          <p className="text-lg md:text-xl text-green-100 mb-8 max-w-2xl mx-auto">
            Our Dictionary. Built by Kenyans, for Kenyans.
          </p>
          
          {/* Search Bar */}
          <div className="max-w-2xl mx-auto relative z-10">
            <form action="/search" method="GET" className="relative">
              <input
                type="text"
                name="q"
                placeholder="Search for a word..."
                // Added pr-32 to prevent text going under the button on mobile
                // Added bg-white to fix the green background issue
                className="w-full px-6 py-4 pr-32 rounded-full bg-white text-gray-900 text-lg placeholder-gray-500 shadow-xl focus:outline-none focus:ring-4 focus:ring-white/30"
              />
              <button
                type="submit"
                className="absolute right-2 top-1/2 -translate-y-1/2 bg-primary-600 text-white px-4 md:px-6 py-2 rounded-full hover:bg-primary-700 transition font-medium text-sm md:text-base"
              >
                Search
              </button>
            </form>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12 flex-grow w-full">
        
        {/* My Languages Section */}
        {user && (
          <div className="bg-white rounded-2xl shadow-lg p-6 md:p-8 mb-8">
            <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-6 gap-4">
              <h2 className="text-2xl font-bold text-gray-900">My Languages</h2>
              <Link href="/profile" className="text-sm text-primary-600 hover:text-primary-700 font-medium whitespace-nowrap">
                View Profile →
              </Link>
            </div>
            
            {loading ? (
              <div className="flex items-center gap-2 text-gray-600">
                <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-primary-500"></div>
                <span>Loading...</span>
              </div>
            ) : userLanguages.length > 0 ? (
              // GRID LAYOUT: Ensures equal sizing for language buttons
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                {userLanguages.map((langId) => (
                  <div key={langId} className="bg-green-50 text-green-800 px-3 py-3 rounded-xl font-medium flex items-center justify-center gap-2 border-2 border-green-200 h-full w-full text-center">
                    <span className="w-2 h-2 bg-green-600 rounded-full flex-shrink-0"></span>
                    <span className="truncate text-sm md:text-base">{getLanguageName(langId)}</span>
                  </div>
                ))}
                <button 
                  onClick={() => setShowLanguageSelector(true)}
                  className="border-2 border-dashed border-gray-300 text-gray-600 px-3 py-3 rounded-xl font-medium hover:border-green-600 hover:text-green-700 hover:bg-green-50 transition h-full w-full flex items-center justify-center text-sm md:text-base"
                >
                  + Edit List
                </button>
              </div>
            ) : (
              <div>
                <p className="text-gray-600 mb-4">
                  Select the languages you speak to personalize your experience
                </p>
                <button 
                  onClick={() => setShowLanguageSelector(true)}
                  className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-medium w-full sm:w-auto"
                >
                  Select Languages
                </button>
              </div>
            )}
          </div>
        )}

        {/* Quick Actions - Equal Height Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-12">
          <Link href="/contribute" className="block h-full group">
            <div className="bg-white rounded-2xl shadow-lg p-8 h-full flex flex-col justify-center border-2 border-transparent group-hover:border-primary-300 group-hover:shadow-xl transition relative overflow-hidden">
              <div className="text-4xl mb-4">✍️</div>
              <h3 className="text-2xl font-bold text-gray-900 mb-2">Contribute a Word</h3>
              <p className="text-gray-600 flex-grow">
                Share your knowledge and help build Kenya's linguistic heritage
              </p>
            </div>
          </Link>

          <Link href="/explore" className="block h-full group">
            <div className="bg-white rounded-2xl shadow-lg p-8 h-full flex flex-col justify-center border-2 border-transparent group-hover:border-primary-300 group-hover:shadow-xl transition relative overflow-hidden">
              <div className="text-4xl mb-4">🔍</div>
              <h3 className="text-2xl font-bold text-gray-900 mb-2">Explore Languages</h3>
              <p className="text-gray-600 flex-grow">
                Discover words and phrases from Kenya's 40+ languages
              </p>
            </div>
          </Link>
        </div>

        {/* Stats Section */}
        <div className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-8 text-white mb-12">
          <h2 className="text-2xl md:text-3xl font-bold mb-8 text-center">Community Impact</h2>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-8 text-center divide-y sm:divide-y-0 sm:divide-x divide-white/20">
            <div className="pt-4 sm:pt-0">
              <div className="text-4xl md:text-5xl font-bold mb-2">40+</div>
              <div className="text-green-100 text-sm md:text-base">Languages</div>
            </div>
            <div className="pt-4 sm:pt-0 pl-0 sm:pl-4">
              <div className="text-4xl md:text-5xl font-bold mb-2">1K+</div>
              <div className="text-green-100 text-sm md:text-base">Words</div>
            </div>
            <div className="pt-4 sm:pt-0 pl-0 sm:pl-4">
              <div className="text-4xl md:text-5xl font-bold mb-2">100+</div>
              <div className="text-green-100 text-sm md:text-base">Contributors</div>
            </div>
          </div>
        </div>

        {/* Featured Languages - Equal Grid */}
        <div className="bg-white rounded-2xl shadow-lg p-6 md:p-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">Browse by Language</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {allLanguages.slice(0, 8).map((lang) => (
              <Link key={lang.id} href={`/explore?language=${lang.id}`} className="block h-full">
                <div className="p-4 border-2 border-gray-200 rounded-xl hover:border-primary-300 hover:bg-primary-50 transition text-center cursor-pointer h-full flex flex-col items-center justify-center min-h-[100px]">
                  <p className="font-bold text-gray-900 line-clamp-1">{lang.name}</p>
                  {lang.native_name && lang.native_name !== lang.name && (
                    <p className="text-sm text-gray-600 mt-1 line-clamp-1">{lang.native_name}</p>
                  )}
                </div>
              </Link>
            ))}
          </div>
          {allLanguages.length > 8 && (
            <div className="text-center mt-8">
              <Link href="/explore">
                <button className="text-primary-600 hover:text-primary-700 font-medium px-4 py-2 rounded-lg hover:bg-primary-50 transition">
                  View All Languages →
                </button>
              </Link>
            </div>
          )}
        </div>
      </div>

      {/* Language Selector Modal */}
      {showLanguageSelector && (
        <LanguageSelector
          selectedLanguages={userLanguages}
          onLanguagesChange={handleLanguagesChange}
          onClose={() => setShowLanguageSelector(false)}
        />
      )}
    </div>
  )
}