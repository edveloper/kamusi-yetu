'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { getEntries, updateEntryStatus } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'
import Link from 'next/link'

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [selectedTab, setSelectedTab] = useState<'pending' | 'flagged'>('pending')
  const [languages, setLanguages] = useState<any[]>([])
  const [selectedLanguage, setSelectedLanguage] = useState('all')
  
  const [pendingSubmissions, setPendingSubmissions] = useState<any[]>([])
  const [flaggedEntries, setFlaggedEntries] = useState<any[]>([])
  const [modStats, setModStats] = useState({ thisWeek: 0, score: 0 })
  const [loadingData, setLoadingData] = useState(true)
  const [reviewingId, setReviewingId] = useState<string | null>(null)
  const [actionNote, setActionNote] = useState('')
  const [processing, setProcessing] = useState(false)
  const [isUserModerator, setIsUserModerator] = useState(false)

  useEffect(() => { setMounted(true) }, [])

  useEffect(() => {
    async function checkAccess() {
      if (loading || !user) return
      const modStatus = await isModerator(user.id)
      setIsUserModerator(modStatus)
      if (!modStatus) router.push('/profile')
    }
    if (!loading) checkAccess()
  }, [user, loading, router])

  useEffect(() => {
    async function loadData() {
      if (!user) return
      try {
        const langs = await getLanguages()
        setLanguages(langs)
        const pending = await getEntries({ validation_status: 'pending' })
        setPendingSubmissions(pending || [])
        const flagged = await getEntries({ validation_status: 'flagged' })
        setFlaggedEntries(flagged || [])
        const stats = await getModeratorStats(user.id)
        setModStats(stats)
      } catch (err) {
        console.error('Failed to load moderation data:', err)
      } finally {
        setLoadingData(false)
      }
    }
    if (user && isUserModerator) loadData()
  }, [user, isUserModerator])

  const handleAction = async (entryId: string, action: 'approve' | 'reject' | 'flag') => {
    if (!user) return
    setProcessing(true)
    try {
      let newStatus: 'verified' | 'flagged' | 'disputed' = 'disputed'
      if (action === 'approve') newStatus = 'verified'
      else if (action === 'flag') newStatus = 'flagged'
      else newStatus = 'disputed'

      await updateEntryStatus(entryId, newStatus, user.id)

      const pending = await getEntries({ validation_status: 'pending' })
      setPendingSubmissions(pending || [])
      const flagged = await getEntries({ validation_status: 'flagged' })
      setFlaggedEntries(flagged || [])
      const stats = await getModeratorStats(user.id)
      setModStats(stats)

      setReviewingId(null)
      setActionNote('')
    } catch (err) {
      console.error('Action failed:', err)
      alert('Failed to process action.')
    } finally {
      setProcessing(false)
    }
  }

  if (!mounted || loading) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center">
      <div className="animate-spin rounded-full h-12 w-12 border-4 border-emerald-200 border-t-emerald-600"></div>
    </div>
  )

  if (!isUserModerator) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center p-4">
      <div className="bg-white p-12 rounded-[2.5rem] shadow-xl text-center max-w-md border border-stone-200">
        <div className="text-6xl mb-6">🚫</div>
        <h2 className="text-3xl font-black text-gray-900 mb-4 font-logo">Access Denied</h2>
        <p className="text-stone-500 font-medium mb-8">This chamber is reserved for community elders and moderators.</p>
        <Link href="/profile" className="inline-block bg-stone-900 text-white px-8 py-4 rounded-2xl font-black">Return to Profile</Link>
      </div>
    </div>
  )

  const displayedSubmissions = selectedLanguage === 'all' ? pendingSubmissions : pendingSubmissions.filter(s => s.language_id === selectedLanguage)
  const displayedFlagged = selectedLanguage === 'all' ? flaggedEntries : flaggedEntries.filter(e => e.language_id === selectedLanguage)

  return (
    <div className="min-h-screen bg-stone-50">
      {/* Moderation Header */}
      <div className="bg-emerald-900 text-white pt-20 pb-24 border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col lg:flex-row lg:items-end justify-between gap-8">
            <div className="max-w-2xl">
              <h1 className="text-4xl md:text-5xl font-black font-logo tracking-tight mb-4">Council Chamber</h1>
              <p className="text-emerald-100/70 text-lg font-medium italic">Reviewing and validating the community's collective wisdom.</p>
            </div>
            
            <div className="flex flex-wrap gap-4">
               <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50 min-w-[140px]">
                  <div className="text-xs font-black text-emerald-400 uppercase tracking-widest mb-1">Weekly Reviews</div>
                  <div className="text-3xl font-black">{loadingData ? '...' : modStats.thisWeek}</div>
               </div>
               <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50 min-w-[140px]">
                  <div className="text-xs font-black text-emerald-400 uppercase tracking-widest mb-1">Guardian Score</div>
                  <div className="text-3xl font-black">{loadingData ? '...' : modStats.score}</div>
               </div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10">
        <div className="grid lg:grid-cols-4 gap-8">
          
          {/* Controls Sidebar */}
          <div className="lg:col-span-1 space-y-4">
            <div className="bg-white p-6 rounded-3xl shadow-xl border border-stone-200">
               <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-3 ml-1">Filter by Language</label>
               <select 
                value={selectedLanguage}
                onChange={(e) => setSelectedLanguage(e.target.value)}
                className="w-full px-4 py-3 bg-stone-50 border-2 border-stone-50 rounded-xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-bold text-gray-900 appearance-none cursor-pointer"
              >
                <option value="all">All Dialects</option>
                {languages.map(lang => (
                  <option key={lang.id} value={lang.id}>{lang.name}</option>
                ))}
              </select>
            </div>

            <nav className="flex flex-col gap-2">
              <button
                onClick={() => setSelectedTab('pending')}
                className={`flex items-center justify-between p-5 rounded-2xl font-black transition-all ${selectedTab === 'pending' ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-900/20' : 'bg-white text-stone-500 hover:bg-stone-100 border border-stone-200'}`}
              >
                <span>🔔 Pending Review</span>
                <span className={`px-2 py-1 rounded-lg text-xs ${selectedTab === 'pending' ? 'bg-emerald-500' : 'bg-stone-100'}`}>{pendingSubmissions.length}</span>
              </button>
              <button
                onClick={() => setSelectedTab('flagged')}
                className={`flex items-center justify-between p-5 rounded-2xl font-black transition-all ${selectedTab === 'flagged' ? 'bg-red-600 text-white shadow-lg shadow-red-900/20' : 'bg-white text-stone-500 hover:bg-stone-100 border border-stone-200'}`}
              >
                <span>🚨 Flagged Entries</span>
                <span className={`px-2 py-1 rounded-lg text-xs ${selectedTab === 'flagged' ? 'bg-red-500' : 'bg-stone-100'}`}>{flaggedEntries.length}</span>
              </button>
            </nav>
          </div>

          {/* Submissions List */}
          <div className="lg:col-span-3 pb-20">
            {loadingData ? (
              <div className="bg-white p-20 rounded-[2.5rem] border border-stone-200 text-center">
                <div className="animate-spin rounded-full h-10 w-10 border-4 border-stone-100 border-t-emerald-600 mx-auto"></div>
              </div>
            ) : (
              <div className="space-y-6">
                {(selectedTab === 'pending' ? displayedSubmissions : displayedFlagged).map((submission) => (
                  <div key={submission.id} className={`bg-white rounded-[2.5rem] border-2 transition-all overflow-hidden ${reviewingId === submission.id ? 'border-emerald-500 shadow-2xl scale-[1.01]' : 'border-white shadow-sm hover:shadow-md'}`}>
                    <div className="p-8 md:p-10">
                      <div className="flex flex-wrap items-center gap-4 mb-6">
                        <span className="bg-stone-100 text-stone-600 px-4 py-1.5 rounded-full text-xs font-black uppercase tracking-widest">
                          {submission.language?.name || 'Unknown'}
                        </span>
                        <span className="text-xs font-bold text-stone-400">
                          Submitted {new Date(submission.created_at).toLocaleDateString()}
                        </span>
                      </div>

                      <h3 className="text-4xl font-black text-gray-900 mb-6 font-logo leading-tight">
                        {submission.headword}
                      </h3>

                      <div className="grid md:grid-cols-2 gap-8 mb-8">
                        <div>
                          <p className="text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3">Definition</p>
                          <p className="text-lg text-stone-700 leading-relaxed font-medium bg-stone-50 p-5 rounded-2xl border border-stone-100 italic">
                            "{submission.primary_definition}"
                          </p>
                        </div>
                        <div className="space-y-4">
                          {submission.part_of_speech && (
                            <div>
                              <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Part of Speech</p>
                              <p className="font-bold text-gray-900">{submission.part_of_speech}</p>
                            </div>
                          )}
                          {submission.dialect_variant && (
                            <div>
                              <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Dialect Context</p>
                              <p className="font-bold text-gray-900">{submission.dialect_variant}</p>
                            </div>
                          )}
                        </div>
                      </div>

                      {/* Review Interface */}
                      <div className="pt-8 border-t border-stone-100">
                        {reviewingId === submission.id ? (
                          <div className="space-y-6 animate-in slide-in-from-top-4 duration-300">
                            <textarea
                              value={actionNote}
                              onChange={(e) => setActionNote(e.target.value)}
                              placeholder="Internal moderator notes (optional)..."
                              className="w-full px-6 py-4 bg-stone-50 border-2 border-emerald-100 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-medium text-stone-600 italic"
                              rows={2}
                            />
                            <div className="flex flex-wrap gap-3">
                              <button
                                onClick={() => handleAction(submission.id, 'approve')}
                                disabled={processing}
                                className="flex-1 min-w-[140px] bg-emerald-600 text-white px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-emerald-900/10 disabled:opacity-50"
                              >
                                {processing ? '...' : '✓ Approve Entry'}
                              </button>
                              <button
                                onClick={() => handleAction(submission.id, 'reject')}
                                disabled={processing}
                                className="flex-1 min-w-[140px] bg-red-600 text-white px-6 py-4 rounded-xl hover:bg-red-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-red-900/10 disabled:opacity-50"
                              >
                                {processing ? '...' : '✗ Discard'}
                              </button>
                              <button
                                onClick={() => { setReviewingId(null); setActionNote(''); }}
                                className="px-6 py-4 text-stone-400 font-black hover:text-stone-600 transition tracking-widest text-xs"
                              >
                                CANCEL
                              </button>
                            </div>
                          </div>
                        ) : (
                          <div className="flex items-center justify-between">
                             <button
                                onClick={() => setReviewingId(submission.id)}
                                className="bg-stone-900 text-white px-8 py-3.5 rounded-xl hover:bg-stone-800 transition font-black text-sm tracking-wide"
                              >
                                Review Submission
                              </button>
                              <button
                                onClick={() => handleAction(submission.id, 'flag')}
                                className="p-3 text-stone-300 hover:text-red-500 transition-colors"
                                title="Flag for discussion"
                              >
                                🚩
                              </button>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                ))}

                {(selectedTab === 'pending' ? displayedSubmissions : displayedFlagged).length === 0 && (
                  <div className="bg-white p-24 rounded-[3rem] border border-stone-200 text-center shadow-sm">
                    <div className="text-6xl mb-6">✨</div>
                    <h3 className="text-2xl font-black text-gray-900 mb-2 font-logo">Clear Horizon</h3>
                    <p className="text-stone-500 font-medium">No {selectedTab} submissions to review right now.</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}