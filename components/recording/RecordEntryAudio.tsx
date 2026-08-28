'use client'

import { useCallback, useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import {
  getActiveConsent,
  grantConsent,
  getSpeakerProfile,
  upsertSpeakerProfile,
  submitRecording,
  type ConsentRecord,
  type SpeakerProfile,
} from '@/lib/api/recordings'
import {
  AGE_BANDS,
  CONSENT_SCOPES,
  CONSENT_SUMMARY,
  GENDER_OPTIONS,
  SPEAKER_TYPES,
  WHY_WE_ASK,
} from '@/lib/constants/consent'
import { COUNTY_LANGUAGE_PRESENCE } from '@/lib/constants/languageCountyPresence'

type Props = {
  entryId: string
  headword: string
  languageId: string
  languageCode: string
  languageName: string
}

type Stage = 'loading' | 'signed_out' | 'consent' | 'profile' | 'ready' | 'done'

const MAX_SECONDS = 30

export default function RecordEntryAudio({
  entryId,
  headword,
  languageId,
  languageCode,
  languageName,
}: Props) {
  const { user, loading: authLoading } = useAuth()

  const [stage, setStage] = useState<Stage>('loading')
  const [consent, setConsent] = useState<ConsentRecord | null>(null)
  const [speaker, setSpeaker] = useState<SpeakerProfile | null>(null)
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)

  const [attribute, setAttribute] = useState(true)
  const [form, setForm] = useState({
    speaker_type: 'native' as SpeakerProfile['speaker_type'],
    home_county: '',
    age_band: '',
    gender: 'prefer_not_to_say',
  })

  const [supported, setSupported] = useState(false)
  const [recording, setRecording] = useState(false)
  const [seconds, setSeconds] = useState(0)
  const [blob, setBlob] = useState<Blob | null>(null)
  const [previewUrl, setPreviewUrl] = useState<string | null>(null)

  const recorderRef = useRef<MediaRecorder | null>(null)
  const streamRef = useRef<MediaStream | null>(null)
  const chunksRef = useRef<Blob[]>([])
  const startedAtRef = useRef(0)
  const tickRef = useRef<ReturnType<typeof setInterval> | null>(null)

  const counties = COUNTY_LANGUAGE_PRESENCE.filter((county) =>
    county.languageCodes.includes(languageCode)
  )
  const countyChoices = counties.length > 0 ? counties : COUNTY_LANGUAGE_PRESENCE

  useEffect(() => {
    setSupported(
      typeof navigator !== 'undefined' &&
        !!navigator.mediaDevices?.getUserMedia &&
        typeof MediaRecorder !== 'undefined'
    )
  }, [])

  useEffect(() => {
    if (authLoading) return
    if (!user) {
      setStage('signed_out')
      return
    }

    let cancelled = false
    ;(async () => {
      try {
        const [existingConsent, existingSpeaker] = await Promise.all([
          getActiveConsent(user.id),
          getSpeakerProfile(user.id),
        ])
        if (cancelled) return
        setConsent(existingConsent)
        setSpeaker(existingSpeaker)
        if (!existingConsent) setStage('consent')
        else if (!existingSpeaker) setStage('profile')
        else setStage('ready')
      } catch (err) {
        if (!cancelled) setError(err instanceof Error ? err.message : 'Could not load your details.')
      }
    })()

    return () => {
      cancelled = true
    }
  }, [user, authLoading])

  const cleanupStream = useCallback(() => {
    streamRef.current?.getTracks().forEach((track) => track.stop())
    streamRef.current = null
    if (tickRef.current) clearInterval(tickRef.current)
    tickRef.current = null
  }, [])

  useEffect(() => () => {
    cleanupStream()
    if (previewUrl) URL.revokeObjectURL(previewUrl)
  }, [cleanupStream, previewUrl])

  const stop = useCallback(() => {
    recorderRef.current?.state === 'recording' && recorderRef.current.stop()
    setRecording(false)
  }, [])

  const start = async () => {
    setError('')
    try {
      const stream = await navigator.mediaDevices.getUserMedia({
        audio: { echoCancellation: true, noiseSuppression: true, channelCount: 1 },
      })
      streamRef.current = stream
      chunksRef.current = []

      const recorder = new MediaRecorder(stream)
      recorderRef.current = recorder

      recorder.ondataavailable = (event) => {
        if (event.data.size > 0) chunksRef.current.push(event.data)
      }
      recorder.onstop = () => {
        const captured = new Blob(chunksRef.current, { type: recorder.mimeType || 'audio/webm' })
        setBlob(captured)
        if (previewUrl) URL.revokeObjectURL(previewUrl)
        setPreviewUrl(URL.createObjectURL(captured))
        cleanupStream()
      }

      startedAtRef.current = Date.now()
      setSeconds(0)
      recorder.start()
      setRecording(true)

      tickRef.current = setInterval(() => {
        const elapsed = Math.floor((Date.now() - startedAtRef.current) / 1000)
        setSeconds(elapsed)
        if (elapsed >= MAX_SECONDS) stop()
      }, 250)
    } catch {
      setError('We could not reach your microphone. Check that your browser is allowed to use it.')
    }
  }

  const handleConsent = async () => {
    if (!user) return
    setBusy(true)
    setError('')
    try {
      const granted = await grantConsent(user.id, {
        allow_publication: true,
        allow_model_training: true,
        allow_redistribution: true,
        allow_attribution: attribute,
      })
      setConsent(granted)
      setStage(speaker ? 'ready' : 'profile')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save your consent.')
    } finally {
      setBusy(false)
    }
  }

  const handleProfile = async () => {
    if (!user) return
    setBusy(true)
    setError('')
    try {
      const saved = await upsertSpeakerProfile(user.id, {
        first_language_id: languageId,
        speaker_type: form.speaker_type,
        home_county: form.home_county || null,
        age_band: form.age_band || null,
        gender: form.gender || null,
      })
      setSpeaker(saved)
      setStage('ready')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save your speaker details.')
    } finally {
      setBusy(false)
    }
  }

  const handleSubmit = async () => {
    if (!blob || !speaker || !consent) return
    setBusy(true)
    setError('')
    try {
      await submitRecording({
        blob,
        entryId,
        languageCode,
        speakerId: speaker.id,
        consentId: consent.id,
        promptText: headword,
        promptKind: 'headword',
        durationMs: seconds * 1000,
        channels: 1,
      })
      setStage('done')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save your recording.')
    } finally {
      setBusy(false)
    }
  }

  const discard = () => {
    if (previewUrl) URL.revokeObjectURL(previewUrl)
    setPreviewUrl(null)
    setBlob(null)
    setSeconds(0)
  }

  /* ---------------------------------------------------------------- shell */

  const Shell = ({ children }: { children: React.ReactNode }) => (
    <section
      aria-labelledby="record-heading"
      className="border-2 border-ink-900 bg-card p-5 md:p-6"
    >
      <h2
        id="record-heading"
        className="mark label mb-4 text-signal-500"
      >
        Record this word
      </h2>
      {error && (
        <p role="alert" className="mb-4 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700">
          {error}
        </p>
      )}
      {children}
    </section>
  )

  if (stage === 'loading') {
    return <Shell><p className="text-sm text-ink-700">Checking your details…</p></Shell>
  }

  if (stage === 'signed_out') {
    return (
      <Shell>
        <p className="text-sm text-ink-700 mb-4">
          If you speak {languageName}, a few seconds of audio makes <strong>{headword}</strong>{' '}
          usable by voice technology. Sign in to record it.
        </p>
        <Link href={`/login?next=/entry/${entryId}`} className="btn-primary text-xs">Sign in to record</Link>
      </Shell>
    )
  }

  if (stage === 'consent') {
    return (
      <Shell>
        <ul className="text-sm text-ink-700 space-y-1.5 mb-4">
          {CONSENT_SUMMARY.map((line) => <li key={line}>{line}</li>)}
        </ul>
        <ul className="space-y-3 mb-5">
          {CONSENT_SCOPES.map((scope) => (
            <li key={scope.key} className="flex gap-3">
              <span aria-hidden="true" className="mt-0.5 font-semibold text-signal-500">
                {scope.required ? '•' : '○'}
              </span>
              <div>
                <p className="text-sm font-semibold text-ink-900">
                  {scope.label}
                  {!scope.required && (
                    <label className="ml-3 inline-flex items-center gap-2 font-medium text-ink-700">
                      <input
                        type="checkbox"
                        checked={attribute}
                        onChange={(event) => setAttribute(event.target.checked)}
                      />
                      Yes, credit me
                    </label>
                  )}
                </p>
                <p className="text-sm text-ink-700">{scope.detail}</p>
              </div>
            </li>
          ))}
        </ul>
        <button onClick={handleConsent} disabled={busy} className="btn-primary text-xs disabled:opacity-50">
          {busy ? 'Saving…' : 'I agree, and I am 18 or over'}
        </button>
        <p className="text-xs text-ink-600 mt-3">
          You can withdraw at any time from your profile, and we will delete your recordings.
        </p>
      </Shell>
    )
  }

  if (stage === 'profile') {
    return (
      <Shell>
        <p className="text-sm text-ink-700 mb-4">
          Three quick questions. They decide whether a model trained on this data works
          for everyone or only for some people.
        </p>
        <div className="space-y-4">
          <fieldset>
            <legend className="label mb-2 text-ink-600">
              Your {languageName}
            </legend>
            <div className="space-y-2">
              {SPEAKER_TYPES.map((type) => (
                <label key={type.value} className="flex gap-3 items-start">
                  <input
                    type="radio"
                    name="speaker_type"
                    value={type.value}
                    checked={form.speaker_type === type.value}
                    onChange={() => setForm({ ...form, speaker_type: type.value })}
                    className="mt-1"
                  />
                  <span className="text-sm">
                    <span className="font-semibold text-ink-900">{type.label}</span>{' '}
                    <span className="text-ink-700">{type.detail}</span>
                  </span>
                </label>
              ))}
            </div>
          </fieldset>

          <div>
            <label htmlFor="speaker-county" className="label mb-2 block text-ink-600">
              Where you learned it
            </label>
            <p className="text-xs text-ink-600 mb-2">{WHY_WE_ASK.county}</p>
            <select
              id="speaker-county"
              value={form.home_county}
              onChange={(event) => setForm({ ...form, home_county: event.target.value })}
              className="select"
            >
              <option value="">Prefer not to say</option>
              {countyChoices.map((county) => (
                <option key={county.countyCode} value={county.countyCode}>{county.countyName}</option>
              ))}
            </select>
          </div>

          <div className="grid sm:grid-cols-2 gap-4">
            <div>
              <label htmlFor="speaker-age" className="label mb-2 block text-ink-600">
                Age
              </label>
              <select
                id="speaker-age"
                value={form.age_band}
                onChange={(event) => setForm({ ...form, age_band: event.target.value })}
                className="select"
              >
                <option value="">Prefer not to say</option>
                {AGE_BANDS.map((band) => (
                  <option key={band.value} value={band.value}>{band.label}</option>
                ))}
              </select>
            </div>
            <div>
              <label htmlFor="speaker-gender" className="label mb-2 block text-ink-600">
                Voice
              </label>
              <select
                id="speaker-gender"
                value={form.gender}
                onChange={(event) => setForm({ ...form, gender: event.target.value })}
                className="select"
              >
                {GENDER_OPTIONS.map((option) => (
                  <option key={option.value} value={option.value}>{option.label}</option>
                ))}
              </select>
            </div>
          </div>
        </div>
        <button onClick={handleProfile} disabled={busy} className="btn-primary text-xs mt-5 disabled:opacity-50">
          {busy ? 'Saving…' : 'Save and start recording'}
        </button>
      </Shell>
    )
  }

  if (stage === 'done') {
    return (
      <Shell>
        <p className="text-sm font-semibold text-ink-900 mb-1">Asante. Your recording is saved.</p>
        <p className="text-sm text-ink-700">
          A moderator will check it, then it appears on this page for everyone.
        </p>
      </Shell>
    )
  }

  /* ---------------------------------------------------------------- ready */

  if (!supported) {
    return (
      <Shell>
        <p className="text-sm text-ink-700">
          This browser cannot record audio. Chrome or Firefox on Android, or Safari on
          iPhone, will work.
        </p>
      </Shell>
    )
  }

  return (
    <Shell>
      <p className="text-sm text-ink-700 mb-2">Say this word clearly, once:</p>
      <p className="headword mb-5 break-words text-4xl text-ink-900">{headword}</p>

      {!blob ? (
        <div className="flex flex-wrap items-center gap-3">
          {!recording ? (
            <button onClick={start} className="btn-primary text-xs">Start recording</button>
          ) : (
            <button
              onClick={stop}
              className="inline-flex items-center gap-2 bg-signal-500 px-5 py-3 text-[0.9375rem] font-semibold text-white"
            >
              <span aria-hidden="true" className="inline-block h-2 w-2 rounded-full bg-white" />
              Stop ({MAX_SECONDS - seconds}s)
            </button>
          )}
          <span className="text-xs text-ink-600">Up to {MAX_SECONDS} seconds.</span>
        </div>
      ) : (
        <div className="space-y-4">
          {previewUrl && (
            /* eslint-disable-next-line jsx-a11y/media-has-caption */
            <audio controls src={previewUrl} className="w-full" />
          )}
          <div className="flex flex-wrap gap-3">
            <button onClick={handleSubmit} disabled={busy} className="btn-primary text-xs disabled:opacity-50">
              {busy ? 'Saving…' : 'Use this recording'}
            </button>
            <button
              onClick={discard}
              disabled={busy}
              className="text-[0.9375rem] font-semibold text-ink-600 underline underline-offset-4 hover:text-ink-900"
            >
              Record again
            </button>
          </div>
        </div>
      )}
    </Shell>
  )
}
