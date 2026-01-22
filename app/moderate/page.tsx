'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState, useRef } from 'react'
import Link from 'next/link'
import {
  getPendingSuggestions,
  reviewSuggestion,
  applySuggestionToEntry
} from '@/lib/api/suggestions'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'

type Suggestion = {
  id: string
  entry_id?: string | undefined
  user_id?: string | undefined
  type?: string | undefined
  headword?: string | undefined
  primary_definition?: string | undefined
  reason?: string | undefined
  details?: string | undefined
  source_type?: string | undefined
  source_reference?: string | undefined
  confidence?: string | undefined
  status?: string | undefined
  moderator_notes?: string | undefined
  created_at?: string | undefined
  contributor?: { display_name?: string | undefined; avatar_url?: string | undefined } | null
  language?: { id?: string; name?: string } | null
  part_of_speech?: string | undefined
  dialect_variant?: string | undefined
}

type Language = { id: string; name: string }

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [mounted, setMounted] = useState(false)
  const [selectedTab, setSelectedTab] = useState<'pending' | 'flagged'>('pending')
  const [languages, setLanguages] = useState<Language[]>([])
  const [selectedLanguage, setSelectedLanguage] = useState('all')

  const [items, setItems] = useState<Suggestion[]>([])
  const [loadingData, setLoadingData] = useState(true)
  const [modStats, setModStats] = useState({ thisWeek: 0, score: 0 })
  const [reviewingId, setReviewingId] = useState<string | null>(null)
  const [actionNote, setActionNote] = useState('')
  const [processingMap, setProcessingMap] = useState<Record<string, boolean>>({})
  const [isUserModerator, setIsUserModerator] = useState(false)

  // pagination cursor (ISO timestamp of last item)
  const [cursor, setCursor] = useState<string | null>(null)
  const PAGE_SIZE = 20
  const loadMoreRef = useRef<HTMLButtonElement | null>(null)

  useEffect(() => { setMounted(true) }, [])

  useEffect(() => {
    async function checkAccess() {
      if (loading || !user) return
      try {
        const modStatus = await isModerator(user.id)
        setIsUserModerator(modStatus)
        if (!modStatus && mounted) router.push('/profile')
      } catch (err) {
        console.error('Failed to check moderator status:', err)
        if (mounted) router.push('/profile')
      }
    }
    checkAccess()
  }, [user, loading, router, mounted])

  // helper to normalize rows from API into Suggestion[]
  const normalizeRows = (rows: any[] | undefined): Suggestion[] => {
    if (!rows || !Array.isArray(rows)) return []
    return rows.map((r: any) => ({
      id: String(r.id),
      entry_id: r.entry_id ?? undefined,
      user_id: r.user_id ?? undefined,
      type: r.type ?? undefined,
      headword: r.headword ?? undefined,
      primary_definition: r.primary_definition ?? undefined,
      reason: r.reason ?? undefined,
      details: r.details ?? undefined,
      source_type: r.source_type ?? undefined,
      source_reference: r.source_reference ?? undefined,
      confidence: r.confidence ?? undefined,
      status: r.status ?? undefined,
      moderator_notes: r.moderator_notes ?? undefined,
      created_at: r.created_at ?? undefined,
      contributor: r.contributor ? { display_name: r.contributor.display_name ?? undefined, avatar_url: r.contributor.avatar_url ?? undefined } : undefined,
      language: r.language ? { id: r.language.id ?? r.language.language_id ?? undefined, name: r.language.name ?? r.language.language_id ?? undefined } : undefined,
      part_of_speech: r.part_of_speech ?? undefined,
      dialect_variant: r.dialect_variant ?? undefined
    }))
  }

  // initial load (pending suggestions)
  useEffect(() => {
    async function loadInitial() {
      if (!user || !isUserModerator) return
      setLoadingData(true)
      try {
        const [langs, pending, stats] = await Promise.all([
          getLanguages(),
          getPendingSuggestions(PAGE_SIZE),
          getModeratorStats(user.id)
        ])
        setLanguages(langs || [])
        const normalized = normalizeRows(pending)
        setItems(normalized)
        setCursor(normalized.length ? normalized[normalized.length - 1].created_at ?? null : null)
        setModStats(stats || { thisWeek: 0, score: 0 })
      } catch (err) {
        console.error('Failed to load moderation data:', err)
        alert('Could not load moderation data. Check console for details.')
      } finally {
        setLoadingData(false)
      }
    }
    loadInitial()
  }, [user, isUserModerator])

  // filtered view
  const displayedList = selectedLanguage === 'all'
    ? items
    : items.filter(i => i.language?.id === selectedLanguage)

  // per-item processing helpers
  const setProcessing = (id: string, value: boolean) => {
    setProcessingMap(prev => ({ ...prev, [id]: value }))
  }

  // optimistic removal helper
  const removeItemOptimistic = (id: string) => {
    setItems(prev => prev.filter(i => i.id !== id))
  }

  // rollback helper (re-add item)
  const rollbackAdd = (item: Suggestion) => {
    const normalized: Suggestion = { ...item, entry_id: item.entry_id ?? undefined }
    setItems(prev => [normalized, ...prev])
  }

  // review action (accept/reject)
  const handleReviewAction = async (suggestion: Suggestion, action: 'accept' | 'reject') => {
    if (!user) return
    const id = suggestion.id
    if (!id) return
    if (action === 'reject') {
      const ok = confirm('Are you sure you want to reject this suggestion? This cannot be undone here.')
      if (!ok) return
    }

    setProcessing(id, true)
    removeItemOptimistic(id)

    try {
      await reviewSuggestion(id, user.id, action, action === 'reject' ? actionNote || 'Rejected by moderator' : actionNote || 'Accepted by moderator')
      try {
        const stats = await getModeratorStats(user.id)
        setModStats(stats)
      } catch (e) {
        console.warn('Failed to refresh moderator stats:', e)
      }
      setReviewingId(null)
      setActionNote('')
    } catch (err) {
      rollbackAdd(suggestion)
      console.error('Review action failed:', err)
      alert('Failed to update suggestion. See console for details.')
    } finally {
      setProcessing(id, false)
    }
  }

  // apply suggestion to entry (explicit)
  const handleApply = async (suggestion: Suggestion) => {
    if (!user) return
    const id = suggestion.id
    if (!id) return
    const ok = confirm('Apply this suggestion to the entry? This will update the entry in the archive.')
    if (!ok) return

    setProcessing(id, true)
    removeItemOptimistic(id)

    try {
      await applySuggestionToEntry(id, user.id)
      try {
        const stats = await getModeratorStats(user.id)
        setModStats(stats)
      } catch (e) { console.warn('Failed to refresh stats:', e) }
      setReviewingId(null)
      setActionNote('')
      alert('Suggestion applied to entry.')
    } catch (err) {
      rollbackAdd(suggestion)
      console.error('Apply suggestion failed:', err)
      alert('Failed to apply suggestion. See console for details.')
    } finally {
      setProcessing(id, false)
    }
  }

  // flag action (quick mark)
  const handleFlag = async (suggestion: Suggestion) => {
    if (!user) return
    const id = suggestion.id
    if (!id) return
    setProcessing(id, true)
    try {
      await reviewSuggestion(id, user.id, 'reject', 'Flagged for discussion')
      setItems(prev => prev.filter(i => i.id !== id))
      try {
        const stats = await getModeratorStats(user.id)
        setModStats(stats)
      } catch (e) {}
    } catch (err) {
      console.error('Flag failed:', err)
      alert('Failed to flag suggestion.')
    } finally {
      setProcessing(id, false)
    }
  }

  // Load more (cursor pagination)
  const loadMore = async () => {
    if (!user || !isUserModerator) return
    if (!cursor) return
    setLoadingData(true)
    try {
      const more = await getPendingSuggestions(PAGE_SIZE, cursor)
      const moreNormalized = normalizeRows(more)
      if (moreNormalized && moreNormalized.length) {
        setItems(prev => [...prev, ...moreNormalized])
        setCursor(moreNormalized.length ? moreNormalized[moreNormalized.length - 1].created_at ?? null : null)
      } else {
        setCursor(null)
      }
    } catch (err) {
      console.error('Failed to load more suggestions:', err)
      alert('Could not load more suggestions.')
    } finally {
      setLoadingData(false)
    }
  }

  // defensive date formatter
  const formatDate = (iso?: string | null | undefined) => {
    if (!iso) return 'Unknown date'
    const d = new Date(iso)
    if (isNaN(d.getTime())) return 'Unknown date'
    return d.toLocaleDateString()
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
        <h2 className="text-3xl font-black text-gray-900 mb-4 font-logo tracking-tighter uppercase">Access Denied</h2>
        <p className="text-stone-500 font-medium mb-8">This chamber is reserved for community elders and guardians.</p>
        <Link href="/profile" className="inline-block bg-stone-900 text-white px-8 py-4 rounded-2xl font-black uppercase text-xs tracking-widest">Return to Profile</Link>
      </div>
    </div>
  )

  return (
    <div className="min-h-screen bg-stone-50">
      <div className="bg-emerald-900 text-white pt-20 pb-24 border-b border-emerald-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col lg:flex-row lg:items-end justify-between gap-8">
            <div className="max-w-2xl">
              <h1 className="text-4xl md:text-5xl font-black font-logo tracking-tight mb-4 uppercase">Moderator Dashboard</h1>
              <p className="text-emerald-100/70 text-lg font-medium italic font-serif">Reviewing and validating the community's collective wisdom.</p>
            </div>

            <div className="flex flex-wrap gap-4 font-logo">
              <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50 min-w-[140px]">
                <div className="text-[10px] font-black text-emerald-400 uppercase tracking-widest mb-1">Weekly Reviews</div>
                <div className="text-3xl font-black">{loadingData ? '...' : modStats.thisWeek}</div>
              </div>
              <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50 min-w-[140px]">
                <div className="text-[10px] font-black text-emerald-400 uppercase tracking-widest mb-1">Guardian Score</div>
                <div className="text-3xl font-black">{loadingData ? '...' : modStats.score}</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10">
        <div className="grid lg:grid-cols-4 gap-8">
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

            <nav className="flex flex-col gap-2 font-logo">
              <button
                onClick={() => setSelectedTab('pending')}
                className={`flex items-center justify-between p-5 rounded-2xl font-black transition-all uppercase text-[11px] tracking-widest ${selectedTab === 'pending' ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-900/20' : 'bg-white text-stone-500 hover:bg-stone-100 border border-stone-200'}`}
              >
                <span>🔔 Pending Review</span>
                <span className={`px-2 py-1 rounded-lg text-[10px] ${selectedTab === 'pending' ? 'bg-emerald-500' : 'bg-stone-100'}`}>{items.length}</span>
              </button>
            </nav>
          </div>

          <div className="lg:col-span-3 pb-20">
            {loadingData ? (
              <div className="bg-white p-20 rounded-[2.5rem] border border-stone-200 text-center">
                <div className="animate-spin rounded-full h-10 w-10 border-4 border-stone-100 border-t-emerald-600 mx-auto"></div>
              </div>
            ) : (
              <div className="space-y-6">
                {displayedList.map((submission) => {
                  const isProcessing = !!processingMap[submission.id]
                  return (
                    <div key={submission.id} className={`bg-white rounded-[2.5rem] border-2 transition-all overflow-hidden ${reviewingId === submission.id ? 'border-emerald-500 shadow-2xl scale-[1.01]' : 'border-white shadow-sm hover:shadow-md'}`}>
                      <div className="p-8 md:p-10">
                        <div className="flex flex-wrap items-center gap-4 mb-6">
                          <span className="bg-stone-100 text-stone-600 px-4 py-1.5 rounded-full text-[10px] font-black uppercase tracking-widest">
                            {submission.language?.name || 'Unknown'}
                          </span>
                          <span className="text-[10px] font-black text-stone-400 uppercase tracking-widest">
                            By {submission.contributor?.display_name || 'Anonymous'} • {formatDate(submission.created_at)}
                          </span>
                        </div>

                        <h3 className="text-4xl font-black text-gray-900 mb-6 font-logo leading-tight uppercase tracking-tighter">
                          {submission.headword || '(no headword)'}
                        </h3>

                        <div className="grid md:grid-cols-2 gap-8 mb-8">
                          <div>
                            <p className="text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3">Definition</p>
                            <p className="text-lg text-stone-700 leading-relaxed font-medium bg-stone-50 p-6 rounded-2xl border border-stone-100 italic font-serif">
                              "{submission.primary_definition || '—'}"
                            </p>
                          </div>
                          <div className="space-y-4">
                            {submission.part_of_speech && (
                              <div>
                                <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Part of Speech</p>
                                <p className="font-bold text-gray-900 uppercase text-sm">{submission.part_of_speech}</p>
                              </div>
                            )}
                            {submission.dialect_variant && (
                              <div>
                                <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Dialect Context</p>
                                <p className="font-bold text-gray-900 uppercase text-sm">{submission.dialect_variant}</p>
                              </div>
                            )}
                          </div>
                        </div>

                        <div className="pt-8 border-t border-stone-100">
                          {reviewingId === submission.id ? (
                            <div className="space-y-6 animate-in slide-in-from-top-4 duration-300">
                              <textarea
                                value={actionNote}
                                onChange={(e) => setActionNote(e.target.value)}
                                placeholder="Internal moderator notes (optional)..."
                                className="w-full px-6 py-4 bg-stone-50 border-2 border-emerald-100 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-medium text-stone-600 italic font-serif"
                                rows={2}
                              />
                              <div className="flex flex-wrap gap-3 font-logo">
                                <button
                                  onClick={() => handleReviewAction(submission, 'accept')}
                                  disabled={isProcessing}
                                  className="flex-1 min-w-[140px] bg-emerald-600 text-white px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-emerald-900/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Approve entry"
                                >
                                  {isProcessing ? '...' : '✓ Approve Entry'}
                                </button>
                                <button
                                  onClick={() => handleReviewAction(submission, 'reject')}
                                  disabled={isProcessing}
                                  className="flex-1 min-w-[140px] bg-red-600 text-white px-6 py-4 rounded-xl hover:bg-red-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-red-900/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Discard suggestion"
                                >
                                  {isProcessing ? '...' : '✗ Discard'}
                                </button>
                                <button
                                  onClick={() => { setReviewingId(null); setActionNote(''); }}
                                  className="px-6 py-4 text-stone-400 font-black hover:text-stone-600 transition tracking-widest text-[10px] uppercase"
                                >
                                  CANCEL
                                </button>
                              </div>
                            </div>
                          ) : (
                            <div className="flex items-center justify-between">
                              <div className="flex items-center gap-3">
                                <button
                                  onClick={() => { setReviewingId(submission.id); setActionNote(''); }}
                                  className="bg-stone-900 text-white px-8 py-3.5 rounded-xl hover:bg-stone-800 transition font-black text-[11px] tracking-widest uppercase font-logo"
                                  aria-label="Open review panel"
                                >
                                  Review Submission
                                </button>

                                <button
                                  onClick={() => handleApply(submission)}
                                  className="px-4 py-3 text-sm bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition font-black uppercase tracking-widest"
                                  aria-label="Apply suggestion to entry"
                                >
                                  Apply
                                </button>
                              </div>

                              <div className="flex items-center gap-3">
                                <button
                                  onClick={() => handleFlag(submission)}
                                  className="p-3 text-stone-300 hover:text-red-500 transition-colors"
                                  title="Flag for discussion"
                                  aria-label="Flag suggestion"
                                >
                                  🚩
                                </button>
                                {isProcessing && <div className="text-sm text-stone-400">Processing…</div>}
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                    </div>
                  )
                })}

                {displayedList.length === 0 && (
                  <div className="bg-white p-24 rounded-[3rem] border border-stone-200 text-center shadow-sm">
                    <div className="text-6xl mb-6">✨</div>
                    <h3 className="text-2xl font-black text-gray-900 mb-2 font-logo uppercase tracking-tighter">Clear Horizon</h3>
                    <p className="text-stone-500 font-medium font-serif italic">No {selectedTab} submissions to review right now.</p>
                  </div>
                )}

                {/* Load more */}
                {cursor && (
                  <div className="text-center mt-6">
                    <button
                      ref={loadMoreRef}
                      onClick={loadMore}
                      className="px-6 py-3 bg-emerald-600 text-white rounded-xl font-black uppercase text-[11px] tracking-widest"
                    >
                      Load more
                    </button>
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
