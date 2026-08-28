'use client'

import { useCallback, useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getPendingSuggestions } from '@/lib/api/suggestions'
import { getEntries } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { isModerator, getModeratorStats } from '@/lib/api/users'
import {
  runModerationAction,
  getBridgeHealth,
  type BridgeHealthResponse,
} from '@/lib/api/moderation'
import EntryActionModal from '@/components/EntryActionModal'
import RecordingsQueue from '@/components/moderate/RecordingsQueue'
import OrthographyQueue from '@/components/moderate/OrthographyQueue'
import Dropdown from '@/components/ui/Dropdown'

// Three separate jobs, not one list. Recordings and damaged spellings both
// existed in the database with nothing surfacing them, so a submitted recording
// sat at 'pending' forever and never reached an entry page.

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
type Queue = 'entries' | 'recordings' | 'spelling'

const isPhraseItem = (item: ModerationItem) =>
  String(item.part_of_speech || '').toLowerCase() === 'phrase'

/** What is still missing from an entry, so a reviewer can see it at a glance. */
function moderationGaps(item: ModerationItem) {
  const gaps: string[] = []
  const code = String(item.language?.code || '').toLowerCase()
  const english = !!String(item.english_translation || '').trim()
  const swahili = !!String(item.swahili_translation || '').trim()
  const hasExample = Array.isArray(item.usage_examples)
    ? item.usage_examples.some((example) => !!String(example?.context_text || '').trim())
    : false

  if (!String(item.primary_definition || '').trim()) gaps.push('No definition')
  if (!String(item.part_of_speech || '').trim()) gaps.push('No part of speech')
  if (!english && !swahili) gaps.push('No bridge translation')
  if (code === 'en' && !swahili) gaps.push('No Kiswahili')
  if (code === 'sw' && !english) gaps.push('No English')
  if (isPhraseItem(item) && !hasExample) gaps.push('No usage example')
  if (!String(item.audio_url || '').trim()) gaps.push('No audio')
  return gaps
}

const toItem = (row: Record<string, unknown>, kind: 'entry' | 'suggestion'): ModerationItem => {
  const contributor = (row.contributor ?? null) as Record<string, unknown> | null
  const language = (row.language ?? null) as Record<string, unknown> | null
  const str = (key: string) => (row[key] as string | undefined) ?? undefined
  return {
    id: String(row.id ?? ''),
    item_type: kind,
    entry_id: kind === 'entry' ? String(row.id ?? '') : str('entry_id'),
    headword: str('headword'),
    primary_definition: str('primary_definition'),
    part_of_speech: str('part_of_speech'),
    dialect_variant: str('dialect_variant'),
    pronunciation_ipa: str('pronunciation_ipa'),
    etymology: str('etymology'),
    audio_url: str('audio_url'),
    english_translation: str('english_translation'),
    swahili_translation: str('swahili_translation'),
    category: str('category'),
    register: str('register'),
    created_at: str('created_at'),
    usage_examples: Array.isArray(row.usage_examples)
      ? (row.usage_examples as Array<{ context_text?: string }>)
      : undefined,
    contributor: contributor
      ? { display_name: contributor.display_name as string | undefined }
      : null,
    language: language
      ? {
          id: language.id as string | undefined,
          name: language.name as string | undefined,
          code: language.code as string | undefined,
        }
      : null,
  }
}

