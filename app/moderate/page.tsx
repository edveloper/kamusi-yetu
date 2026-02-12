'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import { getPendingSuggestions } from '@/lib/api/suggestions'
import { getEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'
import { runModerationAction } from '@/lib/api/moderation'

type ModerationItem = {
  id: string
  item_type: 'entry' | 'suggestion'
  entry_id?: string
  headword?: string
  primary_definition?: string
  part_of_speech?: string
  dialect_variant?: string
  created_at?: string
  contributor?: { display_name?: string; avatar_url?: string } | null
  language?: { id?: string; name?: string } | null
}

type Language = { id: string; name: string }

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [languages, setLanguages] = useState<Language[]>([])
  const [selectedLanguage, setSelectedLanguage] = useState('all')

  const [items, setItems] = useState<ModerationItem[]>([])
  const [loadingData, setLoadingData] = useState(true)
  const [modStats, setModStats] = useState({ thisWeek: 0, score: 0 })
  const [reviewingId, setReviewingId] = useState<string | null>(null)
  const [actionNote, setActionNote] = useState('')
  const [processingMap, setProcessingMap] = useState<Record<string, boolean>>({})
  const [isUserModerator, setIsUserModerator] = useState(false)

  useEffect(() => {
    async function checkAccess() {
      if (loading || !user) return
      try {
        const modStatus = await isModerator(user.id)
        setIsUserModerator(modStatus)
        if (!modStatus) router.push('/profile')
      } catch (err) {
        console.error('Failed to check moderator status:', err)
        router.push('/profile')
      }
    }
    checkAccess()
  }, [user, loading, router])

  const normalizeSuggestionRows = (rows: unknown[]): ModerationItem[] => {
    return rows.map((row) => {
      const r = row as Record<string, unknown>
      const contributor = (r.contributor ?? null) as Record<string, unknown> | null
      const language = (r.language ?? null) as Record<string, unknown> | null
      return {
        id: String(r.id ?? ''),
        item_type: 'suggestion',
        entry_id: (r.entry_id as string | undefined) ?? undefined,
        headword: (r.headword as string | undefined) ?? undefined,
        primary_definition: (r.primary_definition as string | undefined) ?? undefined,
        created_at: (r.created_at as string | undefined) ?? undefined,
        contributor: contributor
          ? {
              display_name: (contributor.display_name as string | undefined) ?? undefined,
              avatar_url: (contributor.avatar_url as string | undefined) ?? undefined
            }
          : undefined,
        language: language
          ? { id: (language.id as string | undefined) ?? undefined, name: (language.name as string | undefined) ?? undefined }
          : undefined,
        part_of_speech: (r.part_of_speech as string | undefined) ?? undefined,
        dialect_variant: (r.dialect_variant as string | undefined) ?? undefined
      }
    })
  }

  const normalizeEntryRows = (rows: unknown[]): ModerationItem[] => {
    return rows.map((row) => {
      const r = row as Record<string, unknown>
      const contributor = (r.contributor ?? null) as Record<string, unknown> | null
      const language = (r.language ?? null) as Record<string, unknown> | null
      return {
        id: String(r.id ?? ''),
        item_type: 'entry',
        entry_id: String(r.id ?? ''),
        headword: (r.headword as string | undefined) ?? undefined,
        primary_definition: (r.primary_definition as string | undefined) ?? undefined,
        part_of_speech: (r.part_of_speech as string | undefined) ?? undefined,
        dialect_variant: (r.dialect_variant as string | undefined) ?? undefined,
        created_at: (r.created_at as string | undefined) ?? undefined,
        contributor: contributor
          ? {
              display_name: (contributor.display_name as string | undefined) ?? undefined,
              avatar_url: (contributor.avatar_url as string | undefined) ?? undefined
            }
          : undefined,
        language: language
          ? { id: (language.id as string | undefined) ?? undefined, name: (language.name as string | undefined) ?? undefined }
          : undefined
      }
    })
  }

  const refreshModeratorStats = async () => {
    if (!user) return
    try {
      const stats = await getModeratorStats(user.id)
      setModStats(stats || { thisWeek: 0, score: 0 })
    } catch (err) {
      console.warn('Failed to refresh moderator stats:', err)
    }
  }

  useEffect(() => {
    async function loadInitial() {
      if (!user || !isUserModerator) return
      setLoadingData(true)
      try {
        const [langs, pendingEntries, pendingSuggestions, stats] = await Promise.all([
          getLanguages(),
          getEntries({ validation_status: 'pending' }),
          getPendingSuggestions(100),
          getModeratorStats(user.id)
        ])

        setLanguages(langs || [])
        const combined = [
          ...normalizeEntryRows(pendingEntries || []),
          ...normalizeSuggestionRows(pendingSuggestions || [])
        ].sort((a, b) => {
          const aTime = a.created_at ? new Date(a.created_at).getTime() : 0
          const bTime = b.created_at ? new Date(b.created_at).getTime() : 0
          return bTime - aTime
        })
        setItems(combined)
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

  const displayedList = selectedLanguage === 'all'
    ? items
    : items.filter((i) => i.language?.id === selectedLanguage)

  const setProcessing = (id: string, value: boolean) => {
    setProcessingMap((prev) => ({ ...prev, [id]: value }))
  }

  const removeItemOptimistic = (id: string) => {
    setItems((prev) => prev.filter((i) => i.id !== id))
  }

  const rollbackAdd = (item: ModerationItem) => {
    setItems((prev) => [item, ...prev])
  }

  const handleReviewAction = async (item: ModerationItem, action: 'accept' | 'reject') => {
    if (!user) return
    const id = item.id
    if (!id) return

    if (action === 'reject') {
      const ok = confirm('Are you sure you want to reject this suggestion? This cannot be undone here.')
      if (!ok) return
    }

    setProcessing(id, true)
    removeItemOptimistic(id)

    try {
      if (item.item_type === 'entry') {
        await runModerationAction({
          action: action === 'accept' ? 'approve_entry' : 'reject_entry',
          itemId: id
        })
      } else {
        await runModerationAction({
          action: 'review_suggestion',
          itemId: id,
          suggestionAction: action,
          note: action === 'reject' ? actionNote || 'Rejected by moderator' : actionNote || 'Accepted by moderator'
        })
      }
      await refreshModeratorStats()
      setReviewingId(null)
      setActionNote('')
    } catch (err) {
      rollbackAdd(item)
      console.error('Review action failed:', err)
      alert('Failed to update suggestion. See console for details.')
    } finally {
      setProcessing(id, false)
    }
  }

  const handleApply = async (item: ModerationItem) => {
    if (!user) return
    const id = item.id
    if (!id) return

    const ok = confirm(
      item.item_type === 'entry'
        ? 'Approve this pending entry and publish it to the archive?'
        : 'Apply this suggestion to the entry? This will update the entry in the archive.'
    )
    if (!ok) return

    setProcessing(id, true)
    removeItemOptimistic(id)

    try {
      if (item.item_type === 'entry') {
        await runModerationAction({ action: 'approve_entry', itemId: id })
      } else {
        await runModerationAction({ action: 'apply_suggestion', itemId: id })
      }
      await refreshModeratorStats()
      setReviewingId(null)
      setActionNote('')
      alert(item.item_type === 'entry' ? 'Entry approved and published.' : 'Suggestion applied to entry.')
    } catch (err) {
      rollbackAdd(item)
      console.error('Apply suggestion failed:', err)
      alert('Failed to apply suggestion. See console for details.')
    } finally {
      setProcessing(id, false)
    }
  }

  const handleFlag = async (item: ModerationItem) => {
    if (!user) return
    const id = item.id
    if (!id) return
    setProcessing(id, true)
    try {
      if (item.item_type === 'entry') {
        await runModerationAction({ action: 'flag_entry', itemId: id })
      } else {
        await runModerationAction({
          action: 'review_suggestion',
          itemId: id,
          suggestionAction: 'reject',
          note: 'Flagged for discussion'
        })
      }
      setItems((prev) => prev.filter((i) => i.id !== id))
      await refreshModeratorStats()
    } catch (err) {
      console.error('Flag failed:', err)
      alert('Failed to flag suggestion.')
    } finally {
      setProcessing(id, false)
    }
  }

  const formatDate = (iso?: string | null) => {
    if (!iso) return 'Unknown date'
    const d = new Date(iso)
    if (isNaN(d.getTime())) return 'Unknown date'
    return d.toLocaleDateString()
  }

  if (loading) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center">
      <div className="animate-spin rounded-full h-12 w-12 border-4 border-emerald-200 border-t-emerald-600"></div>
    </div>
  )

  if (!isUserModerator) return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center p-4">
      <div className="bg-white p-12 rounded-[2.5rem] shadow-xl text-center max-w-md border border-stone-200">
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
              <p className="text-emerald-100/70 text-lg font-medium italic font-serif">Reviewing and validating the community&apos;s collective wisdom.</p>
            </div>

            <div className="flex flex-wrap gap-4 font-logo">
              <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50">
                <div className="text-[10px] font-black text-emerald-400 uppercase tracking-widest mb-1">Weekly Reviews</div>
                <div className="text-3xl font-black">{loadingData ? '...' : modStats.thisWeek}</div>
              </div>
              <div className="bg-emerald-800/50 backdrop-blur-md p-4 rounded-2xl border border-emerald-700/50">
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
                {languages.map((lang) => (
                  <option key={lang.id} value={lang.id}>{lang.name}</option>
                ))}
              </select>
            </div>

            <div className="flex items-center justify-between p-5 rounded-2xl font-black uppercase text-[11px] tracking-widest bg-emerald-600 text-white shadow-lg shadow-emerald-900/20">
              <span>Pending Review</span>
              <span className="px-2 py-1 rounded-lg text-[10px] bg-emerald-500">{items.length}</span>
            </div>
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
                          <span className="bg-emerald-50 text-emerald-700 px-3 py-1.5 rounded-full text-[10px] font-black uppercase tracking-widest">
                            {submission.item_type}
                          </span>
                          <span className="text-[10px] font-black text-stone-400 uppercase tracking-widest">
                            By {submission.contributor?.display_name || 'Anonymous'} | {formatDate(submission.created_at)}
                          </span>
                        </div>

                        <h3 className="text-3xl md:text-4xl font-black text-gray-900 mb-6 font-logo leading-tight uppercase tracking-tighter break-words">
                          {submission.headword || '(no headword)'}
                        </h3>

                        <div className="grid md:grid-cols-2 gap-8 mb-8">
                          <div>
                            <p className="text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3">Definition</p>
                            <p className="text-lg text-stone-700 leading-relaxed font-medium bg-stone-50 p-6 rounded-2xl border border-stone-100 italic font-serif break-words">
                              {submission.primary_definition || '-'}
                            </p>
                          </div>
                          <div className="space-y-4">
                            {submission.part_of_speech && (
                              <div>
                                <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Part of Speech</p>
                                <p className="font-bold text-gray-900 uppercase text-sm break-words">{submission.part_of_speech}</p>
                              </div>
                            )}
                            {submission.dialect_variant && (
                              <div>
                                <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Dialect Context</p>
                                <p className="font-bold text-gray-900 uppercase text-sm break-words">{submission.dialect_variant}</p>
                              </div>
                            )}
                          </div>
                        </div>

                        <div className="pt-8 border-t border-stone-100">
                          {reviewingId === submission.id ? (
                            <div className="space-y-6">
                              <textarea
                                value={actionNote}
                                onChange={(e) => setActionNote(e.target.value)}
                                placeholder="Internal moderator notes (optional)..."
                                className="w-full px-6 py-4 bg-stone-50 border-2 border-emerald-100 rounded-2xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-medium text-stone-600 italic font-serif"
                                rows={2}
                              />
                              <div className="flex flex-col sm:flex-row sm:flex-wrap gap-3 font-logo">
                                <button
                                  onClick={() => handleReviewAction(submission, 'accept')}
                                  disabled={isProcessing}
                                  className="w-full sm:flex-1 sm:min-w-[140px] bg-emerald-600 text-white px-6 py-4 rounded-xl hover:bg-emerald-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-emerald-900/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Approve entry"
                                >
                                  {isProcessing ? '...' : 'Approve Entry'}
                                </button>
                                <button
                                  onClick={() => handleReviewAction(submission, 'reject')}
                                  disabled={isProcessing}
                                  className="w-full sm:flex-1 sm:min-w-[140px] bg-red-600 text-white px-6 py-4 rounded-xl hover:bg-red-700 transition font-black flex items-center justify-center gap-2 shadow-lg shadow-red-900/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Discard suggestion"
                                >
                                  {isProcessing ? '...' : 'Discard'}
                                </button>
                                <button
                                  onClick={() => { setReviewingId(null); setActionNote('') }}
                                  className="w-full sm:w-auto px-6 py-4 text-stone-400 font-black hover:text-stone-600 transition tracking-widest text-[10px] uppercase"
                                >
                                  Cancel
                                </button>
                              </div>
                            </div>
                          ) : (
                            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                              <div className="flex flex-col sm:flex-row sm:items-center gap-3">
                                <button
                                  onClick={() => { setReviewingId(submission.id); setActionNote('') }}
                                  className="w-full sm:w-auto bg-stone-900 text-white px-8 py-3.5 rounded-xl hover:bg-stone-800 transition font-black text-[11px] tracking-widest uppercase font-logo"
                                  aria-label="Open review panel"
                                >
                                  Review Submission
                                </button>

                                <button
                                  onClick={() => handleApply(submission)}
                                  className="w-full sm:w-auto px-4 py-3 text-sm bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition font-black uppercase tracking-widest"
                                  aria-label="Apply suggestion to entry"
                                >
                                  Apply
                                </button>
                              </div>

                              <div className="flex items-center gap-3 self-start sm:self-auto">
                                <button
                                  onClick={() => handleFlag(submission)}
                                  className="p-3 text-stone-400 hover:text-red-500 transition-colors font-black text-xs uppercase tracking-widest"
                                  title="Flag for discussion"
                                  aria-label="Flag suggestion"
                                >
                                  Flag
                                </button>
                                {isProcessing && <div className="text-sm text-stone-400">Processing...</div>}
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
                    <h3 className="text-2xl font-black text-gray-900 mb-2 font-logo uppercase tracking-tighter">Clear Horizon</h3>
                    <p className="text-stone-500 font-medium font-serif italic">No pending submissions to review right now.</p>
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
