'use client'

import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { useEffect, useState } from 'react'

export default function Header() {
  const { user, signOut, loading } = useAuth()
  const [mounted, setMounted] = useState(false)
  const [menuOpen, setMenuOpen] = useState(false)

  useEffect(() => {
    setMounted(true)
  }, [])

  // Explicit logout handler for mobile to ensure the menu closes and state clears
  const handleSignOut = async () => {
    try {
      setMenuOpen(false) // Close menu first to prevent UI flickering
      await signOut()
    } catch (error) {
      console.error('Logout failed:', error)
    }
  }

  const Logo = () => (
    <div className="flex items-center space-x-3 group">
      <div className="relative w-10 h-10 rounded-xl overflow-hidden shadow-md flex-shrink-0 ring-1 ring-stone-200">
        <div className="absolute inset-0 flex flex-col">
          <div className="h-[28%] bg-stone-900"></div>
          <div className="h-[6%] bg-white"></div>
          <div className="h-[32%] bg-red-600"></div>
          <div className="h-[6%] bg-white"></div>
          <div className="h-[28%] bg-emerald-700"></div>
        </div>
      </div>
      <span className="text-xl font-black text-stone-900 font-logo tracking-tighter uppercase group-hover:text-emerald-800 transition-colors">
        Kamusi Yetu
      </span>
    </div>
  )

  if (!mounted || loading) {
    return (
      <header className="bg-white border-b border-stone-100 sticky top-0 z-[60] h-20 flex items-center">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
          <div className="flex items-center justify-between">
            <Logo />
            <div className="w-24 h-8 bg-stone-100 animate-pulse rounded-xl"></div>
          </div>
        </div>
      </header>
    )
  }

  const navLinks = [
    { name: 'Explore', href: '/explore' },
    { name: 'Trending', href: '/trending' },
    { name: 'About', href: '/about' },
    { name: 'Team', href: '/team' }
  ]

  return (
    <header className="bg-white/90 backdrop-blur-md border-b border-stone-100 sticky top-0 z-[60] h-20 flex items-center">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div className="flex items-center justify-between">
          <Link href="/" onClick={() => setMenuOpen(false)}>
            <Logo />
          </Link>

          <nav className="hidden md:flex items-center space-x-10">
            {navLinks.map((link) => (
              <Link 
                key={link.name} 
                href={link.href} 
                className="text-[10px] font-black text-stone-500 hover:text-emerald-800 uppercase tracking-[0.3em] transition-all"
              >
                {link.name}
              </Link>
            ))}
          </nav>

          <div className="flex items-center gap-4">
            <div className="hidden md:flex items-center gap-6">
              {user ? (
                <>
                  <Link href="/contribute">
                    <button className="bg-emerald-900 text-white px-6 py-2.5 rounded-xl font-black text-[10px] uppercase tracking-[0.2em] hover:bg-stone-900 transition-all">
                      + Add Word
                    </button>
                  </Link>
                  <Link href="/profile" className="text-[10px] font-black text-stone-900 uppercase tracking-[0.2em] border-b-2 border-transparent hover:border-emerald-600 transition-all">
                    Profile
                  </Link>
                  <button onClick={() => signOut()} className="text-[10px] font-black text-red-500 uppercase tracking-[0.2em] opacity-60 hover:opacity-100">
                    Logout
                  </button>
                </>
              ) : (
                <div className="flex items-center gap-2">
                  <Link href="/login" className="text-stone-900 font-black text-[10px] uppercase tracking-[0.2em] px-4">Login</Link>
                  <Link href="/signup">
                    <button className="bg-stone-900 text-white px-6 py-2.5 rounded-xl font-black text-[10px] uppercase tracking-[0.2em] hover:bg-emerald-900 transition-all">Join</button>
                  </Link>
                </div>
              )}
            </div>

            <div className="md:hidden flex items-center gap-3">
              {user && (
                <Link href="/contribute" onClick={() => setMenuOpen(false)}>
                  <button className="bg-emerald-900 text-white w-10 h-10 rounded-xl flex items-center justify-center font-black">
                    +
                  </button>
                </Link>
              )}
              <button 
                onClick={() => setMenuOpen(!menuOpen)} 
                className="text-stone-900 p-2 bg-stone-50 rounded-xl border border-stone-200 z-[70]"
              >
                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d={menuOpen ? "M6 18L18 6M6 6l12 12" : "M4 6h16M4 12h16M4 18h16"} />
                </svg>
              </button>
            </div>
          </div>
        </div>

        {/* Mobile Dropdown */}
        {menuOpen && (
          <div className="absolute top-20 left-0 w-full bg-white border-b border-stone-200 p-8 md:hidden flex flex-col space-y-6 shadow-2xl animate-in fade-in slide-in-from-top-4 z-[55]">
            {navLinks.map((link) => (
              <Link 
                key={link.name} 
                href={link.href} 
                onClick={() => setMenuOpen(false)} 
                className="text-[10px] font-black text-stone-900 uppercase tracking-[0.3em]"
              >
                {link.name}
              </Link>
            ))}
            
            {user ? (
              <div className="pt-6 flex flex-col space-y-6 border-t border-stone-100">
                <Link 
                  href="/profile" 
                  onClick={() => setMenuOpen(false)} 
                  className="text-[10px] font-black text-emerald-800 uppercase tracking-[0.3em]"
                >
                  View Profile
                </Link>
                <button 
                  onClick={handleSignOut} 
                  className="text-left text-[10px] font-black text-red-500 uppercase tracking-[0.3em]"
                >
                  Logout
                </button>
              </div>
            ) : (
              <div className="pt-6 flex flex-col space-y-6 border-t border-stone-100">
                <Link href="/login" onClick={() => setMenuOpen(false)} className="text-[10px] font-black text-stone-900 uppercase tracking-[0.3em]">Login</Link>
                <Link href="/signup" onClick={() => setMenuOpen(false)} className="text-[10px] font-black text-emerald-700 uppercase tracking-[0.3em]">Join Archive</Link>
              </div>
            )}
          </div>
        )}
      </div>
    </header>
  )
}