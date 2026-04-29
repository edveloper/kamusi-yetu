'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getLanguages } from '@/lib/api/languages'
import { uploadAvatar } from '@/lib/api/users'
import { supabase } from '@/lib/supabase'

type LanguageOption = { id: string; name: string; native_name?: string | null }

export default function SignupPage() {
  const router = useRouter()
  const { signUp } = useAuth()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [username, setUsername] = useState('')
  const [bio, setBio] = useState('')
  const [selectedLanguages, setSelectedLanguages] = useState<string[]>([])
  const [avatarFile, setAvatarFile] = useState<File | null>(null)
  const [languages, setLanguages] = useState<LanguageOption[]>([])
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)

  useEffect(() => {
    async function loadLanguages() {
      try {
        const langs = await getLanguages()
        setLanguages(langs || [])
      } catch {
        setLanguages([])
      }
    }
    loadLanguages()
  }, [])

  const toggleLanguage = (id: string) => {
    setSelectedLanguages((prev) =>
      prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]
    )
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setInfo('')

    if (!username.trim()) {
      setError('Username is required')
      return
    }

    if (password !== confirmPassword) {
      setError('Passwords do not match')
      return
    }

    if (password.length < 6) {
      setError('Password must be at least 6 characters')
      return
    }

    setLoading(true)
    try {
      const metadata = {
        username: username.trim(),
        display_name: username.trim(),
        bio: bio.trim() || null,
        languages: selectedLanguages
      }

      const { user: createdUser, session } = await signUp(email, password, metadata)
      if (!createdUser) throw new Error('Signup succeeded but no user was returned.')

      let avatarUrl: string | null = null
      if (avatarFile && session) {
        avatarUrl = await uploadAvatar(createdUser.id, avatarFile)
      } else if (avatarFile && !session) {
        setInfo('Account created. Verify your email, then upload your profile photo from Profile.')
      }

      try {
        await supabase.from('user_profiles').upsert({
          id: createdUser.id,
          username: username.trim(),
          display_name: username.trim(),
          bio: bio.trim() || null,
          languages: selectedLanguages,
          avatar_url: avatarUrl,
          reputation: 0,
          role: 'user'
        })
      } catch {
        // Profile hydration fallback will use auth metadata on first login.
      }

      setSuccess(true)
      setTimeout(() => router.push('/'), 2200)
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create account'
      setError(message)
    } finally {
      setLoading(false)
    }
  }

  if (success) {
    return (
      <div className="min-h-screen bg-neutral-100 flex items-center justify-center py-12 px-4">
        <div className="max-w-md w-full text-center bg-neutral-100 rounded-[3rem] border border-accent-200 shadow-soft p-12">
          <div className="w-20 h-20 bg-accent-100 text-accent-700 rounded-full flex items-center justify-center text-3xl mx-auto mb-6">
            *
          </div>
          <h2 className="text-3xl font-black text-heritage-dark font-display uppercase tracking-tight mb-4">Account created</h2>
          <p className="text-neutral-500 font-medium leading-relaxed">
            Check your email to verify your account. Redirecting you to the archive...
          </p>
          {info && <p className="text-xs text-accent-700 mt-4 font-bold">{info}</p>}
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-neutral-100 flex flex-col justify-center py-12 px-4 sm:px-6 lg:px-8 relative overflow-hidden">
      <div className="absolute top-0 left-0 w-full h-64 bg-heritage-dark -translate-y-1/2 rounded-b-[5rem] z-0"></div>

      <div className="max-w-2xl w-full mx-auto relative z-10">
        <div className="text-center mb-10">
          <h2 className="text-4xl font-black text-white font-display tracking-tight mb-3 italic">Kamusi Yetu</h2>
          <p className="text-white/60 font-black text-[10px] uppercase tracking-[0.3em]">
            Join the Cultural Archive
          </p>
        </div>

        <div className="bg-neutral-100 rounded-[3rem] border border-accent-200 shadow-soft shadow-heritage-dark/10 p-8 md:p-12">
          <form onSubmit={handleSubmit} className="space-y-6">
            {error && (
              <div className="bg-accent-50 border border-accent-200 text-accent-700 px-5 py-4 rounded-2xl text-xs font-bold uppercase tracking-wide">
                {error}
              </div>
            )}
            {info && (
              <div className="bg-accent-50 border border-accent-200 text-accent-700 px-5 py-4 rounded-2xl text-xs font-bold">
                {info}
              </div>
            )}

            <div className="grid md:grid-cols-2 gap-6">
              <div>
                <label htmlFor="email" className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">
                  Email
                </label>
                <input
                  id="email"
                  type="email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full px-6 py-4 bg-neutral-50 border border-neutral-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-heritage-dark/10 focus:border-heritage-dark transition-all font-medium text-neutral-900 placeholder:text-neutral-300"
                  placeholder="you@heritage.com"
                />
              </div>

              <div>
                <label htmlFor="username" className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">
                  Username
                </label>
                <input
                  id="username"
                  type="text"
                  required
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  className="w-full px-6 py-4 bg-neutral-50 border border-neutral-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-heritage-dark/10 focus:border-heritage-dark transition-all font-medium text-neutral-900 placeholder:text-neutral-300"
                  placeholder="e.g. nyambura"
                />
              </div>
            </div>

            <div className="grid md:grid-cols-2 gap-6">
              <div>
                <label htmlFor="password" className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">
                  Password
                </label>
                <input
                  id="password"
                  type="password"
                  required
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="w-full px-6 py-4 bg-neutral-50 border border-neutral-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-heritage-dark/10 focus:border-heritage-dark transition-all font-medium text-neutral-900 placeholder:text-neutral-300"
                  placeholder="********"
                />
              </div>

              <div>
                <label htmlFor="confirmPassword" className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">
                  Confirm Password
                </label>
                <input
                  id="confirmPassword"
                  type="password"
                  required
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  className="w-full px-6 py-4 bg-neutral-50 border border-neutral-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-heritage-dark/10 focus:border-heritage-dark transition-all font-medium text-neutral-900 placeholder:text-neutral-300"
                  placeholder="********"
                />
              </div>
            </div>

            <div>
              <label className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">Bio</label>
              <textarea
                rows={3}
                value={bio}
                onChange={(e) => setBio(e.target.value)}
                className="w-full px-6 py-4 bg-neutral-50 border border-neutral-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-heritage-dark/10 focus:border-heritage-dark transition-all font-medium text-neutral-900 placeholder:text-neutral-300 resize-none"
                placeholder="Tell the community about your language journey..."
              />
            </div>

            <div>
              <label className="block text-[10px] font-black text-neutral-400 uppercase tracking-[0.2em] mb-3 ml-1">Profile Photo (Optional)</label>
              <input
                type="file"
                accept="image/*"
                onChange={(e) => setAvatarFile(e.target.files?.[0] || null)}
                className="w-full text-xs text-neutral-500 file:mr-3 file:rounded-lg file:border-0 file:bg-heritage-dark file:px-3 file:py-2 file:text-xs file:font-bold file:text-white"
              />
            </div>

            <div>
              <label className="block text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3 ml-1">Languages (Optional)</label>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-2">
                {languages.map((lang) => {
                  const selected = selectedLanguages.includes(lang.id)
                  return (
                    <button
                      key={lang.id}
                      type="button"
                      onClick={() => toggleLanguage(lang.id)}
                      className={`px-3 py-2 rounded-xl text-xs font-black border transition ${
                        selected
                          ? 'bg-heritage-dark text-white border-heritage-dark'
                          : 'bg-neutral-50 text-neutral-600 border-neutral-200 hover:border-accent-300'
                      }`}
                    >
                      {lang.name}
                    </button>
                  )
                })}
              </div>
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-heritage-dark text-white px-8 py-5 rounded-2xl font-black text-xs uppercase tracking-[0.3em] hover:bg-heritage-darker transition-all shadow-xl shadow-heritage-dark/20 disabled:opacity-50 disabled:cursor-not-allowed group"
            >
              {loading ? (
                <span className="flex items-center justify-center gap-3">
                  <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin"></span>
                  Enrolling...
                </span>
              ) : (
                'Create Profile'
              )}
            </button>
          </form>

          <div className="mt-10 pt-8 border-t border-stone-100 text-center">
            <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest">
              Part of the tribe?{' '}
              <Link href="/login" className="text-accent-600 hover:text-accent-700 ml-2 border-b border-accent-100 pb-1">
                Sign In
              </Link>
            </p>
          </div>
        </div>
      </div>

      <div className="absolute bottom-0 right-0 w-64 h-64 border-[40px] border-heritage-dark/5 rounded-full -mr-32 -mb-32"></div>
    </div>
  )
}
