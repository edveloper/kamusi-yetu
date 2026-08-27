'use client'

import { useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getUserProfile, getUserStats, isModerator, updateUserProfile } from '@/lib/api/users'
import {
  getRecentEntriesByUser,
  getContributorNotices,
  markNoticesRead,
  getSavedWordsCursor,
  removeSavedWord,
  type ContributorNotice,
} from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { getConceptGaps, getCoverageForLanguage } from '@/lib/api/concepts'
import ConsentSettings from '@/components/recording/ConsentSettings'

// Who lands here: a returning contributor. The job is to show that what they
// added mattered, tell them anything a reviewer said, and hand them the next
// thing to do.
//
// It was an account page. Saved words, a bio, an avatar uploader, a language
// picker. None of that answers "did my work go anywhere", which is the only
// question someone comes back with.

type Language = { id: string; name: string; code?: string | null }
type Contribution = {
  id: string
  headword: string
  validation_status: string
  created_at: string
  language_id: string
}

const STATUS_LABEL: Record<string, string> = {
  verified: 'Published',
  pending: 'Waiting for review',
  disputed: 'Sent back',
  flagged: 'Needs a second look',
  seeded: 'Held back',
}

const STATUS_TONE: Record<string, string> = {
  verified: 'border-petrol-200 bg-petrol-50 text-petrol-600',
  pending: 'border-ink-200 bg-paper-warm text-ink-600',
  disputed: 'border-signal-200 bg-signal-50 text-signal-700',
  flagged: 'border-sand-200 bg-sand-50 text-sand-700',
  seeded: 'border-ink-200 bg-paper-warm text-ink-600',
}

