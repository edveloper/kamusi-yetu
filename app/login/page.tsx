'use client'

import { Suspense, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'

// Almost nobody comes here on purpose. They were adding a word, or recording
// one, and hit a wall. So the page says what they were doing and returns them
// to it.
//
// Email and password are the form. Most people remember their password, and
// making them click past it to reach the normal path was the wrong trade. The
// emailed link and the reset both sit underneath as one-click alternatives for
// the cases where the password is the problem.

const WHERE: Record<string, string> = {
  '/contribute/gaps': 'to add a word',
  '/contribute': 'to add a word',
  '/profile': 'to see your contributions',
  '/moderate': 'to review entries',
}

function describeDestination(next: string) {
  if (WHERE[next]) return WHERE[next]
  if (next.startsWith('/entry/')) return 'to record a word'
  return null
}

function SignIn() {
  const { signIn, sendSignInLink, sendPasswordReset, user } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const next = searchParams.get('next') || '/contribute/gaps'
  const purpose = describeDestination(next)

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [busy, setBusy] = useState<'password' | 'link' | 'reset' | null>(null)
  const [error, setError] = useState('')
  const [sent, setSent] = useState<'link' | 'reset' | null>(null)

  useEffect(() => {
    if (user) router.replace(next)
  }, [user, next, router])

  const explain = (err: unknown) => {
    const message = err instanceof Error ? err.message : ''
    if (/invalid login/i.test(message)) return 'That email and password do not match an account.'
    if (/rate|too many/i.test(message)) return 'Too many attempts just now. Wait a minute and try again.'
    if (/email/i.test(message) && /valid/i.test(message)) return 'That does not look like an email address.'
    return message || 'Something went wrong. Try again.'
  }

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    setBusy('password')
    setError('')
    try {
      await signIn(email, password)
      router.replace(next)
    } catch (err) {
      setError(explain(err))
    } finally {
      setBusy(null)
    }
  }

  // Both alternatives need an email and nothing else, so they reuse the field
  // that is already filled in rather than switching the form to another mode.
  const alternative = async (kind: 'link' | 'reset') => {
    if (!email.trim()) {
      setError('Type your email address first, then choose that option.')
      return
    }
    setBusy(kind)
    setError('')
    try {
      if (kind === 'link') await sendSignInLink(email, next)
      else await sendPasswordReset(email)
      setSent(kind)
    } catch (err) {
      setError(explain(err))
    } finally {
      setBusy(null)
    }
  }

  const field =
    'w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900'

  if (sent) {
    return (
      <div className="mx-auto flex min-h-[70vh] max-w-lg flex-col justify-center px-4 py-14 sm:px-6">
        <p className="mark label mb-5 text-signal-500">Check Your Email</p>
        <h1 className="display text-4xl text-ink-900">
          {sent === 'link' ? 'The link is on its way' : 'Reset link sent'}
        </h1>
        <p className="definition mt-6 text-ink-700">
          We sent {sent === 'link' ? 'a sign-in link' : 'a link to set a new password'} to{' '}
          <strong className="text-ink-900">{email}</strong>. It works once and expires after an
          hour.
        </p>
        <p className="mt-6 text-sm text-ink-600">
          Nothing arriving? Check the spam folder, or{' '}
          <button
            onClick={() => {
              setSent(null)
              setError('')
            }}
            className="font-semibold text-signal-600 underline underline-offset-4"
          >
            go back and try another address
          </button>
          .
        </p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-paper">
      <div className="mx-auto grid max-w-5xl gap-12 px-4 py-14 sm:px-6 md:grid-cols-2 md:gap-20 md:py-20">
        <div>
          <p className="mark label mb-5 text-signal-500">Sign In</p>
          <h1 className="display text-4xl text-ink-900 sm:text-5xl">
            {purpose ? 'Sign in to carry on' : 'Welcome back'}
          </h1>
          <p className="definition mt-6 max-w-sm text-ink-700">
            {purpose
              ? `You were about ${purpose}. Signing in takes you straight back to it.`
              : 'Your contributions are attached to your account, so you can correct them later or withdraw a recording.'}
          </p>

          <p className="mt-8 text-ink-700">
            No account yet?{' '}
            <Link
              href={`/signup?next=${encodeURIComponent(next)}`}
              className="font-semibold text-signal-600 underline underline-offset-4"
            >
              Create one
            </Link>
            . It needs an email and nothing else.
          </p>
        </div>

        <form onSubmit={submit} className="border-t-2 border-ink-900 pt-8">
          {error && (
            <p
              role="alert"
              className="mb-6 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
            >
              {error}
            </p>
          )}

          <div className="space-y-6">
            <div>
              <label htmlFor="login-email" className="label mb-2 block text-ink-600">
                Email
              </label>
              <input
                id="login-email"
                type="email"
                required
                autoComplete="email"
                value={email}
                onChange={(event) => setEmail(event.target.value)}
                className={field}
              />
            </div>

            <div>
              <div className="mb-2 flex items-baseline justify-between gap-3">
                <label htmlFor="login-password" className="label text-ink-600">
                  Password
                </label>
                <button
                  type="button"
                  onClick={() => alternative('reset')}
                  disabled={busy !== null}
                  className="text-sm font-semibold text-signal-600 underline underline-offset-4 disabled:opacity-50"
                >
                  {busy === 'reset' ? 'Sending' : 'Forgotten it?'}
                </button>
              </div>
              <input
                id="login-password"
                type="password"
                required
                autoComplete="current-password"
                value={password}
                onChange={(event) => setPassword(event.target.value)}
                className={field}
              />
            </div>
          </div>

          <button type="submit" disabled={busy !== null} className="btn-primary mt-8 w-full">
            {busy === 'password' ? 'Signing in' : 'Sign In'}
          </button>

          <div className="mt-7 border-t border-ink-200 pt-6">
            <button
              type="button"
              onClick={() => alternative('link')}
              disabled={busy !== null}
              className="btn-secondary w-full disabled:opacity-50"
            >
              {busy === 'link' ? 'Sending' : 'Email Me A Sign-In Link Instead'}
            </button>
            <p className="mt-3 text-sm text-ink-600">
              No password needed. We send a link that signs you in once.
            </p>
          </div>
        </form>
      </div>
    </div>
  )
}

export default function LoginPage() {
  return (
    <Suspense fallback={null}>
      <SignIn />
    </Suspense>
  )
}
