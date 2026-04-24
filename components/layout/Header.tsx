'use client'

import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { useState } from 'react'

function Logo() {
  return (
    <div className="flex items-center space-x-3 group">
      <div className="flex-shrink-0 w-10 h-10 flex items-center justify-center">
        <svg className="w-10 h-10" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <defs>
            <linearGradient id="kenyaFlag" x1="0" x2="0" y1="0" y2="1">
              <stop offset="0%" stopColor="#000" />
              <stop offset="33%" stopColor="#000" />
              <stop offset="33%" stopColor="#fff" />
              <stop offset="34%" stopColor="#fff" />
              <stop offset="34%" stopColor="#C8102E" />
              <stop offset="67%" stopColor="#C8102E" />
              <stop offset="67%" stopColor="#fff" />
              <stop offset="68%" stopColor="#fff" />
              <stop offset="68%" stopColor="#007A3D" />
              <stop offset="100%" stopColor="#007A3D" />
            </linearGradient>
          </defs>
          <path fill="url(#kenyaFlag)" d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
          <path d="M12 21.23l-7.78-7.78 1.06-1.06A5.5 5.5 0 0 1 12 4.17a5.5 5.5 0 0 1 6.72 8.22L12 21.23z" fill="none" stroke="#111" strokeOpacity="0.06" />
        </svg>
      </div>
      <span className="text-xl font-black text-stone-900 tracking-tighter uppercase group-hover:text-emerald-800 transition-colors">
        Kamusi Yetu
      </span>
    </div>
  )
}

export default function Header() {
  const { user, signOut, loading } = useAuth()
  const [menuOpen, setMenuOpen] = useState(false)

  // Close menu when clicking outside
  const handleBackgroundClick = () => {
    if (menuOpen) {
      setMenuOpen(false)
    }
  }

  // Explicit logout handler for mobile to ensure the menu closes and state clears
  const handleSignOut = async () => {
    try {
      setMenuOpen(false)
      await signOut()
    } catch (error) {
      console.error('Logout failed:', error)
    }
  }

  if (loading) {
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
    { name: 'Translate', href: '/translate' },
    { name: 'Trending', href: '/trending' },
    { name: 'About', href: '/about' },
    { name: 'Team', href: '/team' }
  ]

  return (
    <>
      {/* Background overlay to close menu on click */}
      {menuOpen && (
        <div 
          className="fixed inset-0 z-40 md:hidden" 
          onClick={handleBackgroundClick}
        />
      )}
      <header className="sticky top-0 z-50 backdrop-blur-sm bg-white/95 border-b border-stone-100 h-20 flex items-center shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
          <div className="flex items-center justify-between">
            <Link href="/" onClick={() => setMenuOpen(false)}>
              <Logo />
            </Link>

            <nav className="hidden md:flex items-center space-x-8">
              {navLinks.map((link) => (
                <Link 
                  key={link.name} 
                  href={link.href} 
                  className="text-xs font-semibold text-stone-600 hover:text-emerald-700 uppercase tracking-[0.25em] transition-all duration-200"
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
                      <button className="bg-emerald-700 text-white px-6 py-2.5 rounded-xl font-semibold text-xs uppercase tracking-[0.2em] hover:bg-emerald-800 transition-all shadow-sm">
                        + Add Word
                      </button>
                    </Link>
                    <Link href="/profile" className="text-xs font-semibold text-stone-700 uppercase tracking-[0.2em] border-b-2 border-transparent hover:text-emerald-700 hover:border-emerald-600 transition-all">
                      Profile
                    </Link>
                    <button onClick={() => signOut()} className="text-xs font-semibold text-stone-500 uppercase tracking-[0.2em] hover:text-red-600 transition-all">
                      Logout
                    </button>
                  </>
                ) : (
                  <div className="flex items-center gap-3">
                    <Link href="/login" className="text-stone-700 font-semibold text-xs uppercase tracking-[0.2em] px-4 hover:text-emerald-700 transition-all">Login</Link>
                    <Link href="/signup">
                      <button className="btn-primary px-6 py-2.5 text-xs">Join</button>
                    </Link>
                  </div>
                )}
              </div>

              <div className="md:hidden flex items-center gap-3">
                {user && (
                  <Link href="/contribute" onClick={() => setMenuOpen(false)}>
                    <button className="bg-emerald-700 text-white w-10 h-10 rounded-xl flex items-center justify-center font-semibold hover:bg-emerald-800 transition-all">
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
            <div className="absolute top-20 left-0 w-full max-w-full overflow-x-hidden bg-white border-b border-stone-200 p-8 md:hidden flex flex-col space-y-6 shadow-2xl animate-in fade-in slide-in-from-top-4 z-[55]">
              {navLinks.map((link) => (
                <Link 
                  key={link.name} 
                  href={link.href} 
                  onClick={() => setMenuOpen(false)} 
                  className="text-[10px] font-semibold text-stone-900 uppercase tracking-[0.3em] break-words"
                >
                  {link.name}
                </Link>
              ))}
              
              {user ? (
                <div className="pt-6 flex flex-col space-y-6 border-t border-stone-100">
                  <Link 
                    href="/profile" 
                    onClick={() => setMenuOpen(false)} 
                    className="text-[10px] font-semibold text-emerald-800 uppercase tracking-[0.3em]"
                  >
                    View Profile
                  </Link>
                  <button 
                    onClick={handleSignOut} 
                    className="text-left text-[10px] font-semibold text-red-500 uppercase tracking-[0.3em]"
                  >
                    Logout
                  </button>
                </div>
              ) : (
                <div className="pt-6 flex flex-col space-y-6 border-t border-stone-100">
                  <Link href="/login" onClick={() => setMenuOpen(false)} className="text-[10px] font-semibold text-stone-900 uppercase tracking-[0.3em]">Login</Link>
                  <Link href="/signup" onClick={() => setMenuOpen(false)} className="text-[10px] font-semibold text-emerald-700 uppercase tracking-[0.3em]">Join Archive</Link>
                </div>
              )}
            </div>
          )}
        </div>
      </header>
    </>
  )
}
