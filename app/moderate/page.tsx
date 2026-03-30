'use client'

import { useAuth } from '@/lib/contexts/AuthContext'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import { getPendingSuggestions } from '@/lib/api/suggestions'
import { getEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'
import { runModerationAction, getBridgeHealth, type BridgeHealthResponse } from '@/lib/api/moderation'
import EntryActionModal from '@/components/EntryActionModal'

type ModerationItem = {
  id: string
  item_type: 'entry' | 'suggestion'
  entry_id?: string
  headword?: string
  primary_definition?: string
  part_of_speech?: string
  dialect_variant?: string
  pronunciation_ipa?: string
  etymology?: string
  audio_url?: string
  english_translation?: string
  swahili_translation?: string
  category?: string
  register?: string
  usage_examples?: Array<{ context_text?: string }>
  created_at?: string
  contributor?: { display_name?: string; avatar_url?: string } | null
  language?: { id?: string; name?: string; code?: string } | null
}

type Language = { id: string; name: string }

function isPhraseItem(item: ModerationItem) {
  return String(item.part_of_speech || '').toLowerCase() === 'phrase'
}

function getModerationGaps(item: ModerationItem) {
  const gaps: string[] = []
  const languageCode = String(item.language?.code || '').toLowerCase()
  const hasEnglish = !!String(item.english_translation || '').trim()
  const hasSwahili = !!String(item.swahili_translation || '').trim()
  const hasUsageExample = Array.isArray(item.usage_examples)
    ? item.usage_examples.some((example) => !!String(example?.context_text || '').trim())
    : false

  if (!String(item.primary_definition || '').trim()) gaps.push('definition')
  if (!String(item.part_of_speech || '').trim()) gaps.push('part of speech')
  if (!hasEnglish && !hasSwahili) gaps.push('bridge translation')
  if (languageCode === 'en' && !hasSwahili) gaps.push('Swahili bridge')
  if (languageCode === 'sw' && !hasEnglish) gaps.push('English bridge')
  if (isPhraseItem(item) && !hasUsageExample) gaps.push('usage example')
  if (!String(item.audio_url || '').trim()) gaps.push('audio')

  return gaps
}

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()
  const [languages, setLanguages] = useState<Language[]>([])
  const [selectedLanguage, setSelectedLanguage] = useState('all')
  const [selectedContentType, setSelectedContentType] = useState<'all' | 'word' | 'phrase' | 'entry' | 'suggestion'>('all')

  const [items, setItems] = useState<ModerationItem[]>([])
  const [loadingData, setLoadingData] = useState(true)
  const [modStats, setModStats] = useState({ thisWeek: 0, score: 0 })
  const [bridgeHealth, setBridgeHealth] = useState<BridgeHealthResponse['summary'] | null>(null)
  const [bridgeByLanguage, setBridgeByLanguage] = useState<BridgeHealthResponse['by_language']>([])
  const [reviewingId, setReviewingId] = useState<string | null>(null)
  const [actionNote, setActionNote] = useState('')
  const [processingMap, setProcessingMap] = useState<Record<string, boolean>>({})
  const [isUserModerator, setIsUserModerator] = useState(false)
  const [editingItem, setEditingItem] = useState<ModerationItem | null>(null)

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
          ? {
              id: (language.id as string | undefined) ?? undefined,
              name: (language.name as string | undefined) ?? undefined,
              code: (language.code as string | undefined) ?? undefined
            }
          : undefined,
        part_of_speech: (r.part_of_speech as string | undefined) ?? undefined,
        dialect_variant: (r.dialect_variant as string | undefined) ?? undefined,
        pronunciation_ipa: (r.pronunciation_ipa as string | undefined) ?? undefined,
        etymology: (r.etymology as string | undefined) ?? undefined,
        audio_url: (r.audio_url as string | undefined) ?? undefined,
        english_translation: (r.english_translation as string | undefined) ?? undefined,
        swahili_translation: (r.swahili_translation as string | undefined) ?? undefined,
        category: (r.category as string | undefined) ?? undefined,
        register: (r.register as string | undefined) ?? undefined
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
          ? {
              id: (language.id as string | undefined) ?? undefined,
              name: (language.name as string | undefined) ?? undefined,
              code: (language.code as string | undefined) ?? undefined
            }
          : undefined
        ,
        pronunciation_ipa: (r.pronunciation_ipa as string | undefined) ?? undefined,
        etymology: (r.etymology as string | undefined) ?? undefined,
        audio_url: (r.audio_url as string | undefined) ?? undefined,
        english_translation: (r.english_translation as string | undefined) ?? undefined,
        swahili_translation: (r.swahili_translation as string | undefined) ?? undefined,
        category: (r.category as string | undefined) ?? undefined,
        register: (r.register as string | undefined) ?? undefined,
        usage_examples: Array.isArray(r.usage_examples) ? (r.usage_examples as Array<{ context_text?: string }>) : undefined
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

  const refreshBridgeHealth = async () => {
    try {
      const health = await getBridgeHealth()
      setBridgeHealth(health?.summary || null)
      setBridgeByLanguage(health?.by_language || [])
    } catch (err) {
      console.warn('Failed to refresh bridge health:', err)
    }
  }

  useEffect(() => {
    async function loadInitial() {
      if (!user || !isUserModerator) return
      setLoadingData(true)
      try {
        const [langs, pendingEntries, pendingSuggestions, stats, health] = await Promise.all([
          getLanguages(),
          getEntries({ validation_status: 'pending' }),
          getPendingSuggestions(100),
          getModeratorStats(user.id),
          getBridgeHealth()
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
        setBridgeHealth(health?.summary || null)
        setBridgeByLanguage(health?.by_language || [])
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

  const filteredList = displayedList.filter((item) => {
    if (selectedContentType === 'all') return true
    if (selectedContentType === 'entry') return item.item_type === 'entry'
    if (selectedContentType === 'suggestion') return item.item_type === 'suggestion'
    if (selectedContentType === 'phrase') return isPhraseItem(item)
    if (selectedContentType === 'word') return !isPhraseItem(item)
    return true
  })

  const pendingPhraseCount = items.filter((item) => isPhraseItem(item)).length
  const incompleteCount = items.filter((item) => getModerationGaps(item).length > 0).length

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
      await Promise.all([refreshModeratorStats(), refreshBridgeHealth()])
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
      await Promise.all([refreshModeratorStats(), refreshBridgeHealth()])
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
      await Promise.all([refreshModeratorStats(), refreshBridgeHealth()])
    } catch (err) {
      console.error('Flag failed:', err)
      alert('Failed to flag suggestion.')
    } finally {
      setProcessing(id, false)
    }
  }

  const handleCompleteAndApprove = async (data: any) => {
    if (!editingItem) return
    const id = editingItem.id
    setProcessing(id, true)

    const updates = Object.fromEntries(
      Object.entries({
        headword: data.headword,
        primary_definition: data.primary_definition,
        english_translation: data.english_translation,
        swahili_translation: data.swahili_translation,
        part_of_speech: data.part_of_speech,
        dialect_variant: data.dialect_variant,
        pronunciation_ipa: data.pronunciation_ipa,
        etymology: data.etymology,
        audio_url: data.audio_url,
        category: data.category,
        register: data.register,
        usage_example: data.usage_example
      }).filter(([, value]) => typeof value === 'string' && value.trim() !== '')
    ) as Record<string, string>

    try {
      if (editingItem.item_type === 'entry') {
        await runModerationAction({
          action: 'approve_entry',
          itemId: id,
          updates
        })
      } else {
        await runModerationAction({
          action: 'apply_suggestion',
          itemId: id,
          note: data.details || data.reason || 'Completed by moderator',
          updates
        })
      }
      setItems((prev) => prev.filter((i) => i.id !== id))
      setEditingItem(null)
      setReviewingId(null)
      setActionNote('')
      await Promise.all([refreshModeratorStats(), refreshBridgeHealth()])
    } catch (err) {
      console.error('Complete and approve failed:', err)
      alert(err instanceof Error ? err.message : 'Failed to complete approval.')
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

            <div className="bg-white p-6 rounded-3xl shadow-xl border border-stone-200">
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-widest mb-3 ml-1">Filter by Content Type</label>
              <select
                value={selectedContentType}
                onChange={(e) => setSelectedContentType(e.target.value as 'all' | 'word' | 'phrase' | 'entry' | 'suggestion')}
                className="w-full px-4 py-3 bg-stone-50 border-2 border-stone-50 rounded-xl focus:bg-white focus:border-emerald-500 transition-all outline-none font-bold text-gray-900 appearance-none cursor-pointer"
              >
                <option value="all">All Items</option>
                <option value="phrase">Phrases</option>
                <option value="word">Words</option>
                <option value="entry">Entries Only</option>
                <option value="suggestion">Suggestions Only</option>
              </select>
            </div>

            <div className="flex items-center justify-between p-5 rounded-2xl font-black uppercase text-[11px] tracking-widest bg-emerald-600 text-white shadow-lg shadow-emerald-900/20">
              <span>Pending Review</span>
              <span className="px-2 py-1 rounded-lg text-[10px] bg-emerald-500">{filteredList.length}</span>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="flex items-center justify-between p-5 rounded-2xl font-black uppercase text-[11px] tracking-widest bg-stone-900 text-white shadow-lg shadow-stone-900/10">
                <span>Pending Phrases</span>
                <span className="px-2 py-1 rounded-lg text-[10px] bg-stone-700">{pendingPhraseCount}</span>
              </div>
              <div className="flex items-center justify-between p-5 rounded-2xl font-black uppercase text-[11px] tracking-widest bg-amber-500 text-white shadow-lg shadow-amber-900/10">
                <span>Needs Completion</span>
                <span className="px-2 py-1 rounded-lg text-[10px] bg-amber-400">{incompleteCount}</span>
              </div>
            </div>

            <div className="bg-white p-6 rounded-3xl shadow-xl border border-stone-200">
              <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-4">Bridge Health</p>
              {bridgeHealth ? (
                <div className="space-y-3 text-[11px]">
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">Total</span>
                    <span className="font-black text-stone-900">{bridgeHealth.total}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">With Bridge</span>
                    <span className="font-black text-emerald-700">{bridgeHealth.with_bridge}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">Missing Both</span>
                    <span className="font-black text-red-600">{bridgeHealth.missing_both}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">EN w/o SW</span>
                    <span className="font-black text-amber-700">{bridgeHealth.english_without_swahili}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">SW w/o EN</span>
                    <span className="font-black text-amber-700">{bridgeHealth.swahili_without_english}</span>
                  </div>
                  <div className="pt-3 border-t border-stone-100 flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">Phrases</span>
                    <span className="font-black text-stone-900">{bridgeHealth.phrase_total}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">Phrase Examples</span>
                    <span className="font-black text-emerald-700">{bridgeHealth.phrase_with_examples}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-stone-500 font-bold uppercase tracking-wide">Phrases Missing Examples</span>
                    <span className="font-black text-amber-700">{bridgeHealth.phrase_missing_examples}</span>
                  </div>
                </div>
              ) : (
                <p className="text-xs text-stone-400">Bridge metrics unavailable.</p>
              )}
            </div>

            <div className="bg-white p-6 rounded-3xl shadow-xl border border-stone-200">
              <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-4">Language Risk</p>
              {bridgeByLanguage.length > 0 ? (
                <div className="space-y-3 max-h-64 overflow-y-auto pr-1">
                  {bridgeByLanguage.map((lang) => {
                    const risk = lang.missing_both + lang.english_without_swahili + lang.swahili_without_english
                    const gapPct = lang.total > 0 ? Math.round((risk / lang.total) * 100) : 0
                    return (
                      <div key={lang.language_id} className="rounded-xl border border-stone-100 bg-stone-50 p-3">
                        <div className="flex items-center justify-between gap-2">
                          <p className="text-xs font-black text-stone-800 truncate">{lang.language_name}</p>
                          <span className={`text-[10px] font-black px-2 py-1 rounded-md ${
                            risk > 0 ? 'bg-red-100 text-red-700' : 'bg-emerald-100 text-emerald-700'
                          }`}>
                            Issues {risk}
                          </span>
                        </div>
                        <div className="mt-2 text-[10px] text-stone-500 font-bold uppercase tracking-wide flex items-center justify-between">
                          <span>Total {lang.total}</span>
                          <span>Gap {gapPct}%</span>
                        </div>
                        {lang.phrase_total > 0 && (
                          <div className="mt-2 text-[10px] text-stone-500 font-bold uppercase tracking-wide flex items-center justify-between">
                            <span>Phrases {lang.phrase_total}</span>
                            <span>Missing examples {lang.phrase_missing_examples}</span>
                          </div>
                        )}
                      </div>
                    )
                  })}
                </div>
              ) : (
                <p className="text-xs text-stone-400">No language metrics yet.</p>
              )}
            </div>
          </div>

          <div className="lg:col-span-3 pb-20">
            {loadingData ? (
              <div className="bg-white p-20 rounded-[2.5rem] border border-stone-200 text-center">
                <div className="animate-spin rounded-full h-10 w-10 border-4 border-stone-100 border-t-emerald-600 mx-auto"></div>
              </div>
            ) : (
              <div className="space-y-6">
                {filteredList.some((item) => isPhraseItem(item) && getModerationGaps(item).includes('usage example')) && (
                  <div className="bg-amber-50 border border-amber-200 rounded-[2rem] p-6 shadow-sm">
                    <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                      <div>
                        <p className="text-[10px] font-black text-amber-700 uppercase tracking-[0.2em] mb-2">Phrase Review Priority</p>
                        <h3 className="text-2xl font-black text-stone-900 font-logo">Phrases Missing Usage Examples</h3>
                        <p className="text-sm text-stone-600 mt-2 max-w-2xl">
                          These phrase submissions need context before they should be treated as strong translation material.
                        </p>
                      </div>
                      <button
                        onClick={() => setSelectedContentType('phrase')}
                        className="px-5 py-3 rounded-xl bg-amber-500 text-white font-black text-xs uppercase tracking-widest hover:bg-amber-600"
                      >
                        Focus Phrase Queue
                      </button>
                    </div>
                  </div>
                )}

                {filteredList.map((submission) => {
                  const isProcessing = !!processingMap[submission.id]
                  const isPhrase = isPhraseItem(submission)
                  const gaps = getModerationGaps(submission)
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
                          {isPhrase && (
                            <span className="bg-stone-900 text-white px-3 py-1.5 rounded-full text-[10px] font-black uppercase tracking-widest">
                              phrase
                            </span>
                          )}
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
                            {(submission.english_translation || submission.swahili_translation) && (
                              <div className="grid grid-cols-1 gap-3">
                                {submission.english_translation && (
                                  <div>
                                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">English Bridge</p>
                                    <p className="font-bold text-gray-900 text-sm break-words">{submission.english_translation}</p>
                                  </div>
                                )}
                                {submission.swahili_translation && (
                                  <div>
                                    <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest mb-1">Swahili Bridge</p>
                                    <p className="font-bold text-gray-900 text-sm break-words">{submission.swahili_translation}</p>
                                  </div>
                                )}
                              </div>
                            )}
                          </div>
                        </div>

                        <div className="mb-8 rounded-2xl border border-stone-200 bg-stone-50 p-5">
                          <div className="flex flex-wrap items-center gap-3 justify-between">
                            <p className="text-[10px] font-black text-stone-400 uppercase tracking-[0.2em]">Review Summary</p>
                            {gaps.length > 0 ? (
                              <span className="text-[10px] font-black px-3 py-1 rounded-full bg-amber-100 text-amber-800 uppercase tracking-widest">
                                needs completion
                              </span>
                            ) : (
                              <span className="text-[10px] font-black px-3 py-1 rounded-full bg-emerald-100 text-emerald-800 uppercase tracking-widest">
                                ready to approve
                              </span>
                            )}
                          </div>
                          {gaps.length > 0 ? (
                            <div className="mt-3 flex flex-wrap gap-2">
                              {gaps.map((gap) => (
                                <span key={gap} className="text-[10px] font-black px-3 py-1 rounded-full bg-white border border-amber-200 text-amber-900 uppercase tracking-widest">
                                  Missing {gap}
                                </span>
                              ))}
                            </div>
                          ) : (
                            <p className="mt-3 text-sm text-stone-600 font-medium">
                              Bridge fields and core metadata are present. Moderator can approve directly or refine further.
                            </p>
                          )}
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
                                  {isProcessing ? '...' : `Approve ${isPhrase ? 'Phrase' : 'Entry'}`}
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
                                  onClick={() => setEditingItem({ ...submission, currentUserId: user?.id } as ModerationItem)}
                                  className="w-full sm:w-auto px-4 py-3 text-sm bg-emerald-600 text-white rounded-xl hover:bg-emerald-700 transition font-black uppercase tracking-widest"
                                >
                                  {gaps.length > 0 ? `Complete ${isPhrase ? 'Phrase' : 'Entry'} + Approve` : `Refine ${isPhrase ? 'Phrase' : 'Entry'}`}
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

                {filteredList.length === 0 && (
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

      {editingItem && (
        <EntryActionModal
          type="edit"
          entry={{ ...editingItem, currentUserId: user?.id }}
          onClose={() => setEditingItem(null)}
          onSubmit={handleCompleteAndApprove}
        />
      )}
    </div>
  )
}
