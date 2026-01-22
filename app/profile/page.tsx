'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState, useMemo } from 'react'
import Link from 'next/link'
import { 
  getUserStats, 
  getUserProfile, 
  isModerator, 
  updateUserProfile, 
  uploadAvatar,
  deleteAvatar 
} from '@/lib/api/users'
import { getEntries, getSavedWords, getSavedWordsCursor, removeSavedWord } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import LanguageSelector from '@/components/LanguageSelector'
import SavedWordsList from '@/components/SavedWordsList'
import { supabase } from '@/lib/supabase'

export default function ProfilePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  
  // UI States
  const [isEditing, setIsEditing] = useState(false)
  const [uploading, setUploading] = useState(false)
  const [loadingData, setLoadingData] = useState(true)
  const [showLanguageSelector, setShowLanguageSelector] = useState(false)

  // Data States
  const [profile, setProfile] = useState<any>(null)
  const [editData, setEditData] = useState({ display_name: '', bio: '', avatar_url: '' })
  const [stats, setStats] = useState({ wordsAdded: 0, validated: 0, usageExamples: 0, reputation: 0, joinedDate: 'Recently' })
  const [recentContributions, setRecentContributions] = useState<any[]>([])
  const [userLanguages, setUserLanguages] = useState<string[]>([])
  const [allLanguages, setAllLanguages] = useState<any[]>([])
  const [isUserModerator, setIsUserModerator] = useState(false)

  // Saved words states (cursor pagination)
  const [savedWords, setSavedWords] = useState<any[]>([])
  const [savedLoading, setSavedLoading] = useState(true)
  const [savedCursor, setSavedCursor] = useState<string | null>(null) // ISO timestamp of last item
  const SAVED_PAGE_SIZE = 12
  const [savedFilterLang, setSavedFilterLang] = useState<string | null>(null)
  const [savedCount, setSavedCount] = useState<number | null>(null)

  // Identicon Logic (defensive)
  const identiconBg = useMemo(() => {
    const colors = ['bg-amber-500', 'bg-emerald-600', 'bg-blue-600', 'bg-rose-600', 'bg-violet-600', 'bg-teal-600']
    const rawName = profile?.display_name || user?.email || 'A'
    const firstChar = (typeof rawName === 'string' && rawName.length > 0) ? rawName[0] : 'A'
    const charCode = firstChar.charCodeAt(0)
    return colors[charCode % colors.length]
  }, [profile?.display_name, user?.email])

  useEffect(() => {
    setMounted(true)
    if (!loading && !user) router.push('/login')
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
        setEditData({ 
          display_name: userProfile.display_name || '', 
          bio: userProfile.bio || '', 
          avatar_url: userProfile.avatar_url || '' 
        })
        setUserLanguages(userProfile.languages || [])
        setIsUserModerator(modStatus)
        
        const userEntries = allEntries?.filter((e: any) => e.created_by === user.id) || []
        setStats({
          wordsAdded: userStats.wordsAdded,
          validated: userStats.validated,
          usageExamples: userStats.usageExamples,
          reputation: (userStats.wordsAdded * 10) + (userStats.validated * 5),
          joinedDate: new Date(user.created_at).toLocaleDateString('en-US', { month: 'long', year: 'numeric' })
        })
        setRecentContributions(userEntries.slice(0, 5))

        // Fetch saved words first page using cursor API
        setSavedLoading(true)
        const firstPage = await getSavedWordsCursor(user.id, { limit: SAVED_PAGE_SIZE })
        setSavedWords(firstPage)
        setSavedCursor(firstPage.length ? firstPage[firstPage.length - 1].created_at : null)
        console.debug('savedWords loaded (cursor):', firstPage)

        // Fetch saved count (safe direct count)
        try {
          const { count, error } = await supabase
            .from('saved_words')
            .select('id', { count: 'exact', head: true })
            .eq('user_id', user.id)
          if (!error) setSavedCount(count ?? 0)
        } catch (e) {
          setSavedCount(null)
        }

      } catch (err: any) {
        console.error('Failed to sync archive data:', {
          message: err?.message ?? String(err),
          code: err?.code ?? null,
          details: err?.details ?? null,
          hint: err?.hint ?? null,
          original: err?.original ?? null,
          stack: err?.stack ?? null,
          raw: err
        })
      } finally {
        setLoadingData(false)
        setSavedLoading(false)
      }
    }
    if (user) loadUserData()
  }, [user])

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files || e.target.files.length === 0 || !user) return
    try {
      setUploading(true)
      const file = e.target.files[0]
      const publicUrl = await uploadAvatar(user.id, file)
      setEditData(prev => ({ ...prev, avatar_url: publicUrl }))
    } catch (err: any) {
      alert(err.message || 'Upload failed.')
    } finally {
      setUploading(false)
    }
  }

  const handleRemovePhoto = async () => {
    if (!user || !profile?.avatar_url) return
    if (!confirm("Remove this photo from the archive?")) return

    try {
      setUploading(true)
      const urlParts = profile.avatar_url.split('/avatars/')
      const path = urlParts[1]
      if (path) await deleteAvatar(path)
      
      const updatedData = { ...editData, avatar_url: '' }
      await updateUserProfile(user.id, updatedData)
      setProfile((prev: any) => ({ ...prev, avatar_url: '' }))
      setEditData(updatedData)
    } catch (err) {
      alert('Failed to remove photo.')
    } finally {
      setUploading(false)
    }
  }

  const handleUpdateProfile = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!user) return
    try {
      await updateUserProfile(user.id, editData)
      setProfile({ ...profile, ...editData })
      setIsEditing(false)
    } catch (err) {
      alert('Failed to update record.')
    }
  }

  const getLanguageName = (id: string) => allLanguages.find(l => l.id === id)?.name || id
  const displayName = profile?.display_name || user?.email?.split('@')[0] || 'Contributor'

  // Cursor-based load more
  const loadMoreSaved = async () => {
    if (!user) return
    // if savedCursor is null, there is no more data
    if (!savedCursor) return
    try {
      setSavedLoading(true)
      const more = await getSavedWordsCursor(user.id, { limit: SAVED_PAGE_SIZE, before: savedCursor, language: savedFilterLang ?? undefined })
      setSavedWords(prev => [...prev, ...more])
      setSavedCursor(more.length ? more[more.length - 1].created_at : null)
    } catch (err) {
      console.error('Failed to load more saved words:', err)
    } finally {
      setSavedLoading(false)
    }
  }

  const handleUnsave = async (entryOrSavedId: string) => {
    if (!user) return
    const prev = savedWords
    // optimistic remove by matching entry.id, saved row id, or entry_id
    setSavedWords(prev => prev.filter(s => s.entry?.id !== entryOrSavedId && s.id !== entryOrSavedId && s.entry_id !== entryOrSavedId))
    try {
      const savedRow = prev.find(s => s.id === entryOrSavedId)
      if (savedRow) {
        // delete by entry_id using existing API
        await removeSavedWord(user.id, savedRow.entry_id)
      } else {
        // assume it's an entry id
        await removeSavedWord(user.id, entryOrSavedId)
      }

      // update savedCount if present
      setSavedCount((c) => (typeof c === 'number' ? Math.max(0, c - 1) : c))
    } catch (err) {
      // rollback
      setSavedWords(prev)
      alert('Could not remove saved word.')
    }
  }

  if (!mounted || loading || !user) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center">
      <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-600"></div>
    </div>
  )

  return (
    <div className="min-h-screen bg-stone-50 pb-24 font-sans">
      {/* Hero Header */}
      <div className="bg-emerald-900 text-white py-16 md:py-24 relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 relative z-10">
          <div className="flex flex-col md:flex-row items-center gap-8 md:gap-12">
            
            {/* Profile Avatar Section */}
            <div className="flex flex-col items-center gap-5">
              <div className="w-32 h-32 md:w-44 md:h-44 rounded-[2.5rem] bg-white overflow-hidden border-4 border-emerald-800 shadow-2xl flex items-center justify-center">
                {profile?.avatar_url ? (
                  <img src={profile.avatar_url} alt="Profile" className="w-full h-full object-cover" />
                ) : (
                  <div className={`w-full h-full ${identiconBg} flex items-center justify-center`}>
                    <span className="text-white text-6xl font-black font-logo uppercase drop-shadow-md">
                      {displayName[0]}
                    </span>
                  </div>
                )}
              </div>
              
              {/* Action Buttons */}
              <div className="flex gap-2">
                <button 
                  onClick={() => setIsEditing(true)}
                  className="bg-emerald-500/20 hover:bg-emerald-500 border border-emerald-500/30 text-white px-5 py-2.5 rounded-xl text-[9px] font-black uppercase tracking-widest transition-all"
                >
                  Edit Profile
                </button>
                {profile?.avatar_url && (
                  <button 
                    onClick={handleRemovePhoto}
                    className="bg-red-500/10 hover:bg-red-600 border border-red-500/20 text-red-200 px-5 py-2.5 rounded-xl text-[9px] font-black uppercase tracking-widest transition-all"
                  >
                    Remove Photo
                  </button>
                )}
              </div>
            </div>
            
            <div className="text-center md:text-left flex-1 min-w-0">
              <h1 className="text-4xl md:text-7xl font-black font-logo tracking-tight mb-2 truncate">{displayName}</h1>
              <p className="text-emerald-200/60 max-w-xl text-lg font-medium mb-6 italic leading-relaxed">
                {profile?.bio || "Preserving the echoes of our ancestors, one word at a time."}
              </p>
              <div className="flex flex-wrap gap-3 justify-center md:justify-start items-center">
                <span className="bg-emerald-500/20 text-emerald-300 px-4 py-1.5 rounded-lg text-[9px] font-black uppercase tracking-widest border border-emerald-500/30">Contributor</span>
                {isUserModerator && (
                  <span className="bg-amber-500/20 text-amber-300 px-4 py-1.5 rounded-lg text-[9px] font-black uppercase tracking-widest border border-amber-500/30 shadow-lg shadow-amber-900/20">
                    Moderator
                  </span>
                )}
                <span className="text-emerald-100/40 py-1.5 text-[9px] font-black uppercase tracking-widest">Since {stats.joinedDate}</span>

                {/* Saved count badge */}
                {savedCount !== null && (
                  <span className="bg-white/5 text-emerald-100 px-3 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest border border-emerald-200/10">
                    Saved {savedCount}
                  </span>
                )}
              </div>
            </div>
          </div>
        </div>
        <div className="absolute -top-24 -right-24 w-96 h-96 bg-white/5 rounded-full blur-3xl"></div>
      </div>

      {/* Stats Grid Restored */}
      <div className="max-w-7xl mx-auto px-4 -mt-12 relative z-30">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[
            { label: 'Words Added', value: stats.wordsAdded },
            { label: 'Validated', value: stats.validated },
            { label: 'Examples', value: stats.usageExamples },
            { label: 'Reputation', value: stats.reputation, color: 'text-emerald-600' }
          ].map((s, i) => (
            <div key={i} className="bg-white rounded-[2rem] p-8 border border-stone-200 shadow-xl shadow-stone-200/50 text-center transition-transform hover:translate-y-[-4px]">
              <div className={`text-3xl md:text-5xl font-black font-logo mb-1 ${s.color || 'text-stone-900'}`}>{loadingData ? '...' : s.value}</div>
              <div className="text-[10px] font-black text-stone-400 uppercase tracking-widest">{s.label}</div>
            </div>
          ))}
        </div>
      </div>

      {/* Main Content Restored */}
      <div className="max-w-7xl mx-auto px-4 mt-16 grid lg:grid-cols-3 gap-12">
        <div className="lg:col-span-2">
          <section className="bg-white rounded-[3rem] border border-stone-200 p-8 md:p-12 shadow-sm">
            <h2 className="text-3xl font-black text-stone-900 font-logo mb-10 uppercase tracking-tight">Archive Contributions</h2>
            {recentContributions.length === 0 ? (
              <div className="text-center py-16 bg-stone-50 rounded-[2.5rem] border-2 border-dashed border-stone-200">
                <p className="text-stone-400 font-bold mb-4">Your contribution starts here.</p>
                <Link href="/contribute" className="text-emerald-600 font-black text-xs uppercase tracking-widest hover:underline">+ Add First Entry</Link>
              </div>
            ) : (
              <div className="space-y-4">
                {recentContributions.map((c) => (
                  <Link href={`/entry/${c.id}`} key={c.id} className="block group">
                    <div className="flex items-center justify-between p-6 rounded-[2rem] border border-stone-50 bg-stone-50/30 hover:border-emerald-200 hover:bg-white transition-all shadow-sm hover:shadow-xl">
                      <div>
                        <h3 className="text-xl font-black text-stone-900 group-hover:text-emerald-900 font-logo uppercase tracking-tight">{c.headword}</h3>
                        <p className="text-[10px] text-stone-400 font-black uppercase tracking-widest mt-1">{getLanguageName(c.language_id)}</p>
                      </div>
                      <span className={`text-[9px] font-black px-4 py-2 rounded-xl uppercase tracking-widest border ${c.validation_status === 'verified' ? 'bg-emerald-50 text-emerald-700 border-emerald-100' : 'bg-amber-50 text-amber-700 border-amber-100'}`}>
                        {c.validation_status}
                      </span>
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </section>
        </div>

        <div className="space-y-8">
          {isUserModerator && (
            <section className="bg-emerald-900 rounded-[2.5rem] p-10 text-white shadow-2xl relative overflow-hidden group">
              <div className="relative z-10">
                <h2 className="text-2xl font-black font-logo mb-3 uppercase italic tracking-tight">Moderator Dashboard</h2>
                <p className="text-emerald-100/50 text-xs mb-8 leading-relaxed">Discernment is the foundation of truth.</p>
                <Link href="/moderate" className="block text-center bg-white text-emerald-900 py-4 rounded-xl font-black text-[10px] uppercase tracking-widest hover:bg-emerald-50 transition-all shadow-lg">
                  Launch Moderator Dashboard
                </Link>
              </div>
              <div className="absolute -bottom-10 -right-10 w-40 h-40 border-[20px] border-white/5 rounded-full group-hover:scale-125 transition-transform duration-700"></div>
            </section>
          )}

          <section className="bg-white rounded-[2.5rem] border border-stone-200 p-10 shadow-sm">
            <h2 className="text-lg font-black text-stone-900 font-logo mb-6 uppercase tracking-widest">My Languages</h2>
            <div className="flex flex-wrap gap-2 mb-8">
              {userLanguages.length > 0 ? userLanguages.map((l) => (
                <span key={l} className="bg-stone-100 px-4 py-2 rounded-xl text-[9px] font-black text-stone-600 uppercase tracking-widest border border-stone-200">
                  {getLanguageName(l)}
                </span>
              )) : <p className="text-stone-400 text-xs italic">No languages selected.</p>}
            </div>
            <button onClick={() => setShowLanguageSelector(true)} className="w-full py-4 border-2 border-dashed border-stone-200 rounded-xl text-[9px] font-black text-stone-400 uppercase tracking-widest hover:border-emerald-500 hover:text-emerald-600 transition-all">
              Manage My Languages
            </button>

            {/* Saved words list inserted here */}
            <div className="mt-6">
              <SavedWordsList
                items={savedWords}
                loading={savedLoading}
                onUnsave={handleUnsave}
                onLoadMore={loadMoreSaved}
                showLoadMore={!!savedCursor}
                languages={allLanguages}
                filterLang={savedFilterLang}
                onFilterChange={(lang) => {
                  setSavedFilterLang(lang)
                    ; (async () => {
                      setSavedLoading(true)
                      try {
                        // When filter changes, reload first page using cursor API
                        const data = await getSavedWordsCursor(user!.id, { limit: SAVED_PAGE_SIZE, language: lang ?? undefined })
                        setSavedWords(data)
                        setSavedCursor(data.length ? data[data.length - 1].created_at : null)
                      } catch (err) {
                        console.error(err)
                      } finally {
                        setSavedLoading(false)
                      }
                    })()
                }}
              />
            </div>
          </section>
        </div>
      </div>

      {/* EDIT MODAL Restored */}
      {isEditing && (
        <div className="fixed inset-0 bg-stone-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-white rounded-[3rem] max-w-lg w-full p-8 md:p-12 shadow-2xl border border-stone-100 overflow-hidden">
            <h2 className="text-3xl font-black font-logo mb-8 text-stone-900 uppercase">Update Record</h2>
            <form onSubmit={handleUpdateProfile} className="space-y-6">
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-3">Profile Photo</label>
                <div className="flex items-center gap-6 p-4 bg-stone-50 rounded-2xl border-2 border-stone-100">
                  <div className="w-16 h-16 rounded-2xl bg-white overflow-hidden border border-stone-200 shadow-inner flex-shrink-0">
                    {editData.avatar_url && <img src={editData.avatar_url} className="w-full h-full object-cover" />}
                  </div>
                  <div className="min-w-0">
                    <input 
                      type="file" 
                      accept="image/*"
                      onChange={handleFileChange}
                      className="text-[10px] text-stone-500 file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-[10px] file:font-black file:bg-emerald-600 file:text-white cursor-pointer w-full"
                    />
                    {uploading && <p className="text-[10px] text-emerald-600 mt-2 font-bold animate-pulse">Updating archive...</p>}
                  </div>
                </div>
              </div>
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Display Name</label>
                <input 
                  type="text" 
                  value={editData.display_name} 
                  onChange={(e) => setEditData({...editData, display_name: e.target.value})}
                  className="w-full p-5 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 focus:bg-white outline-none font-bold text-gray-900 transition-all"
                />
              </div>
              <div>
                <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-2">Biography</label>
                <textarea 
                  rows={3}
                  value={editData.bio} 
                  onChange={(e) => setEditData({...editData, bio: e.target.value})}
                  className="w-full p-5 bg-stone-50 border-2 border-stone-100 rounded-2xl focus:border-emerald-500 focus:bg-white outline-none font-medium text-sm transition-all resize-none"
                />
              </div>
              <div className="flex gap-4 pt-4">
                <button type="button" onClick={() => setIsEditing(false)} className="flex-1 py-5 font-black text-[10px] uppercase tracking-widest text-stone-400">Cancel</button>
                <button type="submit" disabled={uploading} className="flex-1 py-5 bg-emerald-600 text-white rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest shadow-xl disabled:opacity-50 transition-all">
                  Save Changes
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {showLanguageSelector && (
        <LanguageSelector 
          selectedLanguages={userLanguages} 
          onLanguagesChange={(langs) => {setUserLanguages(langs); setShowLanguageSelector(false)}} 
          onClose={() => setShowLanguageSelector(false)} 
        />
      )}
    </div>
  )
}