export default function ProfilePage() {
  const { user, loading, signOut } = useAuth()
  const router = useRouter()

  const [name, setName] = useState('')
  const [savingName, setSavingName] = useState(false)
  const [stats, setStats] = useState({ wordsAdded: 0, validated: 0, reputation: 0 })
  const [contributions, setContributions] = useState<Contribution[]>([])
  const [notices, setNotices] = useState<ContributorNotice[]>([])
  const [languages, setLanguages] = useState<Language[]>([])
  const [primaryLanguage, setPrimaryLanguage] = useState<Language | null>(null)
  const [nextGaps, setNextGaps] = useState<Array<{ id: string; label: string }>>([])
  const [coverage, setCoverage] = useState<{ covered: number; total: number } | null>(null)
  const [reviewer, setReviewer] = useState(false)
  const [ready, setReady] = useState(false)
  // The Save button on entry pages still writes here, so this has to have
  // somewhere to appear or people are saving into nothing.
  const [saved, setSaved] = useState<Array<{ id: string; entryId: string; headword: string }>>([])

  useEffect(() => {
    if (!loading && !user) router.push('/login?next=/profile')
  }, [user, loading, router])

  const load = useCallback(async () => {
    if (!user) return
    const [profile, userStats, recent, noticeList, langs, isMod, savedPage] = await Promise.all([
      getUserProfile(user.id).catch(() => null),
      getUserStats(user.id).catch(() => null),
      getRecentEntriesByUser(user.id, 12).catch(() => []),
      getContributorNotices(user.id).catch(() => []),
      getLanguages().catch(() => []),
      isModerator(user.id).catch(() => false),
      getSavedWordsCursor(user.id, { limit: 12 }).catch(() => null),
    ])

    const savedRows = ((savedPage as { items?: unknown[] } | null)?.items ??
      (Array.isArray(savedPage) ? savedPage : [])) as Array<Record<string, unknown>>
    setSaved(
      savedRows
        .map((row) => {
          const entry = (Array.isArray(row.entry) ? row.entry[0] : row.entry) as
            | { id?: string; headword?: string }
            | null
          return {
            id: String(row.id ?? ''),
            entryId: String(entry?.id ?? ''),
            headword: String(entry?.headword ?? ''),
          }
        })
        .filter((row) => row.headword)
    )

    const list = (langs ?? []) as Language[]
    setLanguages(list)
    setReviewer(Boolean(isMod))
    setName(String((profile as { display_name?: string } | null)?.display_name ?? ''))
    setStats({
      wordsAdded: Number((userStats as { wordsAdded?: number } | null)?.wordsAdded ?? 0),
      validated: Number((userStats as { validated?: number } | null)?.validated ?? 0),
      reputation: Number((userStats as { reputation?: number } | null)?.reputation ?? 0),
    })
    setContributions((recent ?? []) as Contribution[])
    setNotices(noticeList)

    // Their language is whichever they contribute in most, which is a better
    // guess than asking again.
    const counts: Record<string, number> = {}
    for (const row of (recent ?? []) as Contribution[]) {
      counts[row.language_id] = (counts[row.language_id] ?? 0) + 1
    }
    const topId = Object.entries(counts).sort((a, b) => b[1] - a[1])[0]?.[0]
    const chosen =
      list.find((l) => l.id === topId) ??
      list.find((l) => l.id === (profile as { languages?: string[] } | null)?.languages?.[0]) ??
      null
    setPrimaryLanguage(chosen)

    if (chosen) {
      const [gaps, cov] = await Promise.all([
        getConceptGaps(chosen.id, 5).catch(() => []),
        getCoverageForLanguage(chosen.id).catch(() => null),
      ])
      setNextGaps(
        gaps.map((gap) => ({
          id: gap.concept_id,
          label: gap.gloss_en || gap.gloss_sw || gap.concept_key,
        }))
      )
      if (cov) setCoverage({ covered: cov.concepts_covered, total: cov.concepts_total })
    }

    setReady(true)
    if (noticeList.some((notice) => !notice.read_at)) {
      markNoticesRead(user.id).catch(() => undefined)
    }
  }, [user])

  useEffect(() => {
    load()
  }, [load])

  const saveName = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!user) return
    setSavingName(true)
    try {
      await updateUserProfile(user.id, { display_name: name.trim() })
    } finally {
      setSavingName(false)
    }
  }

  if (loading || !user || !ready) return null

  const unread = notices.filter((notice) => !notice.read_at)
  const languageName = (id: string) => languages.find((l) => l.id === id)?.name ?? ''

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6">
          <p className="mark label mb-4 text-signal-300">Your Work</p>
          <div className="flex flex-col justify-between gap-8 lg:flex-row lg:items-end">
            <h1 className="display text-4xl sm:text-5xl">
              {name ? name : 'Your contributions'}
            </h1>
            <dl className="flex gap-10">
              <div>
                <dd className="headword tabular text-4xl">{stats.wordsAdded}</dd>
                <dt className="label mt-1 text-ink-400">Words Added</dt>
              </div>
              <div>
                <dd className="headword tabular text-4xl">{stats.validated}</dd>
                <dt className="label mt-1 text-ink-400">Published</dt>
              </div>
            </dl>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
        {/* What a reviewer said. This is the reason to come back, and until now
          * the message went into the database and stopped there. */}
        {notices.length > 0 && (
          <section className="mb-12">
            <h2 className="mark label mb-4 text-ink-600">
              {unread.length > 0 ? `${unread.length} new from reviewers` : 'From reviewers'}
            </h2>
            <ul className="stagger border-t border-ink-200">
              {notices.slice(0, 6).map((notice, index) => (
                <li
                  key={notice.id}
                  style={{ '--i': index } as React.CSSProperties}
                  className={`border-b border-l-2 border-ink-200 py-4 pl-4 ${
                    notice.kind === 'approved' || notice.kind === 'recording_approved'
                      ? 'border-l-petrol-500'
                      : 'border-l-signal-500'
                  }`}
                >
                  <p className="text-ink-800">{notice.message}</p>
                  <p className="label mt-1 text-ink-500">
                    {notice.entry?.headword ? notice.entry.headword : 'Your contribution'}
                  </p>
                </li>
              ))}
            </ul>
          </section>
        )}

        {/* The next thing to do, in their language, without asking again. */}
        {primaryLanguage && (
          <section className="mb-12 border-t-2 border-ink-900 pt-6">
            <h2 className="mark label mb-3 text-ink-600">Next in {primaryLanguage.name}</h2>
            {coverage && (
              <p className="mb-5 text-ink-700">
                {primaryLanguage.name} has {coverage.covered} of {coverage.total} core meanings.{' '}
                {coverage.total - coverage.covered} still missing.
              </p>
            )}
            {nextGaps.length > 0 && (
              <ul className="mb-6 flex flex-wrap gap-2">
                {nextGaps.map((gap) => (
                  <li
                    key={gap.id}
                    className="border border-ink-200 bg-paper-warm px-3 py-1.5 text-sm text-ink-700"
                  >
                    {gap.label}
                  </li>
                ))}
              </ul>
            )}
            <Link
              href={`/contribute/gaps?lang=${primaryLanguage.code ?? ''}`}
              className="btn-primary"
            >
              Add The Next Word
            </Link>
          </section>
        )}

        {/* What they have added, and where each one got to. */}
        <section className="mb-12">
          <h2 className="mark label mb-4 text-ink-600">What you have added</h2>
          {contributions.length === 0 ? (
            <div className="border-y-2 border-ink-900 py-10 text-center">
              <p className="display mb-2 text-2xl text-ink-900">Nothing yet</p>
              <p className="mb-6 text-ink-600">
                Pick a language and we will show you a meaning it is missing.
              </p>
              <Link href="/contribute/gaps" className="btn-primary">Add Your First Word</Link>
            </div>
          ) : (
            <ul className="stagger border-t border-ink-200">
              {contributions.map((row, index) => (
                <li
                  key={row.id}
                  style={{ '--i': index } as React.CSSProperties}
                  className="border-b border-ink-200"
                >
                  <Link
                    href={`/entry/${row.id}`}
                    className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 py-3.5 transition-colors hover:bg-paper-warm"
                  >
                    <span className="text-lg font-semibold text-ink-900">{row.headword}</span>
                    <span className="flex items-center gap-3">
                      <span className="label text-ink-500">{languageName(row.language_id)}</span>
                      <span
                        className={`border px-2 py-0.5 text-xs font-semibold ${
                          STATUS_TONE[row.validation_status] ?? STATUS_TONE.pending
                        }`}
                      >
                        {STATUS_LABEL[row.validation_status] ?? row.validation_status}
                      </span>
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </section>

        {reviewer && (
          <section className="mb-12 border-t border-ink-200 pt-8">
            <h2 className="mark label mb-3 text-ink-600">Reviewing</h2>
            <p className="mb-5 text-ink-700">
              You have reviewing rights. Entries, recordings and damaged spellings are all
              waiting in the queue.
            </p>
            <Link href="/moderate" className="btn-secondary">Open The Review Queue</Link>
          </section>
        )}

        {saved.length > 0 && (
          <section className="mb-12 border-t border-ink-200 pt-8">
            <h2 className="mark label mb-4 text-ink-600">Words you saved</h2>
            <ul className="flex flex-wrap gap-2">
              {saved.map((item) => (
                <li key={item.id} className="flex items-center border border-ink-200">
                  <Link
                    href={`/entry/${item.entryId}`}
                    className="px-3 py-1.5 text-sm font-semibold text-ink-800 hover:text-signal-600"
                  >
                    {item.headword}
                  </Link>
                  <button
                    onClick={async () => {
                      if (!user) return
                      await removeSavedWord(user.id, item.entryId).catch(() => undefined)
                      setSaved((prev) => prev.filter((row) => row.id !== item.id))
                    }}
                    aria-label={`Remove ${item.headword}`}
                    className="border-l border-ink-200 px-2 py-1.5 text-sm text-ink-500 hover:text-signal-600"
                  >
                    &times;
                  </button>
                </li>
              ))}
            </ul>
          </section>
        )}

        <section className="mb-12 border-t border-ink-200 pt-8">
          <ConsentSettings />
        </section>

        <section className="border-t border-ink-200 pt-8">
          <h2 className="mark label mb-4 text-ink-600">Your account</h2>
          <form onSubmit={saveName} className="mb-6 flex flex-wrap items-end gap-3">
            <div className="min-w-[16rem] flex-1">
              <label htmlFor="display-name" className="label mb-2 block text-ink-600">
                Name shown on your contributions
              </label>
              <input
                id="display-name"
                type="text"
                value={name}
                onChange={(event) => setName(event.target.value)}
                className="w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none focus:border-ink-900"
              />
            </div>
            <button type="submit" disabled={savingName} className="btn-secondary">
              {savingName ? 'Saving' : 'Save'}
            </button>
          </form>

          <p className="text-sm text-ink-600">
            Signed in as {user.email}.{' '}
            <button
              onClick={() => signOut()}
              className="font-semibold text-signal-600 underline underline-offset-4"
            >
              Sign out
            </button>
          </p>
        </section>
      </main>
    </div>
  )
}
