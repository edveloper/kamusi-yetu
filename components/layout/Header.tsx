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

  if (!mounted || loading) {
    return (
      <header className="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <Link href="/" className="flex items-center space-x-2 group">
              <div className="relative w-10 h-10 rounded-full overflow-hidden shadow-lg flex-shrink-0 ring-2 ring-white">
                <div className="absolute inset-0 flex flex-col">
                  <div className="h-[28%] bg-black"></div>
                  <div className="h-[6%] bg-white"></div>
                  <div className="h-[32%] bg-red-600"></div>
                  <div className="h-[6%] bg-white"></div>
                  <div className="h-[28%] bg-green-700"></div>
                </div>
              </div>
              <span className="text-base md:text-xl font-bold text-gray-900 font-logo hidden xs:inline">
                Kamusi Yetu
              </span>
            </Link>
            <div className="w-20 h-8 bg-gray-100 animate-pulse rounded-lg"></div>
          </div>
        </div>
      </header>
    )
  }

  return (
    <header className="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo - CHOOSE YOUR OPTION ABOVE */}
          <Link href="/" className="flex items-center space-x-2 group">
            <div className="relative w-10 h-10 rounded-full overflow-hidden shadow-lg flex-shrink-0 ring-2 ring-white">
              <div className="absolute inset-0 flex flex-col">
                <div className="h-[28%] bg-black"></div>
                <div className="h-[6%] bg-white"></div>
                <div className="h-[32%] bg-red-600"></div>
                <div className="h-[6%] bg-white"></div>
                <div className="h-[28%] bg-green-700"></div>
              </div>
              {/* Shield overlay */}
              <div className="absolute inset-0 flex items-center justify-center">
                <svg viewBox="0 0 24 24" className="w-5 h-5 text-white opacity-40">
                  <path fill="currentColor" d="M12,2L4,8V14L12,22L20,14V8L12,2Z" />
                </svg>
              </div>
            </div>
            <span className="text-base md:text-xl font-bold text-gray-900 group-hover:text-green-700 transition font-logo hidden xs:inline">
              Kamusi Yetu
            </span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <Link href="/explore" className="text-gray-700 hover:text-green-700 transition font-medium">
              Explore
            </Link>
            <Link href="/about" className="text-gray-700 hover:text-green-700 transition font-medium">
              About
            </Link>
          </nav>

          {/* Auth Buttons */}
          <div className="flex items-center gap-2">
            {user ? (
              <>
                {/* Desktop - Full buttons */}
                <div className="hidden md:flex items-center gap-3">
                  <Link href="/contribute">
                    <button className="bg-green-700 text-white px-4 py-2 rounded-lg hover:bg-green-800 transition font-medium text-sm">
                      + Add Word
                    </button>
                  </Link>
                  <Link href="/profile">
                    <button className="text-gray-700 hover:text-green-700 transition font-medium px-4 py-2 text-sm">
                      Profile
                    </button>
                  </Link>
                  <button 
                    onClick={() => signOut()}
                    className="text-gray-700 hover:text-red-600 transition font-medium px-4 py-2 text-sm"
                  >
                    Logout
                  </button>
                </div>

                {/* Mobile - Compact */}
                <div className="md:hidden flex items-center gap-2">
                  <Link href="/contribute">
                    <button className="bg-green-700 text-white p-2 rounded-lg hover:bg-green-800 transition">
                      <span className="text-xl">+</span>
                    </button>
                  </Link>
                  <button 
                    onClick={() => setMenuOpen(!menuOpen)}
                    className="text-gray-700 p-2"
                  >
                    <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                  </button>
                </div>
              </>
            ) : (
              <>
                {/* FIXED: Show both Login and Sign Up */}
                <Link href="/login">
                  <button className="text-gray-700 hover:text-green-700 transition font-medium px-3 py-2 text-sm whitespace-nowrap">
                    Login
                  </button>
                </Link>
                <Link href="/signup">
                  <button className="bg-green-700 text-white px-3 py-2 md:px-4 md:py-2 rounded-lg hover:bg-green-800 transition font-medium text-sm whitespace-nowrap">
                    Sign Up
                  </button>
                </Link>
              </>
            )}
          </div>
        </div>

        {/* Mobile Menu Dropdown */}
        {menuOpen && user && (
          <div className="md:hidden border-t border-gray-200 py-3 space-y-2">
            <Link href="/explore" onClick={() => setMenuOpen(false)}>
              <div className="block px-4 py-2 text-gray-700 hover:bg-gray-50 rounded">
                Explore
              </div>
            </Link>
            <Link href="/profile" onClick={() => setMenuOpen(false)}>
              <div className="block px-4 py-2 text-gray-700 hover:bg-gray-50 rounded">
                Profile
              </div>
            </Link>
            <Link href="/about" onClick={() => setMenuOpen(false)}>
              <div className="block px-4 py-2 text-gray-700 hover:bg-gray-50 rounded">
                About
              </div>
            </Link>
            <button 
              onClick={() => {
                signOut()
                setMenuOpen(false)
              }}
              className="block w-full text-left px-4 py-2 text-red-600 hover:bg-red-50 rounded"
            >
              Logout
            </button>
          </div>
        )}
      </div>
    </header>
  )
}