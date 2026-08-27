'use client'

import { Suspense, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { supabase } from '@/lib/supabase'
import { getLanguages } from '@/lib/api/languages'
import { groupLanguages } from '@/lib/constants/languageGroups'

type Language = { id: string; name: string; code?: string | null }

// Who lands here: someone who has decided to contribute and hit the wall. The
// job is to get out of their way, so this asks for the three things that are
// actually needed and nothing else.
//
// It does ask which language they speak, because that single answer decides
// which queue they see next, and asking it here means they never see an empty
// language chooser.

function CreateAccount() {
  const { signUp, user } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const next = searchParams.get('next') || '/contribute/gaps'
  const [languages, setLanguages] = useState<Language[]>([])
  const [form, setForm] = useState({ email: '', password: '', name: '', language: '' })
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')

  const set = (key: keyof typeof form, value: string) =>
    setForm((prev) => ({ ...prev, [key]: value }))

  useEffect(() => {
    if (user) router.replace(next)
  }, [user, next, router])

  useEffect(() => {
    getLanguages()
      .then((data) => setLanguages((data ?? []) as Language[]))
      .catch(() => undefined)
  }, [])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (form.password.length < 8) {
      setError('Use at least 8 characters for the password.')
      return
    }

    setBusy(true)
    setError('')
    try {
      await signUp(form.email, form.password, { display_name: form.name.trim() })

      // Best effort. If the profile row does not save, the account still works
      // and the name can be set later from the profile page.
      try {
        const { data } = await supabase.auth.getUser()
        if (data.user) {
          await supabase.from('user_profiles').upsert({
            id: data.user.id,
            display_name: form.name.trim() || null,
            languages: form.language ? [form.language] : [],
          })
        }
      } catch {
        // Nothing here should block the person from getting in.
      }

      const chosen = languages.find((l) => l.id === form.language)
      router.replace(chosen?.code ? `/contribute/gaps?lang=${chosen.code}` : next)
    } catch (err) {
      setError(
        err instanceof Error && /already registered|already exists/i.test(err.message)
          ? 'There is already an account with that email. Try signing in instead.'
          : err instanceof Error
            ? err.message
            : 'Could not create the account.'
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
          <p className="mark label mb-5 text-signal-500">Create An Account</p>
          <h1 className="display text-4xl text-ink-900 sm:text-5xl">
            Your words, credited to you
          </h1>
          <p className="definition mt-6 max-w-sm text-ink-700">
            An account exists so contributions can be attributed, so you can correct your own
            entries, and so you can withdraw a recording later if you want to.
          </p>

          <ul className="mt-8 space-y-3 border-t border-ink-200 pt-6 text-[0.9375rem] text-ink-700">
            <li>Your email is never shown to anyone else.</li>
            <li>Recordings are only ever made with your explicit consent, and you can withdraw them later.</li>
            <li>
              Forgotten the password later? You can{' '}
              <Link href="/login" className="font-semibold text-signal-600 underline underline-offset-2">
                sign in with an emailed link
              </Link>{' '}
              instead.
            </li>
          </ul>

          <p className="mt-8 text-ink-700">
            Already have an account?{' '}
            <Link
              href={`/login${next !== '/contribute/gaps' ? `?next=${encodeURIComponent(next)}` : ''}`}
              className="font-semibold text-signal-600 underline underline-offset-4"
            >
              Sign in
            </Link>
            .
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
              <label htmlFor="su-name" className="label mb-2 block text-ink-600">
                What should we call you
              </label>
              <input
                id="su-name"
                type="text"
                required
                autoComplete="name"
                value={form.name}
                onChange={(event) => set('name', event.target.value)}
                placeholder="Shown next to your contributions"
                className={field}
              />
            </div>

            <div>
              <label htmlFor="su-email" className="label mb-2 block text-ink-600">
                Email
              </label>
              <input
                id="su-email"
                type="email"
                required
                autoComplete="email"
                value={form.email}
                onChange={(event) => set('email', event.target.value)}
                className={field}
              />
            </div>

            <div>
              <label htmlFor="su-password" className="label mb-2 block text-ink-600">
                Password
              </label>
              <input
                id="su-password"
                type="password"
                required
                minLength={8}
                autoComplete="new-password"
                value={form.password}
                onChange={(event) => set('password', event.target.value)}
                placeholder="At least 8 characters"
                className={field}
              />
            </div>

            <div>
              <label htmlFor="su-language" className="label mb-2 block text-ink-600">
                Which language do you speak
              </label>
              <select
                id="su-language"
                value={form.language}
                onChange={(event) => set('language', event.target.value)}
                className={field}
              >
                <option value="">I would rather choose later</option>
                {groupLanguages(languages).map((group) => (
                  <optgroup key={group.key} label={group.label}>
                    {group.languages.map((item) => (
                      <option key={item.id} value={item.id}>{item.name}</option>
                    ))}
                  </optgroup>
                ))}
              </select>
              <p className="mt-2 text-sm text-ink-600">
                This decides which words you are asked for first. You can change it any time.
              </p>
            </div>
          </div>

          <button type="submit" disabled={busy} className="btn-primary mt-8 w-full">
            {busy ? 'Creating your account' : 'Create Account'}
          </button>
        </form>
      </div>
    </div>
  )
}

export default function SignupPage() {
  return (
    <Suspense fallback={null}>
      <CreateAccount />
    </Suspense>
  )
}
