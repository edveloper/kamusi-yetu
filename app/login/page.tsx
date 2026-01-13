'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'

export default function LoginPage() {
  const router = useRouter()
  const { signIn } = useAuth()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setLoading(true)

    try {
      await signIn(email, password)
      router.push('/')
    } catch (err) {
      setError('Invalid email or password. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-stone-50 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 relative overflow-hidden">
      {/* Decorative background elements */}
      <div className="absolute top-0 left-0 w-full h-1 bg-emerald-600"></div>
      <div className="absolute -top-24 -right-24 w-96 h-96 bg-emerald-50 rounded-full blur-3xl opacity-50"></div>
      <div className="absolute -bottom-24 -left-24 w-96 h-96 bg-emerald-50 rounded-full blur-3xl opacity-50"></div>

      <div className="max-w-md w-full relative z-10">
        <div className="text-center mb-10">
          <Link href="/" className="inline-block mb-6">
            <span className="text-3xl font-black text-emerald-900 font-logo tracking-tighter italic">
              Kamusi<span className="text-emerald-600 text-4xl">.</span>Yetu
            </span>
          </Link>
          <h2 className="text-4xl font-black text-gray-900 mb-3 font-logo tracking-tight">Karibu Tena</h2>
          <p className="text-stone-500 font-medium">Sign in to continue your preservation work.</p>
        </div>

        <div className="bg-white rounded-[2.5rem] shadow-2xl shadow-emerald-900/5 border border-stone-200 p-8 md:p-12">
          <form onSubmit={handleSubmit} className="space-y-6">
            {error && (
              <div className="bg-red-50 border border-red-100 text-red-700 px-5 py-4 rounded-2xl text-sm font-bold flex items-center gap-3">
                <span>⚠️</span> {error}
              </div>
            )}

            <div className="space-y-2">
              <label htmlFor="email" className="block text-xs font-black text-stone-400 uppercase tracking-widest ml-1">
                Email Address
              </label>
              <input
                id="email"
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full px-6 py-4 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 focus:ring-0 transition-all outline-none font-medium text-gray-900"
                placeholder="you@heritage.ke"
              />
            </div>

            <div className="space-y-2">
              <div className="flex justify-between items-end mb-1">
                <label htmlFor="password" className="block text-xs font-black text-stone-400 uppercase tracking-widest ml-1">
                  Password
                </label>
                <Link href="#" className="text-[10px] font-black text-emerald-600 uppercase tracking-widest hover:text-emerald-700">
                  Forgot?
                </Link>
              </div>
              <input
                id="password"
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full px-6 py-4 bg-stone-50 border-2 border-stone-50 rounded-2xl focus:bg-white focus:border-emerald-500 focus:ring-0 transition-all outline-none font-medium text-gray-900"
                placeholder="••••••••"
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-emerald-900 text-white px-6 py-5 rounded-2xl font-black text-lg hover:bg-emerald-800 transition-all shadow-xl shadow-emerald-900/10 disabled:opacity-50 flex items-center justify-center gap-3 group"
            >
              {loading ? (
                <div className="h-5 w-5 border-2 border-white/30 border-t-white rounded-full animate-spin"></div>
              ) : (
                <>
                  Enter the Archive
                  <span className="group-hover:translate-x-1 transition-transform">→</span>
                </>
              )}
            </button>
          </form>

          <div className="mt-10 text-center">
            <p className="text-sm text-stone-400 font-medium">
              Don't have an account?{' '}
              <Link href="/signup" className="text-emerald-600 hover:text-emerald-700 font-black decoration-2 underline-offset-4 hover:underline transition-all">
                Join the Guardians
              </Link>
            </p>
          </div>
        </div>
        
        {/* Simple Footer Link */}
        <div className="mt-12 text-center">
            <Link href="/" className="text-xs font-black text-stone-300 uppercase tracking-[0.2em] hover:text-emerald-600 transition-colors">
                ← Back to Home
            </Link>
        </div>
      </div>
    </div>
  )
}