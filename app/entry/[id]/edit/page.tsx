'use client'

import { Suspense, use, useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { isModerator } from '@/lib/api/users'
import {
  loadEntryForEditing,
  loadSuggestion,
  rejectReview,
  saveReview,
  submitCorrection,
  type EditableEntry,
  type PendingSuggestion,
} from '@/lib/api/entry-editor'
import { changedColumns, type EntryDraft } from '@/lib/entry-draft'
import EntryForm from '@/components/entry/EntryForm'

// The whole entry, every field, in one place. A contributor uses it to suggest
// a correction; a reviewer uses the same form to edit anything and approve.
// With ?suggestion=<id>, a reviewer sees that suggestion laid over the entry
// with each changed field marked.

type Done = { title: string; body: string }

function EditEntry({ id }: { id: string }) {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()
  const suggestionId = searchParams.get('suggestion') ?? undefined

  const [entry, setEntry] = useState<EditableEntry | null>(null)
  const [suggestion, setSuggestion] = useState<PendingSuggestion | null>(null)
  const [draft, setDraft] = useState<EntryDraft | null>(null)
  const [reviewer, setReviewer] = useState(false)
  const [reason, setReason] = useState('')
  const [state, setState] = useState<'loading' | 'ready' | 'missing'>('loading')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [done, setDone] = useState<Done | null>(null)

  useEffect(() => {
    if (!authLoading && !user) router.push(`/login?next=/entry/${id}/edit`)
  }, [user, authLoading, router, id])

  useEffect(() => {
    if (!user) return
    let cancelled = false
    ;(async () => {
      try {
        const [loaded, canReview] = await Promise.all([loadEntryForEditing(id), isModerator(user.id)])
        if (cancelled) return
        if (!loaded) {
          setState('missing')
          return
        }
        setEntry(loaded)
        setReviewer(canReview)
        if (canReview && suggestionId) {
          const s = await loadSuggestion(suggestionId, loaded)
          if (cancelled) return
          setSuggestion(s)
          setDraft(s ? s.draft : loaded.draft)
        } else {
          setDraft(loaded.draft)
        }
        setState('ready')
      } catch (err) {
        if (!cancelled) {
          setError(err instanceof Error ? err.message : 'Could not load that entry.')
          setState('missing')
        }
      }
    })()
    return () => {
      cancelled = true
    }
  }, [user, id, suggestionId])

  const changes = useMemo(
    () => (entry && draft ? changedColumns(entry.draft, draft) : []),
    [entry, draft]
  )

  if (authLoading || !user) return null

  const mode = reviewer ? 'review' : 'suggest'

  const approve = async () => {
    if (!entry || !draft) return
    setBusy(true)
    setError('')
    try {
      await saveReview(entry, draft, user.id, { suggestionId: suggestion?.id })
      setDone({
        title: 'Approved',
        body: 'The entry is public with your changes, and it no longer carries the Not Yet Reviewed label.',
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the review.')
    } finally {
      setBusy(false)
    }
  }

  const sendBack = async () => {
    if (!entry) return
    const note = window.prompt(
      suggestion
        ? 'Why is this correction not being applied? The contributor is shown your answer.'
        : 'Why is this being sent back? The contributor is shown your answer.'
    )
    if (!note || !note.trim()) return
    setBusy(true)
    setError('')
    try {
      await rejectReview(entry, note, { suggestionId: suggestion?.id })
      setDone({ title: 'Sent back', body: 'The contributor will see your reason.' })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not send it back.')
    } finally {
      setBusy(false)
    }
  }

  const suggest = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!entry || !draft) return
    setBusy(true)
    setError('')
    try {
      const result = await submitCorrection(entry, draft, reason, user.id)
      const parts = [
        result.fieldsChanged ? `${result.fieldsChanged} change${result.fieldsChanged === 1 ? '' : 's'}` : '',
        result.sensesAdded ? `${result.sensesAdded} new meaning${result.sensesAdded === 1 ? '' : 's'}` : '',
        result.examplesAdded ? `${result.examplesAdded} new example${result.examplesAdded === 1 ? '' : 's'}` : '',
      ].filter(Boolean)
      setDone({
        title: 'Thank you',
        body: `${parts.join(', ')} sent for review. A reviewer for ${entry.languageName} will check them before they appear.`,
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not send your correction.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-2xl px-4 py-12 sm:px-6 md:py-16">
          <p className="mark label mb-5 text-signal-300">
            {reviewer ? (suggestion ? 'Review a Correction' : 'Review') : 'Suggest a Correction'}
          </p>
          <h1 className="headword break-words text-5xl sm:text-6xl">
            {entry?.draft.headword ?? ' '}
          </h1>
          {entry && (
            <p className="label mt-4 text-sand-300">
              {entry.languageName}
              {reviewer ? ` · ${entry.status}${entry.humanReviewed ? ', reviewed' : ''}` : ''}
            </p>
          )}
          {!reviewer && (
            <p className="definition mt-6 max-w-lg text-ink-300">
              Change anything that is wrong or missing, or add a meaning or an example. A reviewer
              who speaks the language checks it before it goes live.
            </p>
          )}
        </div>
      </header>

      <main className="mx-auto max-w-2xl px-4 py-10 sm:px-6">
        {state === 'missing' && (
          <div className="border-t-2 border-ink-900 pt-8">
            <p className="text-ink-700">
              {error || 'That entry could not be found, or it is not open for editing.'}
            </p>
            <Link href="/explore" className="btn-secondary mt-6 inline-block">
              Browse the corpus
            </Link>
          </div>
        )}

        {done && (
          <div className="border-y-2 border-ink-900 py-8">
            <p className="mark label mb-3 text-signal-500">{done.title}</p>
            <p className="text-ink-700">{done.body}</p>
            <div className="mt-8 flex flex-wrap gap-3">
              <Link href={`/entry/${id}`} className="btn-primary">
                See the entry
              </Link>
              {reviewer && (
                <Link href="/moderate" className="btn-secondary">
                  Back to the queue
                </Link>
              )}
            </div>
          </div>
        )}

        {state === 'ready' && entry && draft && !done && (
          <form onSubmit={suggest}>
            {error && (
              <p
                role="alert"
                className="mb-8 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
              >
                {error}
              </p>
            )}

            {reviewer && entry.reviewNote && (
              <p className="mb-8 border-l-2 border-signal-500 pl-3 text-sm text-ink-700">{entry.reviewNote}</p>
            )}
            {suggestion?.reason && (
              <p className="mb-8 border-l-2 border-petrol-500 pl-3 text-sm text-ink-700">
                The contributor&apos;s note. {suggestion.reason}
              </p>
            )}

            <EntryForm
              mode={mode}
              draft={draft}
              onChange={setDraft}
              original={entry.draft}
              languageName={entry.languageName}
              languageId={entry.languageId}
            />

            {changes.length > 0 && (
              <section className="mt-10 border border-ink-200 bg-paper-warm px-5 py-4">
                <h2 className="label mb-3 text-ink-900">
                  {changes.length} change{changes.length === 1 ? '' : 's'} to the entry
                </h2>
                <ul className="space-y-2 text-sm">
                  {changes.map((c) => (
                    <li key={c.key}>
                      <span className="font-semibold text-ink-900">{c.label}</span>
                      <span className="text-ink-500"> from </span>
                      <span className="text-ink-700 line-through">{c.from || 'empty'}</span>
                      <span className="text-ink-500"> to </span>
                      <span className="text-ink-900">{c.to || 'empty'}</span>
                    </li>
                  ))}
                </ul>
              </section>
            )}

            {reviewer ? (
              <div className="mt-10 flex flex-wrap items-center gap-3 border-t border-ink-200 pt-8">
                <button type="button" onClick={approve} disabled={busy} className="btn-primary">
                  {busy ? 'Saving' : 'Approve and Publish'}
                </button>
                <button type="button" onClick={sendBack} disabled={busy} className="btn-secondary">
                  Send Back
                </button>
                <p className="w-full text-sm text-ink-600">
                  Approving saves every field as shown, approves new meanings and examples, and
                  marks the entry reviewed.
                </p>
              </div>
            ) : (
              <div className="mt-10 border-t border-ink-200 pt-8">
                <label htmlFor="ef-reason" className="label mb-2 block text-ink-600">
                  Why the change (optional)
                </label>
                <textarea
                  id="ef-reason"
                  rows={2}
                  value={reason}
                  onChange={(e) => setReason(e.target.value)}
                  placeholder="For example, that is the Nyanza spelling, or my grandmother uses it this way"
                  className="w-full resize-y border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900"
                />
                <button type="submit" disabled={busy} className="btn-primary mt-6">
                  {busy ? 'Sending' : 'Send for Review'}
                </button>
              </div>
            )}
          </form>
        )}
      </main>
    </div>
  )
}

export default function EditEntryPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params)
  return (
    <Suspense fallback={null}>
      <EditEntry id={id} />
    </Suspense>
  )
}
