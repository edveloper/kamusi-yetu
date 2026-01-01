'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import { getUserStats, getUserProfile, isModerator, updateUserProfile } from '@/lib/api/users'
import { getEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import LanguageSelector from '@/components/LanguageSelector'

export default function ProfilePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [stats, setStats] = useState({
    wordsAdded: 0,
    validated: 0,
    usageExamples: 0,
    reputation: 0,
    joinedDate: 'Recently',
    streak: 0
  })
  const [recentContributions, setRecentContributions] = useState<any[]>([])
  const [loadingData, setLoadingData] = useState(true)
  const [isUserModerator, setIsUserModerator] = useState(false)
  const [profile, setProfile] = useState<any>(null)
  const [showLanguageSelector, setShowLanguageSelector] = useState(false)
  const [userLanguages, setUserLanguages] = useState<string[]>([])
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [savingLanguages, setSavingLanguages] = useState(false)

  useEffect(() => {
    setMounted(true)
    if (!loading && !user) {
      router.push('/login')
    }
  }, [user, loading, router])

  useEffect(() => {
    async function loadUserData() {
      if (!user) return

      try {
        // Get all languages first
        const langs = await getLanguages()
        setAllLanguages(langs)
        
        // Get user profile
        const userProfile = await getUserProfile(user.id)
        setProfile(userProfile)
        setUserLanguages(userProfile.languages || [])
        
        // Get user stats
        const userStats = await getUserStats(user.id)
        
        // Check moderator status
        const modStatus = await isModerator(user.id)
        setIsUserModerator(modStatus)
        
        // Get recent contributions (entries created by this user)
        const allEntries = await getEntries({})
        const userEntries = allEntries?.filter((e: any) => e.created_by === user.id) || []
        
        // Calculate reputation (10 points per word, 5 per validation, 2 per example)
        const reputation = (userStats.wordsAdded * 10) + 
                          (userStats.validated * 5) + 
                          (userStats.usageExamples * 2)
        
        setStats({
          wordsAdded: userStats.wordsAdded,
          validated: userStats.validated,
          usageExamples: userStats.usageExamples,
          reputation: reputation,
          joinedDate: new Date(user.created_at).toLocaleDateString('en-US', { 
            month: 'long', 
            year: 'numeric' 
          }),
          streak: 0 // TODO: Calculate streak from contribution dates
        })
        
        setRecentContributions(userEntries.slice(0, 5))
      } catch (err) {
        console.error('Failed to load user data:', err)
      } finally {
        setLoadingData(false)
      }
    }

    if (user) {
      loadUserData()
    }
  }, [user])

  const handleLanguagesChange = async (newLanguages: string[]) => {
    if (!user) return
    
    setSavingLanguages(true)
    try {
      await updateUserProfile(user.id, { languages: newLanguages })
      setUserLanguages(newLanguages)
      setProfile({ ...profile, languages: newLanguages })
    } catch (err) {
      console.error('Failed to save languages:', err)
      alert('Failed to save languages. Please try again.')
    } finally {
      setSavingLanguages(false)
      setShowLanguageSelector(false)
    }
  }

  const getLanguageName = (languageId: string) => {
    const lang = allLanguages.find(l => l.id === languageId)
    return lang?.name || languageId
  }

  if (!mounted || loading || !user) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading...</p>
        </div>
      </div>
    )
  }

  const displayName = profile?.display_name || profile?.username || user.email?.split('@')[0] || 'User'

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-gradient-to-br from-primary-700 to-primary-500 text-white py-12 md:py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row items-center md:items-start gap-6">
            {/* Avatar */}
            <div className="w-24 h-24 md:w-32 md:h-32 rounded-full bg-white/20 flex items-center justify-center text-4xl md:text-5xl font-bold border-4 border-white shadow-lg">
              {displayName[0].toUpperCase()}
            </div>
            
            {/* Info */}
            <div className="flex-1 text-center md:text-left">
              <h1 className="text-2xl md:text-4xl font-bold mb-2">
                {displayName}
              </h1>
              <p className="text-green-100 mb-4 text-sm md:text-base">{user.email}</p>
              <div className="flex flex-wrap gap-2 justify-center md:justify-start">
                <span className="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-xs md:text-sm font-medium">
                  ⭐ Contributor
                </span>
                {isUserModerator && (
                  <span className="bg-yellow-400/30 backdrop-blur-sm px-3 py-1 rounded-full text-xs md:text-sm font-medium border border-yellow-300">
                    🛡️ Moderator
                  </span>
                )}
                <span className="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-xs md:text-sm font-medium">
                  Joined {stats.joinedDate}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Stats Grid */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4">
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">
              {loadingData ? '...' : stats.wordsAdded}
            </div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Words Added</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">
              {loadingData ? '...' : stats.validated}
            </div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Validated</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">
              {loadingData ? '...' : stats.usageExamples}
            </div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Examples</div>
          </div>
          <div className="bg-white rounded-xl shadow-lg p-4 md:p-6 text-center">
            <div className="text-2xl md:text-4xl font-bold text-primary-600">
              {loadingData ? '...' : stats.reputation}
            </div>
            <div className="text-xs md:text-sm text-gray-600 mt-1">Reputation</div>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8 md:py-12">
        {/* Recent Contributions */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-6">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl md:text-2xl font-bold text-gray-900">Recent Contributions</h2>
            <Link href="/contribute">
              <button className="text-primary-600 hover:text-primary-700 font-medium text-sm">
                + Add More
              </button>
            </Link>
          </div>
          
          {loadingData ? (
            <div className="text-center py-8">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-500 mx-auto mb-2"></div>
              <p className="text-sm text-gray-600">Loading contributions...</p>
            </div>
          ) : recentContributions.length === 0 ? (
            <div className="text-center py-8">
              <p className="text-gray-600 mb-4">You haven&apos;t contributed any words yet.</p>
              <Link href="/contribute">
                <button className="bg-primary-500 text-white px-6 py-3 rounded-lg hover:bg-primary-600 transition font-medium">
                  Contribute Your First Word
                </button>
              </Link>
            </div>
          ) : (
            <div className="space-y-3 md:space-y-4">
              {recentContributions.map((contrib) => (
                <Link href={`/entry/${contrib.id}`} key={contrib.id}>
                  <div className="border border-gray-200 rounded-lg p-4 hover:border-primary-300 transition cursor-pointer">
                    <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                      <div className="flex-1">
                        <h3 className="text-base md:text-lg font-bold text-gray-900">{contrib.headword}</h3>
                        <p className="text-xs md:text-sm text-gray-600">{contrib.language?.name || 'Unknown language'}</p>
                      </div>
                      <div className="flex items-center gap-3">
                        <span className={`px-3 py-1 rounded-full text-xs font-bold ${
                          contrib.validation_status === 'verified' 
                            ? 'bg-green-100 text-green-700' 
                            : contrib.validation_status === 'pending'
                            ? 'bg-yellow-100 text-yellow-700'
                            : 'bg-red-100 text-red-700'
                        }`}>
                          {contrib.validation_status === 'verified' ? '✓ Verified' : 
                           contrib.validation_status === 'pending' ? '⏳ Pending' : '🚩 Flagged'}
                        </span>
                        <span className="text-xs md:text-sm text-gray-500">
                          {new Date(contrib.created_at).toLocaleDateString()}
                        </span>
                      </div>
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          )}
        </div>

        {/* My Languages */}
        <div className="bg-white rounded-2xl shadow-lg p-4 md:p-8 mb-6">
          <h2 className="text-xl md:text-2xl font-bold text-gray-900 mb-4">My Languages</h2>
          <div className="flex flex-wrap gap-3">
            {userLanguages.length > 0 ? (
              userLanguages.map((langId) => (
                <div key={langId} className="bg-green-50 text-green-800 px-4 py-2 rounded-full font-medium flex items-center gap-2 border-2 border-green-200 text-sm">
                  <span className="w-2 h-2 bg-green-600 rounded-full"></span>
                  {getLanguageName(langId)}
                </div>
              ))
            ) : (
              <p className="text-gray-600 text-sm">No languages selected yet</p>
            )}
            <button 
              onClick={() => setShowLanguageSelector(true)}
              disabled={savingLanguages}
              className="border-2 border-dashed border-gray-300 text-gray-600 px-4 py-2 rounded-full font-medium hover:border-green-600 hover:text-green-700 hover:bg-green-50 transition text-sm disabled:opacity-50"
            >
              {savingLanguages ? 'Saving...' : userLanguages.length > 0 ? '+ Add More' : '+ Add Language'}
            </button>
          </div>
        </div>

        {/* Moderator Tools - Only show if user is moderator */}
        {isUserModerator && (
          <div className="bg-gradient-to-br from-primary-500 to-primary-700 rounded-2xl shadow-lg p-4 md:p-8 text-white">
            <div className="flex items-center gap-3 mb-4">
              <span className="text-3xl">🛡️</span>
              <div>
                <h2 className="text-xl md:text-2xl font-bold">Moderator Tools</h2>
                <p className="text-sm text-green-100">Help keep Kamusi Yetu accurate and respectful</p>
              </div>
            </div>
            <Link href="/moderate">
              <button className="bg-white text-primary-700 px-6 py-3 rounded-lg hover:bg-green-50 transition font-bold text-sm md:text-base w-full md:w-auto">
                Open Moderation Dashboard →
              </button>
            </Link>
          </div>
        )}
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