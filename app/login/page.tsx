'use client'

import { Suspense, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'

// Almost nobody comes here on purpose. They were adding a word, or recording
// one, and hit a wall. So the page says what they were doing, returns them to
// it, and offers a way in that does not depend on remembering a password set
// months ago.

type Mode = 'link' | 'password' | 'reset'

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

  const [mode, setMode] = useState<Mode>('link')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [sent, setSent] = useState<'link' | 'reset' | null>(null)

  useEffect(() => {
    if (user) router.replace(next)
  }, [user, next, router])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    setBusy(true)
    setError('')
    try {
      if (mode === 'password') {
        await signIn(email, password)
        router.replace(next)
        return
      }
      if (mode === 'link') {
        await sendSignInLink(email, next)
        setSent('link')
        return
      }
      await sendPasswordReset(email)
      setSent('reset')
    } catch (err) {
      const message = err instanceof Error ? err.message : ''
      setError(
        /invalid login/i.test(message)
          ? 'That email and password do not match an account.'
          : /rate|too many/i.test(message)
            ? 'Too many attempts just now. Wait a minute and try again.'
            : message || 'Something went wrong. Try again.'
      )
    } finally {
      setBusy(false)
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
          We sent {sent === 'link' ? 'a sign-in link' : 'a password reset link'} to{' '}
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
            try a different address
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

            {mode === 'password' && (
              <div>
                <div className="mb-2 flex items-baseline justify-between gap-3">
                  <label htmlFor="login-password" className="label text-ink-600">
                    Password
                  </label>
                  <button
                    type="button"
                    onClick={() => {
                      setMode('reset')
                      setError('')
                    }}
                    className="text-sm font-semibold text-signal-600 underline underline-offset-4"
                  >
                    Forgotten it?
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
            )}
          </div>

          <button type="submit" disabled={busy} className="btn-primary mt-8 w-full">
            {busy
              ? 'Working'
              : mode === 'password'
                ? 'Sign In'
                : mode === 'reset'
                  ? 'Send A Reset Link'
                  : 'Email Me A Sign-In Link'}
          </button>

          <div className="mt-6 border-t border-ink-200 pt-5">
            {mode === 'link' && (
              <p className="text-sm text-ink-600">
                No password needed. We email you a link that signs you in.{' '}
                <button
                  type="button"
                  onClick={() => {
                    setMode('password')
                    setError('')
                  }}
                  className="font-semibold text-signal-600 underline underline-offset-4"
                >
                  Use a password instead
                </button>
              </p>
            )}
            {mode === 'password' && (
              <p className="text-sm text-ink-600">
                <button
                  type="button"
                  onClick={() => {
                    setMode('link')
                    setError('')
                  }}
                  className="font-semibold text-signal-600 underline underline-offset-4"
                >
                  Email me a link instead
                </button>{' '}
                and skip the password entirely.
              </p>
            )}
            {mode === 'reset' && (
              <p className="text-sm text-ink-600">
                We will email you a link to set a new password.{' '}
                <button
                  type="button"
                  onClick={() => {
                    setMode('password')
                    setError('')
                  }}
                  className="font-semibold text-signal-600 underline underline-offset-4"
                >
                  Back to signing in
                </button>
              </p>
            )}
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
