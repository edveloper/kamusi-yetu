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
        const [langs, userProfile, userStats, modStatus, allEntries] = await Promise.all([
          getLanguages(),
          getUserProfile(user.id),
          getUserStats(user.id),
          isModerator(user.id),
          getEntries({})
        ])
        
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
      } catch (err) {
        console.error('Failed to load user data:', err)
      } finally {
        setLoadingData(false)
      }
    }
    if (user) loadUserData()
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
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      {/* Hero Header: Mirroring About/Team Hero DNA */}
      <div className="bg-emerald-900 text-white py-24 relative overflow-hidden border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="flex flex-col md:flex-row items-center gap-12">
            {/* Avatar: Stylized block mirrored from Team Page Founder block */}
            <div className="w-32 h-32 md:w-40 md:h-40 rounded-[2.5rem] bg-white text-emerald-900 flex items-center justify-center text-6xl font-black font-logo border border-white/20 shadow-2xl">
              {displayName[0].toUpperCase()}
            </div>
            
            <div className="text-center md:text-left">
              <h1 className="text-5xl md:text-7xl font-black font-logo tracking-tight mb-4">
                {displayName}
              </h1>
              <div className="flex flex-wrap gap-4 justify-center md:justify-start">
                <span className="bg-emerald-500/20 text-emerald-300 px-6 py-2 rounded-xl text-[10px] font-black uppercase tracking-[0.2em] border border-emerald-500/30">
                  Contributor
                </span>
                {isUserModerator && (
                  <span className="bg-amber-500/20 text-amber-300 px-6 py-2 rounded-xl text-[10px] font-black uppercase tracking-[0.2em] border border-amber-500/30">
                    Moderator
                  </span>
                )}
                <span className="text-emerald-100/40 px-2 py-2 text-[10px] font-black uppercase tracking-[0.2em]">
                  Joined {stats.joinedDate}
                </span>
              </div>
            </div>
          </div>
        </div>
        
        {/* Signature Decorative Circles */}
        <div className="absolute top-0 right-0 w-[500px] h-[500px] border-[50px] border-white/5 rounded-full -mr-32 -mt-32"></div>
      </div>

      {/* Stats Grid: Overlapping the Hero just like About/Team cards */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16 relative z-30">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
          {[
            { label: 'Words Added', value: stats.wordsAdded, color: 'text-stone-900' },
            { label: 'Validated', value: stats.validated, color: 'text-stone-900' },
            { label: 'Examples', value: stats.usageExamples, color: 'text-stone-900' },
            { label: 'Reputation', value: stats.reputation, color: 'text-emerald-600' }
          ].map((stat, i) => (
            <div key={i} className="bg-white rounded-[2.5rem] p-10 border border-stone-200 shadow-2xl shadow-emerald-900/5 text-center transition-all hover:scale-[1.02]">
              <div className={`text-4xl md:text-5xl font-black font-logo mb-2 ${stat.color}`}>
                {loadingData ? '...' : stat.value}
              </div>
              <div className="text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] whitespace-nowrap">
                {stat.label}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Content Layout Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-20 grid lg:grid-cols-3 gap-12">
        
        {/* Activity Section: Mirrored from About "How it Works" list */}
        <div className="lg:col-span-2">
          <section className="bg-white rounded-[3rem] border border-stone-200 p-12 shadow-sm">
            <div className="flex items-center justify-between mb-12">
              <h2 className="text-3xl font-black text-stone-900 font-logo uppercase tracking-tight">Archive Contributions</h2>
              <Link href="/contribute" className="text-[10px] font-black text-emerald-600 uppercase tracking-[0.3em] border-b-2 border-emerald-100 hover:border-emerald-600 transition-all pb-1">
                + New Record
              </Link>
            </div>

            {loadingData ? (
              <div className="py-20 text-center text-stone-300 font-black uppercase tracking-[0.3em] text-[10px] animate-pulse">Syncing...</div>
            ) : recentContributions.length === 0 ? (
              <div className="text-center py-20 bg-stone-50 rounded-[2.5rem] border border-stone-100">
                <p className="text-stone-400 font-medium mb-10 italic">The contribution log is currently empty.</p>
                <Link href="/contribute" className="bg-emerald-900 text-white px-12 py-5 rounded-2xl font-black text-xs uppercase tracking-[0.3em] hover:bg-stone-900 transition-all">
                  Archive First Word
                </Link>
              </div>
            ) : (
              <div className="space-y-6">
                {recentContributions.map((contrib) => (
                  <Link href={`/entry/${contrib.id}`} key={contrib.id} className="block group">
                    <div className="flex items-center justify-between p-8 rounded-[2.5rem] border border-stone-50 hover:border-emerald-200 hover:bg-emerald-50/30 transition-all duration-300">
                      <div>
                        <h3 className="text-2xl font-black text-stone-900 group-hover:text-emerald-900 transition-colors font-logo uppercase tracking-tight">{contrib.headword}</h3>
                        <p className="text-[10px] text-stone-400 font-black uppercase tracking-widest mt-1">{contrib.language?.name}</p>
                      </div>
                      <div className="flex items-center gap-8">
                        <span className={`text-[9px] font-black px-5 py-2 rounded-xl uppercase tracking-[0.2em] border ${
                          contrib.validation_status === 'verified' 
                            ? 'bg-emerald-50 text-emerald-700 border-emerald-100' 
                            : 'bg-amber-50 text-amber-700 border-amber-100'
                        }`}>
                          {contrib.validation_status}
                        </span>
                        <span className="text-emerald-500 font-black group-hover:translate-x-2 transition-transform opacity-0 group-hover:opacity-100">→</span>
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </section>
        </div>

        {/* Sidebar Meta: Mirrored from Team Pillar design */}
        <div className="space-y-12">
          {/* Languages Sidebar Card */}
          <section className="bg-white rounded-[3rem] border border-stone-200 p-12 shadow-sm">
            <h2 className="text-xl font-black text-stone-900 font-logo mb-10 uppercase tracking-tight">Focus Languages</h2>
            <div className="flex flex-wrap gap-4 mb-12">
              {userLanguages.length > 0 ? (
                userLanguages.map((langId) => (
                  <div key={langId} className="bg-stone-50 border border-stone-100 px-6 py-3 rounded-2xl text-[10px] font-black text-stone-600 uppercase tracking-widest">
                    {getLanguageName(langId)}
                  </div>
                ))
              ) : (
                <p className="text-stone-400 text-sm font-medium italic">No languages selected.</p>
              )}
            </div>
            <button 
              onClick={() => setShowLanguageSelector(true)}
              className="w-full py-6 border-2 border-dashed border-stone-200 rounded-3xl text-[10px] font-black text-stone-400 uppercase tracking-[0.3em] hover:border-emerald-500 hover:text-emerald-600 transition-all bg-stone-50/50"
            >
              {savingLanguages ? 'UPDATING...' : 'Manage Focus'}
            </button>
          </section>

          {/* Moderator Dashboard: Mirrored from Team/About CTA DNA */}
          {isUserModerator && (
            <section className="bg-emerald-900 rounded-[3rem] p-12 text-white relative overflow-hidden group shadow-2xl shadow-emerald-900/30">
              <div className="relative z-10">
                <h2 className="text-3xl font-black font-logo mb-4 uppercase tracking-tight">Authority</h2>
                <p className="text-emerald-100/50 text-sm mb-12 font-medium leading-relaxed italic">Validation tools active. Your contributions carry cultural weight.</p>
                <Link href="/moderate" className="block text-center bg-white text-emerald-900 py-5 rounded-2xl font-black text-[10px] uppercase tracking-[0.3em] hover:bg-emerald-50 transition-all shadow-lg">
                  Launch Suite
                </Link>
              </div>
              <div className="absolute -bottom-10 -left-10 w-40 h-40 border-[30px] border-white/5 rounded-full group-hover:scale-125 transition-transform duration-700"></div>
            </section>
          )}
        </div>
      </div>
      
      {/* Selector Modal Overlay */}
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