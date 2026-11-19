'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import { useAuth } from '@/lib/contexts/AuthContext'

// The machine translation box on the Translate page. It loads after the page,
// so the dictionary's own answers never wait for the GPU. NLLB-200 is shown
// free and labelled (CC BY-NC 4.0), and speakers can say whether it is right.

type Props = { q: string; from: string; to: string; fromName: string; toName: string }
type State =
  | { kind: 'loading' }
  | { kind: 'done'; id: string | null; translation: string }
  | { kind: 'failed'; busy: boolean }

export default function MachineTranslation({ q, from, to, fromName, toName }: Props) {
  const { user } = useAuth()
  const [state, setState] = useState<State>({ kind: 'loading' })
  const [slow, setSlow] = useState(false)
  const [verdict, setVerdict] = useState<'right' | 'wrong' | null>(null)
  const [better, setBetter] = useState('')
  const [sent, setSent] = useState(false)
  const [sending, setSending] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    let cancelled = false
    const slowTimer = setTimeout(() => !cancelled && setSlow(true), 6000)
    fetch('/api/translate/machine', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ q, from, to }),
    })
      .then(async (res) => {
        const json = await res.json().catch(() => ({}))
        if (cancelled) return
        if (res.ok && json.translation) setState({ kind: 'done', id: json.id ?? null, translation: json.translation })
        else setState({ kind: 'failed', busy: res.status === 429 })
      })
      .catch(() => !cancelled && setState({ kind: 'failed', busy: false }))
    return () => {
      cancelled = true
      clearTimeout(slowTimer)
    }
  }, [q, from, to])

  const send = async (choice: 'right' | 'wrong') => {
    if (state.kind !== 'done' || !state.id) return
    setSending(true)
    setError('')
    try {
      const { data } = await supabase.auth.getSession()
      const token = data.session?.access_token
      if (!token) throw new Error('Sign in to say whether it is right.')
      const res = await fetch('/api/translate/machine/feedback', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
        body: JSON.stringify({ id: state.id, verdict: choice, betterText: choice === 'wrong' ? better : undefined }),
      })
      const json = await res.json().catch(() => ({}))
      if (!res.ok) throw new Error(json.error || 'Could not save that. Try again.')
      setSent(true)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that. Try again.')
    } finally {
      setSending(false)
    }
  }

  if (state.kind === 'failed') {
    return (
      <div className="mt-10 border border-ink-200 px-5 py-4 text-sm text-ink-600">
        {state.busy
          ? 'The machine translator is busy right now. Try again in a few minutes.'
          : 'The machine translator is not answering right now. Try again later.'}
      </div>
    )
  }

  return (
    <section aria-label="Machine translation" className="mt-10 border-2 border-ink-900 px-5 py-5 sm:px-6">
      <div className="mb-3 flex flex-wrap items-center gap-x-3 gap-y-1">
        <span className="border border-ink-900 bg-ink-900 px-2.5 py-1 text-xs font-semibold text-paper">
          Machine Translation
        </span>
        <span className="label text-ink-500">
          {fromName} to {toName} · not checked by a speaker
        </span>
      </div>

      {state.kind === 'loading' ? (
        <div aria-live="polite">
          <p className="text-lg text-ink-500">Translating</p>
          {slow && (
            <p className="mt-2 text-sm text-ink-500">
              The translator sleeps when it is quiet. Waking it can take a minute.
            </p>
          )}
        </div>
      ) : (
        <>
          <p className="break-words text-2xl font-semibold text-ink-900 sm:text-3xl" lang={to}>
            {state.translation}
          </p>
          <p className="mt-4 max-w-xl text-sm text-ink-600">
            By NLLB-200, a translation model from Meta. It is often close and sometimes badly
            wrong, so check anything important with a speaker.
          </p>

          {state.id && (
            <div className="mt-5 border-t border-ink-200 pt-4">
              {sent ? (
                <p className="text-sm font-semibold text-ink-700">
                  Thank you. A reviewer will look at it.
                </p>
              ) : !user ? (
                <p className="text-sm text-ink-600">
                  Speak {toName}?{' '}
                  <Link href="/login?next=/translate" className="font-semibold text-signal-600 underline underline-offset-2">
                    Sign in
                  </Link>{' '}
                  to say whether this is right.
                </p>
              ) : (
                <div>
                  <p className="label mb-3 text-ink-600">Is this right?</p>
                  <div className="flex flex-wrap gap-3">
                    <button
                      type="button"
                      disabled={sending}
                      onClick={() => {
                        setVerdict('right')
                        send('right')
                      }}
                      className="border border-ink-300 px-3 py-1.5 text-sm font-semibold text-ink-700 hover:border-ink-900"
                    >
                      Yes, It Is Right
                    </button>
                    <button
                      type="button"
                      disabled={sending}
                      onClick={() => setVerdict('wrong')}
                      className={`border px-3 py-1.5 text-sm font-semibold hover:border-ink-900 ${
                        verdict === 'wrong' ? 'border-ink-900 text-ink-900' : 'border-ink-300 text-ink-700'
                      }`}
                    >
                      No, Not Quite
                    </button>
                  </div>
                  {verdict === 'wrong' && (
                    <div className="mt-4">
                      <label htmlFor="mt-better" className="mb-2 block text-sm text-ink-700">
                        How would you say it in {toName}? Leave it empty if you are not sure.
                      </label>
                      <textarea
                        id="mt-better"
                        value={better}
                        onChange={(e) => setBetter(e.target.value)}
                        maxLength={400}
                        rows={2}
                        lang={to}
                        className="w-full border border-ink-300 px-3 py-2 text-ink-900 outline-none focus:border-ink-900"
                      />
                      <button
                        type="button"
                        disabled={sending}
                        onClick={() => send('wrong')}
                        className="btn-primary mt-3"
                      >
                        {sending ? 'Sending' : 'Send'}
                      </button>
                    </div>
                  )}
                  {error && <p className="mt-3 text-sm font-semibold text-signal-700">{error}</p>}
                </div>
              )}
            </div>
          )}
        </>
      )}
    </section>
  )
}
