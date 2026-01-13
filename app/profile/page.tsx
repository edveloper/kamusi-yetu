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
    let isMounted = true

    async function loadUserData() {
      if (!user) return
      try {
        const [langs, userProfile, userStats, modStatus, allEntries] = await Promise.all([
          getLanguages(),
          getUserProfile(user.id),
          getUserStats(user.id),
          isModerator(user.id),
          getEntries({})
        ])
        
        if (isMounted) {
          setAllLanguages(langs)
          setProfile(userProfile)
          setUserLanguages(userProfile.languages || [])
          setIsUserModerator(modStatus)
          
          const userEntries = allEntries?.filter((e: any) => e.created_by === user.id) || []
          const reputation = (userStats.wordsAdded * 10) + (userStats.validated * 5) + (userStats.usageExamples * 2)
          
          setStats({
            wordsAdded: userStats.wordsAdded,
            validated: userStats.validated,
            usageExamples: userStats.usageExamples,
            reputation: reputation,
            joinedDate: new Date(user.created_at).toLocaleDateString('en-US', { month: 'long', year: 'numeric' }),
            streak: 0
          })
          setRecentContributions(userEntries.slice(0, 5))
        }
      } catch (err) {
        console.error('Failed to load user data:', err)
      } finally {
        if (isMounted) setLoadingData(false)
      }
    }

    if (user) loadUserData()

    return () => {
      isMounted = false
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
      <div className="min-h-screen bg-stone-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-600"></div>
      </div>
    )
  }

  const displayName = profile?.display_name || profile?.username || user.email?.split('@')[0] || 'User'

  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans overflow-x-hidden">
      {/* Hero Header */}
      <div className="bg-emerald-900 text-white py-16 md:py-24 relative overflow-hidden border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="flex flex-col md:flex-row items-center gap-8 md:gap-12">
            <div className="w-28 h-28 md:w-40 md:h-40 rounded-[2rem] md:rounded-[2.5rem] bg-white text-emerald-900 flex items-center justify-center text-4xl md:text-6xl font-black font-logo border border-white/20 shadow-2xl flex-shrink-0">
              {displayName[0].toUpperCase()}
            </div>
            
            <div className="text-center md:text-left min-w-0">
              <h1 className="text-4xl md:text-7xl font-black font-logo tracking-tight mb-4 break-words px-2 md:px-0">
                {displayName}
              </h1>
              <div className="flex flex-wrap gap-3 justify-center md:justify-start">
                <span className="bg-emerald-500/20 text-emerald-300 px-4 py-1.5 rounded-lg text-[9px] font-black uppercase tracking-[0.2em] border border-emerald-500/30">
                  Contributor
                </span>
                {isUserModerator && (
                  <span className="bg-amber-500/20 text-amber-300 px-4 py-1.5 rounded-lg text-[9px] font-black uppercase tracking-[0.2em] border border-amber-500/30">
                    Moderator
                  </span>
                )}
                <span className="text-emerald-100/40 py-1.5 text-[9px] font-black uppercase tracking-[0.2em]">
                  Joined {stats.joinedDate}
                </span>
              </div>
            </div>
          </div>
        </div>
        <div className="absolute top-0 right-0 w-[500px] h-[500px] border-[50px] border-white/5 rounded-full -mr-32 -mt-32"></div>
      </div>

      {/* Stats Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 md:-mt-16 relative z-30">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-6">
          {[
            { label: 'Words Added', value: stats.wordsAdded, color: 'text-stone-900' },
            { label: 'Validated', value: stats.validated, color: 'text-stone-900' },
            { label: 'Examples', value: stats.usageExamples, color: 'text-stone-900' },
            { label: 'Reputation', value: stats.reputation, color: 'text-emerald-600' }
          ].map((stat, i) => (
            <div key={i} className="bg-white rounded-[1.5rem] md:rounded-[2.5rem] p-6 md:p-10 border border-stone-200 shadow-xl shadow-emerald-900/5 text-center transition-all hover:scale-[1.02]">
              <div className={`text-2xl md:text-5xl font-black font-logo mb-1 ${stat.color}`}>
                {loadingData ? '...' : stat.value}
              </div>
              <div className="text-[8px] md:text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] md:tracking-[0.3em] whitespace-nowrap overflow-hidden text-ellipsis px-1">
                {stat.label}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Content Layout Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-12 md:mt-20 grid lg:grid-cols-3 gap-8 md:gap-12">
        
        {/* Activity Section */}
        <div className="lg:col-span-2 min-w-0">
          <section className="bg-white rounded-[2rem] md:rounded-[3rem] border border-stone-200 p-6 md:p-12 shadow-sm">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8 md:mb-12">
              <h2 className="text-2xl md:text-3xl font-black text-stone-900 font-logo uppercase tracking-tight">Archive Contributions</h2>
              <Link href="/contribute" className="text-[10px] font-black text-emerald-600 uppercase tracking-[0.2em] border-b-2 border-emerald-100 hover:border-emerald-600 transition-all pb-1 self-start sm:self-auto">
                + New Record
              </Link>
            </div>

            {loadingData ? (
              <div className="py-20 text-center text-stone-300 font-black uppercase tracking-[0.3em] text-[10px] animate-pulse">Syncing...</div>
            ) : recentContributions.length === 0 ? (
              <div className="text-center py-16 bg-stone-50 rounded-[2rem] border border-stone-100">
                <p className="text-stone-400 font-medium mb-8 text-sm">The contribution log is currently empty.</p>
                <Link href="/contribute" className="bg-emerald-900 text-white px-8 py-4 rounded-xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-stone-900 transition-all">
                  Archive First Word
                </Link>
              </div>
            ) : (
              <div className="space-y-4">
                {recentContributions.map((contrib) => (
                  <Link href={`/entry/${contrib.id}`} key={contrib.id} className="block group">
                    <div className="flex items-center justify-between p-5 md:p-8 rounded-[1.5rem] md:rounded-[2.5rem] border border-stone-50 hover:border-emerald-200 hover:bg-emerald-50/30 transition-all duration-300">
                      <div className="min-w-0">
                        <h3 className="text-lg md:text-2xl font-black text-stone-900 group-hover:text-emerald-900 transition-colors font-logo uppercase tracking-tight truncate pr-2">
                          {contrib.headword}
                        </h3>
                        <p className="text-[9px] text-stone-400 font-black uppercase tracking-widest mt-1">
                          {contrib.language?.name || 'Unknown Language'}
                        </p>
                      </div>
                      <div className="flex items-center gap-4 flex-shrink-0">
                        <span className={`text-[8px] md:text-[9px] font-black px-3 md:px-5 py-1.5 md:py-2 rounded-lg md:rounded-xl uppercase tracking-widest border ${
                          contrib.validation_status === 'verified' 
                            ? 'bg-emerald-50 text-emerald-700 border-emerald-100' 
                            : 'bg-amber-50 text-amber-700 border-amber-100'
                        }`}>
                          {contrib.validation_status}
                        </span>
                        <span className="text-emerald-500 font-black transition-transform group-hover:translate-x-1 hidden md:block">→</span>
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </section>
        </div>

        {/* Sidebar Meta */}
        <div className="space-y-8 md:space-y-12 min-w-0">
          <section className="bg-white rounded-[2rem] md:rounded-[3rem] border border-stone-200 p-8 md:p-12 shadow-sm">
            <h2 className="text-lg md:text-xl font-black text-stone-900 font-logo mb-8 uppercase tracking-tight">Focus Languages</h2>
            <div className="flex flex-wrap gap-2 md:gap-4 mb-8 md:mb-12">
              {userLanguages.length > 0 ? (
                userLanguages.map((langId) => (
                  <div key={langId} className="bg-stone-50 border border-stone-100 px-4 py-2 rounded-xl text-[9px] font-black text-stone-600 uppercase tracking-widest">
                    {getLanguageName(langId)}
                  </div>
                ))
              ) : (
                <p className="text-stone-400 text-xs font-medium">No languages selected.</p>
              )}
            </div>
            <button 
              onClick={() => setShowLanguageSelector(true)}
              className="w-full py-5 border-2 border-dashed border-stone-200 rounded-2xl text-[9px] font-black text-stone-400 uppercase tracking-[0.2em] hover:border-emerald-500 hover:text-emerald-600 transition-all bg-stone-50/50"
            >
              {savingLanguages ? 'UPDATING...' : 'Manage Focus'}
            </button>
          </section>

          {isUserModerator && (
            <section className="bg-emerald-900 rounded-[2rem] md:rounded-[3rem] p-8 md:p-12 text-white relative overflow-hidden group shadow-2xl">
              <div className="relative z-10">
                <h2 className="text-2xl md:text-3xl font-black font-logo mb-3 uppercase tracking-tight">Authority</h2>
                <p className="text-emerald-100/50 text-xs mb-8 font-medium leading-relaxed italic">Validation tools active. Your contributions carry weight.</p>
                <Link href="/moderate" className="block text-center bg-white text-emerald-900 py-4 rounded-xl font-black text-[9px] uppercase tracking-[0.3em] hover:bg-emerald-50 transition-all shadow-lg">
                  Launch Suite
                </Link>
              </div>
              <div className="absolute -bottom-10 -left-10 w-40 h-40 border-[30px] border-white/5 rounded-full group-hover:scale-125 transition-transform duration-700"></div>
            </section>
          )}
        </div>
      </div>
      
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