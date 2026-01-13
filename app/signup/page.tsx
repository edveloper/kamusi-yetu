'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'

export default function SignupPage() {
  const router = useRouter()
  const { signUp } = useAuth()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

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
      await signUp(email, password)
      setSuccess(true)
      setTimeout(() => router.push('/'), 2000)
    } catch (err: any) {
      setError(err.message || 'Failed to create account')
    } finally {
      setLoading(false)
    }
  }

  if (success) {
    return (
      <div className="min-h-screen bg-stone-50 flex items-center justify-center py-12 px-4">
        <div className="max-w-md w-full text-center bg-white rounded-[3rem] border border-stone-200 shadow-2xl p-12">
          <div className="w-20 h-20 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center text-3xl mx-auto mb-6">
            ✓
          </div>
          <h2 className="text-3xl font-black text-stone-900 font-logo uppercase tracking-tight mb-4">Account created!</h2>
          <p className="text-stone-500 font-medium leading-relaxed">
            Check your email to verify your account. Redirecting you to the archive...
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-stone-50 flex flex-col justify-center py-12 px-4 sm:px-6 lg:px-8 relative overflow-hidden">
      {/* Decorative Branding Elements */}
      <div className="absolute top-0 left-0 w-full h-64 bg-emerald-900 -translate-y-1/2 rounded-b-[5rem] z-0"></div>
      
      <div className="max-w-md w-full mx-auto relative z-10">
        <div className="text-center mb-10">
          <h2 className="text-4xl font-black text-white font-logo tracking-tight mb-3 italic">
            Kamusi Yetu
          </h2>
          <p className="text-emerald-100/60 font-black text-[10px] uppercase tracking-[0.3em]">
            Join the Cultural Archive
          </p>
        </div>

        <div className="bg-white rounded-[3rem] border border-stone-200 shadow-2xl shadow-emerald-900/10 p-10 md:p-12">
          <form onSubmit={handleSubmit} className="space-y-6">
            {error && (
              <div className="bg-amber-50 border border-amber-200 text-amber-800 px-5 py-4 rounded-2xl text-xs font-bold uppercase tracking-wide">
                ⚠️ {error}
              </div>
            )}

            <div>
              <label htmlFor="email" className="block text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3 ml-1">
                Identity (Email)
              </label>
              <input
                id="email"
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full px-6 py-4 bg-stone-50 border border-stone-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-emerald-500/10 focus:border-emerald-500 transition-all font-medium text-stone-900 placeholder:text-stone-300"
                placeholder="you@heritage.com"
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3 ml-1">
                Access Key (Password)
              </label>
              <input
                id="password"
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full px-6 py-4 bg-stone-50 border border-stone-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-emerald-500/10 focus:border-emerald-500 transition-all font-medium text-stone-900 placeholder:text-stone-300"
                placeholder="••••••••"
              />
            </div>

            <div>
              <label htmlFor="confirmPassword" className="block text-[10px] font-black text-stone-400 uppercase tracking-[0.2em] mb-3 ml-1">
                Verify Access Key
              </label>
              <input
                id="confirmPassword"
                type="password"
                required
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                className="w-full px-6 py-4 bg-stone-50 border border-stone-100 rounded-2xl focus:outline-none focus:ring-4 focus:ring-emerald-500/10 focus:border-emerald-500 transition-all font-medium text-stone-900 placeholder:text-stone-300"
                placeholder="••••••••"
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-emerald-900 text-white px-8 py-5 rounded-2xl font-black text-xs uppercase tracking-[0.3em] hover:bg-emerald-800 transition-all shadow-xl shadow-emerald-900/20 disabled:opacity-50 disabled:cursor-not-allowed group"
            >
              {loading ? (
                <span className="flex items-center justify-center gap-3">
                  <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin"></span>
                  ENROLLING...
                </span>
              ) : (
                'Create Profile'
              )}
            </button>
          </form>

          <div className="mt-10 pt-8 border-t border-stone-100 text-center">
            <p className="text-[10px] font-black text-stone-400 uppercase tracking-widest">
              Part of the tribe?{' '}
              <Link href="/login" className="text-emerald-600 hover:text-emerald-700 ml-2 border-b border-emerald-100 pb-1">
                Sign In
              </Link>
            </p>
          </div>
        </div>
        
        {/* Social Proof / Trust Line */}
        <p className="mt-8 text-center text-[9px] font-black text-stone-400 uppercase tracking-[0.4em] px-4 leading-relaxed">
          Your contributions are archived under Kenyan Linguistic Preservation Standards.
        </p>
      </div>

      {/* Background decoration */}
      <div className="absolute bottom-0 right-0 w-64 h-64 border-[40px] border-emerald-900/5 rounded-full -mr-32 -mb-32"></div>
    </div>
  )
}