'use client'

import { Suspense, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'

// Who lands here: almost always someone part-way through doing something else,
// usually adding a word or a recording. So the page returns them to where they
// were rather than dumping them on the homepage, and says why they are here.

function SignIn() {
  const { signIn, user } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const next = searchParams.get('next') || '/contribute/gaps'
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    if (user) router.replace(next)
  }, [user, next, router])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    setBusy(true)
    setError('')
    try {
      await signIn(email, password)
      router.replace(next)
    } catch (err) {
      setError(
        err instanceof Error && /invalid/i.test(err.message)
          ? 'That email and password do not match an account.'
          : err instanceof Error
            ? err.message
            : 'Could not sign you in.'
      )
    } finally {
      setBusy(false)
    }
  }

  const field =
    'w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900'

  return (
    <div className="min-h-screen bg-paper">
      <div className="mx-auto grid max-w-5xl gap-12 px-4 py-14 sm:px-6 md:grid-cols-2 md:gap-20 md:py-20">
        <div>
          <p className="mark label mb-5 text-signal-500">Sign In</p>
          <h1 className="display text-4xl text-ink-900 sm:text-5xl">Welcome back</h1>
          <p className="definition mt-6 max-w-sm text-ink-700">
            Signing in lets your contributions be credited to you, and lets you withdraw a
            recording later if you change your mind.
          </p>

          <p className="mt-8 text-ink-700">
            No account yet?{' '}
            <Link
              href={`/signup${next !== '/contribute/gaps' ? `?next=${encodeURIComponent(next)}` : ''}`}
              className="font-semibold text-signal-600 underline underline-offset-4"
            >
              Create one
            </Link>
            . It takes a minute and needs nothing but an email.
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
              <label htmlFor="login-password" className="label mb-2 block text-ink-600">
                Password
              </label>
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

          <button type="submit" disabled={busy} className="btn-primary mt-8 w-full">
            {busy ? 'Signing in' : 'Sign In'}
          </button>
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
