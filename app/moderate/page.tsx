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
import RecordingsQueue from '@/components/moderate/RecordingsQueue'
import OrthographyQueue from '@/components/moderate/OrthographyQueue'

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
  // Three separate jobs, not one list. Recordings and damaged spellings both
  // existed in the database with nothing surfacing them.
  const [queue, setQueue] = useState<'entries' | 'recordings' | 'spelling'>('entries')

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

    // A rejection now has to say why. The contributor sees this text, and an
    // unexplained rejection is the fastest way to lose a first-time contributor.
    let reason = actionNote.trim()
    if (action === 'reject') {
      if (!reason) {
        reason = (window.prompt(
          'Why is this being rejected? The contributor will be shown your answer. For example: not a word in this language, wrong meaning, or already recorded.'
        ) || '').trim()
      }
      if (!reason) return
    }

    setProcessing(id, true)
    removeItemOptimistic(id)

    try {
      if (item.item_type === 'entry') {
        if (action === 'accept') {
          await runModerationAction({ action: 'approve_entry', itemId: id })
        } else {
          await runModerationAction({ action: 'reject_entry', itemId: id, note: reason })
        }
      } else {
        await runModerationAction({
          action: 'review_suggestion',
          itemId: id,
          suggestionAction: action,
          note: action === 'reject' ? reason : actionNote || 'Accepted by moderator'
        })
      }
      await Promise.all([refreshModeratorStats(), refreshBridgeHealth()])
      setReviewingId(null)
      setActionNote('')
    } catch (err) {
      rollbackAdd(item)
      console.error('Review action failed:', err)
      alert(err instanceof Error ? err.message : 'Could not update that item.')
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
    <div className="min-h-screen bg-paper flex items-center justify-center">
      <div className="animate-spin rounded-full h-12 w-12 border-4 border-ink-200 border-t-sand-300"></div>
    </div>
  )

  if (!isUserModerator) return (
    <div className="flex min-h-screen items-center justify-center bg-paper px-4">
      <div className="max-w-md border-t-2 border-ink-900 pt-8 text-center">
        <h2 className="display mb-3 text-3xl text-ink-900">Not your queue</h2>
        <p className="mb-8 text-ink-700">
          Reviewing rights are granted per language. If you speak one of these languages and
          want to review it, ask and say which.
        </p>
        <div className="flex flex-wrap justify-center gap-3">
          <Link href="/contact" className="btn-primary">Ask to review</Link>
          <Link href="/moderators" className="btn-secondary">How reviewing works</Link>
        </div>
      </div>
    </div>
  )

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6">
          <p className="mark label mb-4 text-signal-300">Review</p>
          <div className="flex flex-col justify-between gap-8 lg:flex-row lg:items-end">
            <div>
              <h1 className="display text-4xl sm:text-5xl">Review Queue</h1>
              <p className="definition mt-5 max-w-lg text-ink-300">
                Nothing here is published until someone with standing in that language says so.
              </p>
            </div>
            <dl className="flex gap-10">
              <div>
                <dd className="headword tabular text-4xl">{loadingData ? '0' : modStats.thisWeek}</dd>
                <dt className="label mt-1 text-ink-400">Reviewed This Week</dt>
              </div>
              <div>
                <dd className="headword tabular text-4xl">{loadingData ? '0' : modStats.score}</dd>
                <dt className="label mt-1 text-ink-400">Reviewer Score</dt>
              </div>
            </dl>
          </div>
        </div>
      </header>

      <div className="border-b border-ink-200">
        <div className="mx-auto flex max-w-7xl gap-1 overflow-x-auto px-4 sm:px-6">
          {([
            ['entries', 'Entries And Suggestions'],
            ['recordings', 'Recordings'],
            ['spelling', 'Damaged Spellings'],
          ] as const).map(([key, label]) => (
            <button
              key={key}
              onClick={() => setQueue(key)}
              aria-current={queue === key ? 'page' : undefined}
              className={`shrink-0 border-b-2 px-4 py-3.5 text-[0.9375rem] font-semibold transition-colors ${
                queue === key
                  ? 'border-signal-500 text-ink-900'
                  : 'border-transparent text-ink-600 hover:text-ink-900'
              }`}
            >
              {label}
            </button>
          ))}
        </div>
      </div>

      {queue === 'recordings' && (
        <div className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
          <RecordingsQueue />
        </div>
      )}

      {queue === 'spelling' && (
        <div className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
          <OrthographyQueue />
        </div>
      )}

      {queue === 'entries' && (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10">
        <div className="grid lg:grid-cols-4 gap-8">
          <div className="lg:col-span-1 space-y-4">
            <div className="bg-paper p-6 rounded-3xl shadow-soft border border-ink-200">
              <label className="block text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-3 ml-1">Filter by Language</label>
              <select
                value={selectedLanguage}
                onChange={(e) => setSelectedLanguage(e.target.value)}
                className="w-full px-4 py-3 bg-card border-2 border-card rounded-xl focus:bg-white focus:border-ink-200 transition-all outline-none font-bold text-ink-900 appearance-none cursor-pointer"
              >
                <option value="all">All Dialects</option>
                {languages.map((lang) => (
                  <option key={lang.id} value={lang.id}>{lang.name}</option>
                ))}
              </select>
            </div>

            <div className="bg-paper p-6 rounded-3xl shadow-soft border border-ink-200">
              <label className="block text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-3 ml-1">Filter by Content Type</label>
              <select
                value={selectedContentType}
                onChange={(e) => setSelectedContentType(e.target.value as 'all' | 'word' | 'phrase' | 'entry' | 'suggestion')}
                className="w-full px-4 py-3 bg-card border-2 border-card rounded-xl focus:bg-white focus:border-ink-200 transition-all outline-none font-bold text-ink-900 appearance-none cursor-pointer"
              >
                <option value="all">All Items</option>
                <option value="phrase">Phrases</option>
                <option value="word">Words</option>
                <option value="entry">Entries Only</option>
                <option value="suggestion">Suggestions Only</option>
              </select>
            </div>

            <div className="flex items-center justify-between p-5 rounded-2xl font-semibold uppercase text-[11px] tracking-widest bg-ink-900 text-white shadow-soft">
              <span>Pending Review</span>
              <span className="px-2 py-1 rounded-lg text-[10px] bg-sand-50 text-ink-900">{filteredList.length}</span>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="flex items-center justify-between p-5 rounded-2xl font-semibold uppercase text-[11px] tracking-widest bg-sand-50 text-ink-900 shadow-soft">
                <span>Pending Phrases</span>
                <span className="px-2 py-1 rounded-lg text-[10px] bg-sand-200 text-signal-600">{pendingPhraseCount}</span>
              </div>
              <div className="flex items-center justify-between p-5 rounded-2xl font-semibold uppercase text-[11px] tracking-widest bg-amber-500 text-white shadow-soft">
                <span>Needs Completion</span>
                <span className="px-2 py-1 rounded-lg text-[10px] bg-amber-400">{incompleteCount}</span>
              </div>
            </div>

            <div className="bg-paper p-6 rounded-3xl shadow-soft border border-ink-200">
              <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-4">Bridge Health</p>
              {bridgeHealth ? (
                <div className="space-y-3 text-[11px]">
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">Total</span>
                    <span className="font-semibold text-ink-900">{bridgeHealth.total}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">With Bridge</span>
                    <span className="font-semibold text-signal-600">{bridgeHealth.with_bridge}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">Missing Both</span>
                    <span className="font-semibold text-signal-600">{bridgeHealth.missing_both}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">EN w/o SW</span>
                    <span className="font-semibold text-signal-600">{bridgeHealth.english_without_swahili}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">SW w/o EN</span>
                    <span className="font-semibold text-signal-600">{bridgeHealth.swahili_without_english}</span>
                  </div>
                  <div className="pt-3 border-t border-ink-200 flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">Phrases</span>
                    <span className="font-semibold text-ink-900">{bridgeHealth.phrase_total}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">Phrase Examples</span>
                    <span className="font-semibold text-signal-600">{bridgeHealth.phrase_with_examples}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-ink-600 font-bold uppercase tracking-wide">Phrases Missing Examples</span>
                    <span className="font-semibold text-amber-700">{bridgeHealth.phrase_missing_examples}</span>
                  </div>
                </div>
              ) : (
                <p className="text-xs text-ink-600">Bridge metrics unavailable.</p>
              )}
            </div>

            <div className="bg-paper p-6 rounded-3xl shadow-soft border border-ink-200">
              <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-4">Language Risk</p>
              {bridgeByLanguage.length > 0 ? (
                <div className="space-y-3 max-h-64 overflow-y-auto pr-1">
                  {bridgeByLanguage.map((lang) => {
                    const risk = lang.missing_both + lang.english_without_swahili + lang.swahili_without_english
                    const gapPct = lang.total > 0 ? Math.round((risk / lang.total) * 100) : 0
                    return (
                      <div key={lang.language_id} className="rounded-xl border border-ink-200 bg-paper-warm p-3">
                        <div className="flex items-center justify-between gap-2">
                          <p className="text-xs font-semibold text-ink-900 truncate">{lang.language_name}</p>
                          <span className={`text-[10px] font-semibold px-2 py-1 rounded-md ${
                            risk > 0 ? 'bg-signal-200 text-signal-700' : 'bg-sand-50 text-signal-600'
                          }`}>
                            Issues {risk}
                          </span>
                        </div>
                        <div className="mt-2 text-[10px] text-ink-600 font-bold uppercase tracking-wide flex items-center justify-between">
                          <span>Total {lang.total}</span>
                          <span>Gap {gapPct}%</span>
                        </div>
                        {lang.phrase_total > 0 && (
                          <div className="mt-2 text-[10px] text-ink-600 font-bold uppercase tracking-wide flex items-center justify-between">
                            <span>Phrases {lang.phrase_total}</span>
                            <span>Missing examples {lang.phrase_missing_examples}</span>
                          </div>
                        )}
                      </div>
                    )
                  })}
                </div>
              ) : (
                <p className="text-xs text-ink-600">No language metrics yet.</p>
              )}
            </div>
          </div>

          <div className="lg:col-span-3 pb-20">
            {loadingData ? (
              <div className="bg-white p-20 border border-ink-200 text-center">
                <div className="animate-spin rounded-full h-10 w-10 border-4 border-ink-200 border-t-ink-900 mx-auto"></div>
              </div>
            ) : (
              <div className="space-y-6">
                {filteredList.some((item) => isPhraseItem(item) && getModerationGaps(item).includes('usage example')) && (
                  <div className="bg-paper-warm border border-ink-200 p-6 shadow-soft">
                    <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                      <div>
                        <p className="text-[10px] font-semibold text-signal-600 uppercase tracking-[0.12em] mb-2">Phrase Review Priority</p>
                        <h3 className="text-2xl font-semibold text-ink-900 font-display">Phrases Missing Usage Examples</h3>
                        <p className="text-sm text-ink-600 mt-2 max-w-2xl">
                          These phrase submissions need context before they should be treated as strong translation material.
                        </p>
                      </div>
                      <button
                        onClick={() => setSelectedContentType('phrase')}
                        className="px-5 py-3 rounded-xl bg-ink-900 text-white font-semibold text-xs uppercase tracking-widest hover:bg-ink-950"
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
                    <div key={submission.id} className={`bg-card border-2 transition-all overflow-hidden ${reviewingId === submission.id ? 'border-ink-900 shadow-2xl scale-[1.01]' : 'border-card shadow-sm hover:shadow-md'}`}>
                      <div className="p-8 md:p-10">
                        <div className="flex flex-wrap items-center gap-4 mb-6">
                          <span className="bg-paper-warm text-signal-600 px-4 py-1.5 rounded-full text-[10px] font-semibold uppercase tracking-widest">
                            {submission.language?.name || 'Unknown'}
                          </span>
                          <span className="bg-sand-50 text-signal-600 px-3 py-1.5 rounded-full text-[10px] font-semibold uppercase tracking-widest">
                            {submission.item_type}
                          </span>
                          {isPhrase && (
                            <span className="bg-ink-900 text-white px-3 py-1.5 rounded-full text-[10px] font-semibold uppercase tracking-widest">
                              phrase
                            </span>
                          )}
                          <span className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest">
                            By {submission.contributor?.display_name || 'Anonymous'} | {formatDate(submission.created_at)}
                          </span>
                        </div>

                        <h3 className="text-3xl md:text-4xl font-semibold text-ink-900 mb-6 font-display leading-tight uppercase tracking-tighter break-words">
                          {submission.headword || '(no headword)'}
                        </h3>

                        <div className="grid md:grid-cols-2 gap-8 mb-8">
                          <div>
                            <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-[0.12em] mb-3">Definition</p>
                            <p className="text-lg text-ink-700 leading-relaxed font-medium bg-card p-6 rounded-2xl border border-ink-200 italic font-serif break-words">
                              {submission.primary_definition || '-'}
                            </p>
                          </div>
                          <div className="space-y-4">
                            {submission.part_of_speech && (
                              <div>
                                <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-1">Part of Speech</p>
                                <p className="font-bold text-ink-900 uppercase text-sm break-words">{submission.part_of_speech}</p>
                              </div>
                            )}
                            {submission.dialect_variant && (
                              <div>
                                <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-1">Dialect Context</p>
                                <p className="font-bold text-ink-900 uppercase text-sm break-words">{submission.dialect_variant}</p>
                              </div>
                            )}
                            {(submission.english_translation || submission.swahili_translation) && (
                              <div className="grid grid-cols-1 gap-3">
                                {submission.english_translation && (
                                  <div>
                                    <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-1">English Bridge</p>
                                    <p className="font-bold text-ink-900 text-sm break-words">{submission.english_translation}</p>
                                  </div>
                                )}
                                {submission.swahili_translation && (
                                  <div>
                                    <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-widest mb-1">Swahili Bridge</p>
                                    <p className="font-bold text-ink-900 text-sm break-words">{submission.swahili_translation}</p>
                                  </div>
                                )}
                              </div>
                            )}
                          </div>
                        </div>

                        <div className="mb-8 rounded-2xl border border-ink-200 bg-paper-warm p-5">
                          <div className="flex flex-wrap items-center gap-3 justify-between">
                            <p className="text-[10px] font-semibold text-ink-600 uppercase tracking-[0.12em]">Review Summary</p>
                            {gaps.length > 0 ? (
                              <span className="text-[10px] font-semibold px-3 py-1 rounded-full bg-amber-100 text-amber-800 uppercase tracking-widest">
                                needs completion
                              </span>
                            ) : (
                              <span className="text-[10px] font-semibold px-3 py-1 rounded-full bg-sand-50 text-signal-600 uppercase tracking-widest">
                                ready to approve
                              </span>
                            )}
                          </div>
                          {gaps.length > 0 ? (
                            <div className="mt-3 flex flex-wrap gap-2">
                              {gaps.map((gap) => (
                                <span key={gap} className="text-[10px] font-semibold px-3 py-1 rounded-full bg-white border border-amber-200 text-amber-900 uppercase tracking-widest">
                                  Missing {gap}
                                </span>
                              ))}
                            </div>
                          ) : (
                            <p className="mt-3 text-sm text-ink-700 font-medium">
                              Bridge fields and core metadata are present. Moderator can approve directly or refine further.
                            </p>
                          )}
                        </div>

                        <div className="pt-8 border-t border-ink-200">
                          {reviewingId === submission.id ? (
                            <div className="space-y-6">
                              <textarea
                                value={actionNote}
                                onChange={(e) => setActionNote(e.target.value)}
                                placeholder="Internal moderator notes (optional)..."
                                className="w-full px-6 py-4 bg-card border-2 border-ink-200 rounded-2xl focus:bg-white focus:border-ink-200 transition-all outline-none font-medium text-ink-900 italic font-serif"
                                rows={2}
                              />
                              <div className="flex flex-col sm:flex-row sm:flex-wrap gap-3">
                                <button
                                  onClick={() => handleReviewAction(submission, 'accept')}
                                  disabled={isProcessing}
                                  className="w-full sm:flex-1 sm:min-w-[140px] bg-ink-900 text-white px-6 py-4 rounded-xl hover:bg-ink-950 transition font-semibold flex items-center justify-center gap-2 shadow-lg shadow-ink-900/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Approve entry"
                                >
                                  {isProcessing ? '...' : `Approve ${isPhrase ? 'Phrase' : 'Entry'}`}
                                </button>
                                <button
                                  onClick={() => handleReviewAction(submission, 'reject')}
                                  disabled={isProcessing}
                                  className="w-full sm:flex-1 sm:min-w-[140px] bg-signal-500 text-white px-6 py-4 rounded-xl hover:bg-signal-700 transition font-semibold flex items-center justify-center gap-2 shadow-lg shadow-signal-800/10 disabled:opacity-50 uppercase text-[10px] tracking-widest"
                                  aria-label="Discard suggestion"
                                >
                                  {isProcessing ? '...' : 'Discard'}
                                </button>
                                <button
                                  onClick={() => { setReviewingId(null); setActionNote('') }}
                                  className="w-full sm:w-auto px-6 py-4 text-ink-600 font-semibold hover:text-ink-900 transition tracking-widest text-[10px] uppercase"
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
                                  className="w-full sm:w-auto bg-ink-900 text-white px-8 py-3.5 rounded-xl hover:bg-ink-950 transition font-semibold text-[11px] tracking-widest uppercase"
                                  aria-label="Open review panel"
                                >
                                  Review Submission
                                </button>

                                <button
                                  onClick={() => setEditingItem({ ...submission, currentUserId: user?.id } as ModerationItem)}
                                  className="w-full sm:w-auto px-4 py-3 text-sm bg-sand-300 text-ink-900 rounded-xl hover:bg-sand-400 transition font-semibold uppercase tracking-widest"
                                >
                                  {gaps.length > 0 ? `Complete ${isPhrase ? 'Phrase' : 'Entry'} + Approve` : `Refine ${isPhrase ? 'Phrase' : 'Entry'}`}
                                </button>

                                <button
                                  onClick={() => handleApply(submission)}
                                  className="w-full sm:w-auto px-4 py-3 text-sm bg-ink-900 text-white rounded-xl hover:bg-ink-950 transition font-semibold uppercase tracking-widest"
                                  aria-label="Apply suggestion to entry"
                                >
                                  Apply
                                </button>
                              </div>

                              <div className="flex items-center gap-3 self-start sm:self-auto">
                                <button
                                  onClick={() => handleFlag(submission)}
                                  className="p-3 text-ink-600 hover:text-signal-500 transition-colors font-semibold text-xs uppercase tracking-widest"
                                  title="Flag for discussion"
                                  aria-label="Flag suggestion"
                                >
                                  Flag
                                </button>
                                {isProcessing && <div className="text-sm text-ink-600">Processing...</div>}
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                    </div>
                  )
                })}

                {filteredList.length === 0 && (
                  <div className="bg-paper p-24 border border-ink-200 text-center shadow-soft">
                    <h3 className="text-2xl font-semibold text-ink-900 mb-2 font-display uppercase tracking-tighter">Clear Horizon</h3>
                    <p className="text-ink-600 font-medium font-serif italic">No pending submissions to review right now.</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
      )}

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
