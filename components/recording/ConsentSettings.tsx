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
    <section className="bg-neutral-50 border border-neutral-200 rounded-2xl p-6">
      <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em] mb-3">
        Your voice recordings
      </h2>

      {message && (
        <p className="text-sm font-semibold text-heritage-dark bg-primary-100 border border-primary-200 rounded-xl px-4 py-3 mb-4">
          {message}
        </p>
      )}
      {error && (
        <p role="alert" className="text-sm font-semibold text-red-700 bg-red-50 border border-red-100 rounded-xl px-4 py-3 mb-4">
          {error}
        </p>
      )}

      {!consent ? (
        <p className="text-sm text-neutral-700">
          You have not given consent to record. You can do that from any entry page.
        </p>
      ) : (
        <>
          <p className="text-sm text-neutral-700 mb-4">
            {recordings.length === 0
              ? 'You have agreed to record, but have not made a recording yet.'
              : `${recordings.length} ${recordings.length === 1 ? 'recording' : 'recordings'} — ${verified} published, ${pending} awaiting review.`}
          </p>

          {recordings.length > 0 && (
            <ul className="mb-5 space-y-1.5">
              {recordings.slice(0, 8).map((recording) => (
                <li key={recording.id} className="text-sm text-neutral-700 flex flex-wrap gap-2">
                  <span className="font-semibold text-neutral-900">{recording.prompt_text}</span>
                  <span className="text-xs text-neutral-600 uppercase tracking-widest">
                    {recording.validation_status}
                  </span>
                </li>
              ))}
            </ul>
          )}

          {!confirming ? (
            <button
              onClick={() => setConfirming(true)}
              className="text-xs font-black uppercase tracking-[0.22em] text-red-700 hover:text-red-800"
            >
              Withdraw my consent
            </button>
          ) : (
            <div className="bg-red-50 border border-red-100 rounded-xl p-4">
              <p className="text-sm text-neutral-900 font-semibold mb-1">
                Withdraw consent and delete your recordings?
              </p>
              <p className="text-sm text-neutral-700 mb-4">
                Your {recordings.length > 0 ? `${recordings.length} ` : ''}
                {recordings.length === 1 ? 'recording' : 'recordings'} will be removed from the
                corpus and the audio files deleted. Copies already downloaded by others under the
                CC BY 4.0 licence cannot be recalled. You can give consent again at any time.
              </p>
              <div className="flex flex-wrap gap-3">
                <button
                  onClick={handleWithdraw}
                  disabled={busy}
                  className="rounded-[2.5rem] bg-red-600 px-6 py-3 text-xs font-black uppercase tracking-[0.22em] text-white disabled:opacity-50"
                >
                  {busy ? 'Withdrawing…' : 'Yes, withdraw'}
                </button>
                <button
                  onClick={() => setConfirming(false)}
                  disabled={busy}
                  className="text-xs font-black uppercase tracking-[0.22em] text-neutral-600"
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
