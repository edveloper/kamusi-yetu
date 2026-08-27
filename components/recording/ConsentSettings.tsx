'use client'

import { useEffect, useState } from 'react'
import { useAuth } from '@/lib/contexts/AuthContext'
import {
  getActiveConsent,
  getSpeakerProfile,
  getMyRecordings,
  withdrawConsent,
  type ConsentRecord,
  type RecordingRow,
} from '@/lib/api/recordings'

/**
 * Consent is only real if it can actually be taken back. This is that control.
 * Withdrawing revokes the consent, flags every recording made under it, and
 * queues the audio files for deletion from storage.
 */
export default function ConsentSettings() {
  const { user } = useAuth()
  const [consent, setConsent] = useState<ConsentRecord | null>(null)
  const [recordings, setRecordings] = useState<RecordingRow[]>([])
  const [loading, setLoading] = useState(true)
  const [confirming, setConfirming] = useState(false)
  const [busy, setBusy] = useState(false)
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')

  useEffect(() => {
    if (!user) return
    let cancelled = false
    ;(async () => {
      try {
        const active = await getActiveConsent(user.id)
        if (cancelled) return
        setConsent(active)

        const speaker = await getSpeakerProfile(user.id)
        if (cancelled) return
        if (speaker) setRecordings(await getMyRecordings(speaker.id))
      } catch (err) {
        if (!cancelled) setError(err instanceof Error ? err.message : 'Could not load your recordings.')
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [user])

  const handleWithdraw = async () => {
    if (!consent) return
    setBusy(true)
    setError('')
    try {
      const affected = await withdrawConsent(consent.id, 'Withdrawn by the speaker from their profile.')
      setConsent(null)
      setRecordings([])
      setConfirming(false)
      setMessage(
        affected > 0
          ? `Done. ${affected} ${affected === 1 ? 'recording has' : 'recordings have'} been removed from the corpus and the audio will be deleted.`
          : 'Done. Your consent has been withdrawn.'
      )
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not withdraw your consent.')
    } finally {
      setBusy(false)
    }
  }

  if (!user || loading) return null

  const verified = recordings.filter((r) => r.validation_status === 'verified').length
  const pending = recordings.filter((r) => r.validation_status === 'pending').length

  return (
    <section className="border border-ink-200 bg-card p-6">
      <h2 className="mark label mb-3 text-ink-600">
        Your voice recordings
      </h2>

      {message && (
        <p className="mb-4 border border-petrol-200 bg-petrol-50 px-4 py-3 text-sm font-semibold text-petrol-600">
          {message}
        </p>
      )}
      {error && (
        <p role="alert" className="mb-4 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700">
          {error}
        </p>
      )}

      {!consent ? (
        <p className="text-sm text-ink-700">
          You have not given consent to record. You can do that from any entry page.
        </p>
      ) : (
        <>
          <p className="mb-4 text-sm text-ink-700">
            {recordings.length === 0
              ? 'You have agreed to record, but have not made a recording yet.'
              : `${recordings.length} ${recordings.length === 1 ? 'recording' : 'recordings'}. ${verified} published, ${pending} awaiting review.`}
          </p>

          {recordings.length > 0 && (
            <ul className="mb-5 space-y-1.5">
              {recordings.slice(0, 8).map((recording) => (
                <li key={recording.id} className="flex flex-wrap gap-2 text-sm text-ink-700">
                  <span className="font-semibold text-ink-900">{recording.prompt_text}</span>
                  <span className="label text-ink-500">
                    {recording.validation_status}
                  </span>
                </li>
              ))}
            </ul>
          )}

          {!confirming ? (
            <button
              onClick={() => setConfirming(true)}
              className="text-sm font-semibold text-signal-600 underline underline-offset-4 hover:text-signal-700"
            >
              Withdraw my consent
            </button>
          ) : (
            <div className="border border-signal-200 bg-signal-50 p-4">
              <p className="mb-1 text-sm font-semibold text-ink-900">
                Withdraw consent and delete your recordings?
              </p>
              <p className="mb-4 text-sm text-ink-700">
                Your {recordings.length > 0 ? `${recordings.length} ` : ''}
                {recordings.length === 1 ? 'recording' : 'recordings'} will be removed from the
                corpus and the audio files deleted. Copies already downloaded by others under the
                CC BY 4.0 licence cannot be recalled. You can give consent again at any time.
              </p>
              <div className="flex flex-wrap gap-3">
                <button
                  onClick={handleWithdraw}
                  disabled={busy}
                  className="bg-signal-500 px-5 py-3 text-[0.9375rem] font-semibold text-white disabled:opacity-50"
                >
                  {busy ? 'Withdrawing…' : 'Yes, withdraw'}
                </button>
                <button
                  onClick={() => setConfirming(false)}
                  disabled={busy}
                  className="text-[0.9375rem] font-semibold text-ink-600"
                >
                  Keep them
                </button>
              </div>
            </div>
          )}
        </>
      )}
    </section>
  )
}