export default function ModeratePage() {
  const { user, loading } = useAuth()
  const router = useRouter()

  const [queue, setQueue] = useState<Queue>('entries')
  const [isReviewer, setIsReviewer] = useState(false)
  const [checked, setChecked] = useState(false)

  const [languages, setLanguages] = useState<Language[]>([])
  const [items, setItems] = useState<ModerationItem[]>([])
  const [loadingData, setLoadingData] = useState(true)
  const [stats, setStats] = useState({ thisWeek: 0, score: 0 })
  const [health, setHealth] = useState<BridgeHealthResponse['summary'] | null>(null)

  const [languageFilter, setLanguageFilter] = useState('all')
  const [kindFilter, setKindFilter] = useState<'all' | 'word' | 'phrase' | 'suggestion'>('all')
  const [busy, setBusy] = useState<Record<string, boolean>>({})
  const [editing, setEditing] = useState<ModerationItem | null>(null)
  const [error, setError] = useState('')

  useEffect(() => {
    if (loading || !user) return
    isModerator(user.id)
      .then((ok) => {
        setIsReviewer(ok)
        setChecked(true)
      })
      .catch(() => setChecked(true))
  }, [user, loading])

  useEffect(() => {
    if (!loading && !user) router.push('/login?next=/moderate')
  }, [user, loading, router])

  const refreshStats = useCallback(async () => {
    if (!user) return
    try {
      const [next, bridge] = await Promise.all([getModeratorStats(user.id), getBridgeHealth()])
      setStats(next || { thisWeek: 0, score: 0 })
      setHealth(bridge?.summary ?? null)
    } catch {
      // Stats are informational; never let them break the queue.
    }
  }, [user])

  useEffect(() => {
    if (!user || !isReviewer) return
    let cancelled = false

    ;(async () => {
      setLoadingData(true)
      try {
        const [langs, entries, suggestions, next, bridge] = await Promise.all([
          getLanguages(),
          getEntries({ validation_status: 'pending' }),
          getPendingSuggestions(100),
          getModeratorStats(user.id),
          getBridgeHealth(),
        ])
        if (cancelled) return

        setLanguages((langs ?? []) as Language[])
        setItems(
          [
            ...((entries ?? []) as Array<Record<string, unknown>>).map((r) => toItem(r, 'entry')),
            ...((suggestions ?? []) as Array<Record<string, unknown>>).map((r) =>
              toItem(r, 'suggestion')
            ),
          ].sort((a, b) => {
            const at = a.created_at ? new Date(a.created_at).getTime() : 0
            const bt = b.created_at ? new Date(b.created_at).getTime() : 0
            return bt - at
          })
        )
        setStats(next || { thisWeek: 0, score: 0 })
        setHealth(bridge?.summary ?? null)
      } catch (err) {
        if (!cancelled) {
          setError(err instanceof Error ? err.message : 'Could not load the queue.')
        }
      } finally {
        if (!cancelled) setLoadingData(false)
      }
    })()

    return () => {
      cancelled = true
    }
  }, [user, isReviewer])

  const visible = useMemo(
    () =>
      items
        .filter((item) => languageFilter === 'all' || item.language?.id === languageFilter)
        .filter((item) => {
          if (kindFilter === 'all') return true
          if (kindFilter === 'suggestion') return item.item_type === 'suggestion'
          if (kindFilter === 'phrase') return isPhraseItem(item)
          return item.item_type === 'entry' && !isPhraseItem(item)
        }),
    [items, languageFilter, kindFilter]
  )

  const mark = (id: string, value: boolean) => setBusy((prev) => ({ ...prev, [id]: value }))
  const drop = (id: string) => setItems((prev) => prev.filter((item) => item.id !== id))

  const decide = async (item: ModerationItem, action: 'approve' | 'reject' | 'flag') => {
    let reason = ''
    if (action !== 'approve') {
      reason = (
        window.prompt(
          action === 'reject'
            ? 'Why is this being sent back? The contributor is shown your answer.'
            : 'What needs checking? The contributor is shown your answer.'
        ) || ''
      ).trim()
      if (!reason) return
    }

    mark(item.id, true)
    setError('')
    const snapshot = item

    try {
      drop(item.id)
      if (item.item_type === 'entry') {
        if (action === 'approve') await runModerationAction({ action: 'approve_entry', itemId: item.id })
        else if (action === 'reject')
          await runModerationAction({ action: 'reject_entry', itemId: item.id, note: reason })
        else await runModerationAction({ action: 'flag_entry', itemId: item.id, note: reason })
      } else {
        await runModerationAction({
          action: action === 'approve' ? 'apply_suggestion' : 'review_suggestion',
          itemId: item.id,
          ...(action === 'approve'
            ? { note: 'Applied by reviewer' }
            : { suggestionAction: 'reject' as const, note: reason }),
        } as Parameters<typeof runModerationAction>[0])
      }
      await refreshStats()
    } catch (err) {
      setItems((prev) => [snapshot, ...prev])
      setError(err instanceof Error ? err.message : 'That action failed.')
    } finally {
      mark(item.id, false)
    }
  }

  const completeAndApprove = async (data: Record<string, string>) => {
    if (!editing) return
    const item = editing
    mark(item.id, true)
    setError('')

    const updates = Object.fromEntries(
      Object.entries(data).filter(
        ([, value]) => typeof value === 'string' && value.trim() !== ''
      )
    ) as Record<string, string>

    try {
      await runModerationAction(
        item.item_type === 'entry'
          ? { action: 'approve_entry', itemId: item.id, updates }
          : { action: 'apply_suggestion', itemId: item.id, note: 'Completed by reviewer', updates }
      )
      drop(item.id)
      setEditing(null)
      await refreshStats()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not complete that entry.')
    } finally {
      mark(item.id, false)
    }
  }

  if (loading || !user || !checked) return null

  if (!isReviewer) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-paper px-4">
        <div className="max-w-md border-t-2 border-ink-900 pt-8 text-center">
          <h1 className="display mb-3 text-3xl text-ink-900">Not your queue</h1>
          <p className="mb-8 text-ink-700">
            Reviewing rights are granted one language at a time. If you speak a language here
            and want to review it, ask and say which.
          </p>
          <div className="flex flex-wrap justify-center gap-3">
            <Link href="/contact" className="btn-primary">Ask To Review</Link>
            <Link href="/moderators" className="btn-secondary">How Reviewing Works</Link>
          </div>
        </div>
      </div>
    )
  }

  const TABS: Array<[Queue, string, number | null]> = [
    ['entries', 'Entries', items.length],
    ['recordings', 'Recordings', null],
    ['spelling', 'Damaged Spellings', null],
  ]

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-5xl px-4 py-12 sm:px-6">
          <p className="mark label mb-4 text-signal-300">Review</p>
          <div className="flex flex-col justify-between gap-8 lg:flex-row lg:items-end">
            <div>
              <h1 className="display text-4xl sm:text-5xl">Review Queue</h1>
              <p className="definition mt-5 max-w-md text-ink-300">
                Nothing is published until someone with standing in that language says so.
              </p>
            </div>
            <dl className="flex gap-10">
              <div>
                <dd className="headword tabular text-4xl">{stats.thisWeek}</dd>
                <dt className="label mt-1 text-ink-400">Reviewed This Week</dt>
              </div>
              <div>
                <dd className="headword tabular text-4xl">{stats.score}</dd>
                <dt className="label mt-1 text-ink-400">Reviewer Score</dt>
              </div>
            </dl>
          </div>
        </div>
      </header>

      <nav aria-label="Queues" className="border-b border-ink-200">
        <div className="mx-auto flex max-w-5xl gap-1 overflow-x-auto px-4 sm:px-6">
          {TABS.map(([key, label, count]) => (
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
              {count !== null && count > 0 && (
                <span className="tabular ml-2 font-mono text-xs text-ink-500">{count}</span>
              )}
            </button>
          ))}
        </div>
      </nav>

      <main className="mx-auto max-w-5xl px-4 py-10 sm:px-6">
        {error && (
          <p
            role="alert"
            className="mb-8 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
          >
            {error}
          </p>
        )}

        {queue === 'recordings' && <RecordingsQueue />}
        {queue === 'spelling' && <OrthographyQueue />}

        {queue === 'entries' && (
          <>
            {health && (
              <dl className="mb-10 grid grid-cols-2 gap-x-8 gap-y-6 border-b border-ink-200 pb-8 sm:grid-cols-4">
                {[
                  ['Waiting', items.length],
                  ['Missing a bridge', health.missing_both],
                  ['Phrases without an example', health.phrase_missing_examples],
                  ['English without Kiswahili', health.english_without_swahili],
                ].map(([label, value]) => (
                  <div key={String(label)}>
                    <dd className="tabular font-mono text-2xl font-semibold text-ink-900">
                      {Number(value).toLocaleString()}
                    </dd>
                    <dt className="mt-1 text-sm text-ink-600">{label}</dt>
                  </div>
                ))}
              </dl>
            )}

            <div className="mb-8 flex flex-wrap items-center gap-3">
              <label htmlFor="mod-language" className="sr-only">Filter by language</label>
              <div className="w-56">
                <Dropdown
                  id="mod-language"
                  value={languageFilter}
                  onChange={setLanguageFilter}
                  options={[
                    { value: 'all', label: 'Every language' },
                    ...languages.map((language) => ({
                      value: language.id,
                      label: language.name,
                    })),
                  ]}
                  className="py-2 text-sm"
                  aria-label="Filter by language"
                  searchPlaceholder="Find a language"
                />
              </div>

              <div className="flex gap-1">
                {(['all', 'word', 'phrase', 'suggestion'] as const).map((kind) => (
                  <button
                    key={kind}
                    onClick={() => setKindFilter(kind)}
                    className={`border px-3 py-2 text-sm transition-colors ${
                      kindFilter === kind
                        ? 'border-ink-900 bg-ink-900 font-semibold text-paper'
                        : 'border-ink-200 text-ink-700 hover:border-ink-900'
                    }`}
                  >
                    {kind === 'all' ? 'Everything' : kind === 'word' ? 'Words' : kind === 'phrase' ? 'Phrases' : 'Corrections'}
                  </button>
                ))}
              </div>
            </div>

            {loadingData ? (
              <p className="text-ink-600">Loading the queue.</p>
            ) : visible.length === 0 ? (
              <div className="border-y-2 border-ink-900 py-12 text-center">
                <p className="display mb-2 text-2xl text-ink-900">Nothing waiting</p>
                <p className="text-ink-600">
                  {items.length === 0
                    ? 'The queue is empty.'
                    : 'Nothing matches those filters.'}
                </p>
              </div>
            ) : (
              <ul className="stagger border-t border-ink-200">
                {visible.map((item, index) => {
                  const gaps = moderationGaps(item)
                  return (
                    <li
                      key={item.id}
                      style={{ '--i': index } as React.CSSProperties}
                      className="border-b border-ink-200 py-6"
                    >
                      <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1">
                        <h2 className="text-xl font-semibold text-ink-900">
                          {item.headword || 'Untitled'}
                        </h2>
                        <span className="label text-ink-500">
                          {item.language?.name ?? 'Unknown language'}
                          {item.item_type === 'suggestion' ? ' · Correction' : ''}
                          {isPhraseItem(item) ? ' · Phrase' : ''}
                        </span>
                      </div>

                      {item.primary_definition && (
                        <p className="definition mt-2 text-ink-800">{item.primary_definition}</p>
                      )}

                      <p className="mt-2 text-sm text-ink-600">
                        {[item.english_translation, item.swahili_translation]
                          .filter(Boolean)
                          .join(' · ') || 'No bridge translation'}
                      </p>

                      {item.contributor?.display_name && (
                        <p className="label mt-2 text-ink-500">
                          From {item.contributor.display_name}
                        </p>
                      )}

                      {gaps.length > 0 && (
                        <ul className="mt-3 flex flex-wrap gap-1.5">
                          {gaps.map((gap) => (
                            <li
                              key={gap}
                              className="border border-sand-200 bg-sand-50 px-2 py-0.5 text-xs font-semibold text-sand-700"
                            >
                              {gap}
                            </li>
                          ))}
                        </ul>
                      )}

                      <div className="mt-5 flex flex-wrap gap-3">
                        <button
                          onClick={() => decide(item, 'approve')}
                          disabled={busy[item.id]}
                          className="btn-primary py-2 text-sm"
                        >
                          Publish
                        </button>
                        <button
                          onClick={() => setEditing(item)}
                          disabled={busy[item.id]}
                          className="border border-ink-300 px-4 py-2 text-sm font-semibold text-ink-700 transition-colors hover:border-ink-900"
                        >
                          Fix And Publish
                        </button>
                        <button
                          onClick={() => decide(item, 'reject')}
                          disabled={busy[item.id]}
                          className="border border-ink-300 px-4 py-2 text-sm font-semibold text-ink-600 transition-colors hover:border-signal-500 hover:text-signal-600"
                        >
                          Send Back
                        </button>
                        {item.item_type === 'entry' && (
                          <button
                            onClick={() => decide(item, 'flag')}
                            disabled={busy[item.id]}
                            className="px-2 py-2 text-sm font-semibold text-ink-500 underline underline-offset-4 hover:text-ink-900"
                          >
                            Needs A Second Look
                          </button>
                        )}
                        {item.entry_id && (
                          <Link
                            href={`/entry/${item.entry_id}`}
                            className="px-2 py-2 text-sm font-semibold text-ink-500 underline underline-offset-4 hover:text-ink-900"
                          >
                            Open Entry
                          </Link>
                        )}
                      </div>
                    </li>
                  )
                })}
              </ul>
            )}
          </>
        )}
      </main>

      {editing && (
        <EntryActionModal
          type="edit"
          entry={{ ...editing, currentUserId: user?.id }}
          onClose={() => setEditing(null)}
          onSubmit={completeAndApprove}
        />
      )}
    </div>
  )
}
