'use client'

import { useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import {
  getPendingRecordings,
  runModerationAction,
  type PendingRecording,
} from '@/lib/api/moderation'

/**
 * Recordings waiting on review.
 *
 * Nothing surfaced this queue before, so a submitted recording sat at 'pending'
 * indefinitely and never reached an entry page. The approve and reject actions
 * have existed on the moderation route since the voice layer went in; this is
 * the missing half.
 */
export default function RecordingsQueue() {
  const [items, setItems] = useState<PendingRecording[]>([])
  const [loading, setLoading] = useState(true)
  const [busy, setBusy] = useState<Record<string, boolean>>({})
  const [error, setError] = useState('')

  const load = useCallback(async () => {
    setLoading(true)
    setError('')
    try {
      setItems(await getPendingRecordings())
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not load the recordings queue.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    load()
  }, [load])

  const act = async (id: string, approve: boolean) => {
    let note = ''
    if (!approve) {
      note = (window.prompt('Why is this recording being rejected? The speaker sees your answer.') || '').trim()
      if (!note) return
    }
    setBusy((prev) => ({ ...prev, [id]: true }))
    setError('')
    try {
      await runModerationAction(
        approve
          ? { action: 'approve_recording', itemId: id }
          : { action: 'reject_recording', itemId: id, note }
      )
      setItems((prev) => prev.filter((item) => item.id !== id))
    } catch (err) {
      setError(err instanceof Error ? err.message : 'That action failed.')
    } finally {
      setBusy((prev) => ({ ...prev, [id]: false }))
    }
  }

  const speakerLine = (item: PendingRecording) =>
    [
      item.speaker?.speaker_type === 'native' ? 'First-language speaker' : null,
      item.speaker?.speaker_type === 'heritage' ? 'Heritage speaker' : null,
      item.speaker?.speaker_type === 'learner' ? 'Learner' : null,
      item.speaker?.home_county ? `learned in ${item.speaker.home_county}` : null,
      item.duration_ms ? `${Math.round(item.duration_ms / 1000)}s` : null,
    ]
      .filter(Boolean)
      .join(' · ')

  if (loading) return <p className="text-ink-600">Loading recordings.</p>

  return (
    <div>
      {error && (
        <p
          role="alert"
          className="mb-6 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
        >
          {error}
        </p>
      )}

      {items.length === 0 ? (
        <div className="border-y-2 border-ink-900 py-12 text-center">
          <p className="display mb-2 text-2xl text-ink-900">Nothing waiting</p>
          <p className="text-ink-600">No recordings need review right now.</p>
        </div>
      ) : (
        <ul className="stagger border-t border-ink-200">
          {items.map((item, index) => (
            <li
              key={item.id}
              style={{ '--i': index } as React.CSSProperties}
              className="border-b border-ink-200 py-5"
            >
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1">
                <Link
                  href={`/entry/${item.entry_id}`}
                  className="text-lg font-semibold text-ink-900 hover:text-signal-600"
                >
                  {item.entry?.headword || item.prompt_text}
                </Link>
                <span className="label text-ink-500">
                  {item.entry?.language?.name ?? 'Unknown language'}
                </span>
              </div>

              <p className="mt-1 text-sm text-ink-600">{speakerLine(item)}</p>

              <p className="mt-3 text-sm text-ink-700">
                Said aloud as <strong className="text-ink-900">{item.prompt_text}</strong>
              </p>

              <div className="mt-4 flex flex-wrap gap-3">
                <button
                  onClick={() => act(item.id, true)}
                  disabled={busy[item.id]}
                  className="btn-primary py-2 text-sm"
                >
                  Publish
                </button>
                <button
                  onClick={() => act(item.id, false)}
                  disabled={busy[item.id]}
                  className="border border-ink-300 px-4 py-2 text-sm font-semibold text-ink-600 transition-colors hover:border-signal-500 hover:text-signal-600"
                >
                  Send back
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
