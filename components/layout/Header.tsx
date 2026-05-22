'use client'

import Image from 'next/image'
import Link from 'next/link'
import { useAuth } from '@/lib/contexts/AuthContext'
import { useState } from 'react'

function Logo() {
  return (
    <div className="flex items-center">
      <div className="flex-shrink-0 w-48 h-28 relative">
        <Image
          src="/logo.png"
          alt="Kamusi Yetu logo"
          fill
          className="object-contain"
          sizes="192px"
        />
      </div>
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
      <header className="bg-[#D4A373]/80 sticky top-0 z-50 backdrop-blur-sm h-20 flex items-center shadow-soft">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
          <div className="flex items-center justify-between">
            <Logo />
            <div className="w-24 h-8 bg-neutral-200 animate-pulse rounded-lg"></div>
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
      {/* Mobile Menu Drawer - Full Screen Overlay */}
      {menuOpen && (
        <div 
          className="fixed inset-0 z-40 md:hidden bg-black/40 backdrop-blur-sm transition-opacity duration-300"
          onClick={handleBackgroundClick}
        />
      )}
      
      {/* Mobile Navigation Drawer */}
      {menuOpen && (
        <div className="fixed top-0 left-0 bottom-0 w-full max-w-sm bg-heritage-dark z-[60] md:hidden flex flex-col shadow-strong overflow-y-auto transform transition-transform duration-300 ease-in-out">
          {/* Close Button */}
          <div className="sticky top-0 flex justify-end p-4 bg-heritage-dark border-b border-heritage-darker shrink-0">
            <button 
              onClick={() => setMenuOpen(false)}
              className="text-white p-2 hover:bg-heritage-darker rounded-lg transition-colors"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          {/* Menu Content - Scrollable */}
          <div className="flex-1 overflow-y-auto p-6 space-y-6">
            <nav className="space-y-4">
              {navLinks.map((link) => (
                <Link 
                  key={link.name} 
                  href={link.href} 
                  onClick={() => setMenuOpen(false)} 
                  className="block text-sm font-semibold text-white uppercase tracking-[0.25em] hover:text-accent-300 transition-colors"
                >
                  {link.name}
                </Link>
              ))}
            </nav>
            
            <div className="pt-6 border-t border-heritage-darker">
              {user ? (
                <div className="space-y-4">
                  <Link 
                    href="/profile" 
                    onClick={() => setMenuOpen(false)} 
                    className="block text-sm font-semibold text-accent-300 uppercase tracking-[0.25em] hover:text-white transition-colors"
                  >
                    View Profile
                  </Link>
                  <button 
                    onClick={handleSignOut} 
                    className="block w-full text-left text-sm font-semibold text-red-300 uppercase tracking-[0.25em] hover:text-red-200 transition-colors"
                  >
                    Logout
                  </button>
                </div>
              ) : (
                <div className="space-y-4">
                  <Link href="/login" onClick={() => setMenuOpen(false)} className="block text-sm font-semibold text-white uppercase tracking-[0.25em] hover:text-accent-300 transition-colors">Login</Link>
                  <Link href="/signup" onClick={() => setMenuOpen(false)} className="block text-sm font-semibold text-accent-300 uppercase tracking-[0.25em] hover:text-white transition-colors">Join Archive</Link>
                </div>
              )}
            </div>
          </div>
        </div>
      )}
      <header className="sticky top-0 z-50 backdrop-blur-sm bg-[#D4A373]/80 flex items-center py-1 shadow-soft">
        <div className="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8 w-full">
          <div className="flex items-center justify-between gap-2">
            <Link href="/" onClick={() => setMenuOpen(false)} className="-ml-2 sm:ml-0">
              <Logo />
            </Link>

            <nav className="hidden md:flex items-center space-x-8">
              {navLinks.map((link) => (
                <Link 
                  key={link.name} 
                  href={link.href} 
                  className="text-sm font-semibold text-heritage-dark hover:text-white uppercase tracking-[0.25em] transition-all duration-200"
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
                      <button className="bg-accent-300 text-heritage-dark px-6 py-2.5 rounded-lg font-semibold text-sm uppercase tracking-[0.2em] hover:bg-accent-400 transition-all shadow-soft">
                        + Add Word
                      </button>
                    </Link>
                    <Link href="/profile" className="text-sm font-semibold text-heritage-dark uppercase tracking-[0.2em] border-b-2 border-transparent hover:text-white hover:border-white transition-all">
                      Profile
                    </Link>
                    <button onClick={() => signOut()} className="text-sm font-semibold text-heritage-dark uppercase tracking-[0.2em] hover:text-white transition-all">
                      Logout
                    </button>
                  </>
                ) : (
                  <div className="flex items-center gap-3">
                    <Link href="/login" className="text-heritage-dark font-semibold text-sm uppercase tracking-[0.2em] px-4 hover:text-white transition-all">Login</Link>
                    <Link href="/signup">
                      <button className="bg-accent-300 text-heritage-dark px-6 py-2.5 rounded-lg font-semibold text-sm uppercase tracking-[0.2em] hover:bg-accent-400 transition-all shadow-soft">Join</button>
                    </Link>
                  </div>
                )}
              </div>

              <div className="md:hidden flex items-center gap-3">
                {user && (
                  <Link href="/contribute" onClick={() => setMenuOpen(false)}>
                    <button className="bg-accent-300 text-heritage-dark w-10 h-10 rounded-lg flex items-center justify-center font-semibold hover:bg-accent-400 transition-all shadow-soft">
                      +
                    </button>
                  </Link>
                )}
                <button 
                  onClick={() => setMenuOpen(!menuOpen)} 
                  className="text-heritage-dark p-2 bg-white/50 rounded-lg border border-heritage-dark/20 z-[70]"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d={menuOpen ? "M6 18L18 6M6 6l12 12" : "M4 6h16M4 12h16M4 18h16"} />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>
      </header>
    </>
  )
}
