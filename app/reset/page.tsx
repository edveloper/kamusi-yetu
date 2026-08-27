'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'

// Where a password reset link lands. This did not exist, which meant
// resetPasswordForEmail had nowhere to send anyone even if it had been called.
// Supabase establishes a session from the link in the URL, so by the time this
// renders the person is authenticated and can simply set a new password.

export default function ResetPasswordPage() {
  const { user, loading, updatePassword } = useAuth()
  const router = useRouter()

  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [done, setDone] = useState(false)

  // Give the recovery link a moment to establish the session before deciding
  // the link was bad.
  const [settled, setSettled] = useState(false)
  useEffect(() => {
    if (loading) return
    const timer = setTimeout(() => setSettled(true), 600)
    return () => clearTimeout(timer)
  }, [loading])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (password.length < 8) {
      setError('Use at least 8 characters.')
      return
    }
    if (password !== confirm) {
      setError('The two passwords do not match.')
      return
    }

    setBusy(true)
    setError('')
    try {
      await updatePassword(password)
      setDone(true)
      setTimeout(() => router.replace('/profile'), 1600)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not set the new password.')
    } finally {
      setBusy(false)
    }
  }

  const field =
    'w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none focus:border-ink-900'

  if (loading || (!user && !settled)) return null

  if (!user) {
    return (
      <div className="mx-auto flex min-h-[70vh] max-w-lg flex-col justify-center px-4 py-14 sm:px-6">
        <p className="mark label mb-5 text-signal-500">Reset Password</p>
        <h1 className="display text-4xl text-ink-900">That link has expired</h1>
        <p className="definition mt-6 text-ink-700">
          Reset links work once and last an hour. Ask for a new one and it will arrive in a
          moment.
        </p>
        <Link href="/login" className="btn-primary mt-8 self-start">
          Get A New Link
        </Link>
      </div>
    )
  }

  if (done) {
    return (
      <div className="mx-auto flex min-h-[70vh] max-w-lg flex-col justify-center px-4 py-14 sm:px-6">
        <p className="mark label mb-5 text-signal-500">Reset Password</p>
        <h1 className="display text-4xl text-ink-900">Password changed</h1>
        <p className="definition mt-6 text-ink-700">
          You are signed in. Taking you to your contributions.
        </p>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-lg px-4 py-14 sm:px-6 md:py-20">
      <p className="mark label mb-5 text-signal-500">Reset Password</p>
      <h1 className="display text-4xl text-ink-900">Choose a new password</h1>
      <p className="definition mt-6 text-ink-700">
        Signed in as {user.email}. Set a password and you are back in.
      </p>

      <form onSubmit={submit} className="mt-10 border-t-2 border-ink-900 pt-8">
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
            <label htmlFor="new-password" className="label mb-2 block text-ink-600">
              New password
            </label>
            <input
              id="new-password"
              type="password"
              required
              minLength={8}
              autoComplete="new-password"
              value={password}
              onChange={(event) => setPassword(event.target.value)}
              className={field}
            />
          </div>

          <div>
            <label htmlFor="confirm-password" className="label mb-2 block text-ink-600">
              Type it again
            </label>
            <input
              id="confirm-password"
              type="password"
              required
              minLength={8}
              autoComplete="new-password"
              value={confirm}
              onChange={(event) => setConfirm(event.target.value)}
              className={field}
            />
          </div>
        </div>

        <button type="submit" disabled={busy} className="btn-primary mt-8 w-full">
          {busy ? 'Saving' : 'Save Password'}
        </button>
      </form>
    </div>
  )
}
