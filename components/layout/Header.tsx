'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import { useAuth } from '@/lib/contexts/AuthContext'

/**
 * Four items, not nine.
 *
 * The old navigation was organised around the product's internals — Explore,
 * Translate, Trending, About, Team, plus Guidelines and Moderators in the
 * footer nav. Four of those routes were different doors onto one intent (find a
 * word) and two were relevant to a handful of people. This is organised around
 * what someone came to do.
 */
const NAV = [
  { name: 'Browse', href: '/explore' },
  { name: 'Translate', href: '/translate' },
  { name: 'Contribute', href: '/contribute/gaps' },
  { name: 'Coverage', href: '/trending' },
]

/** Typographic wordmark. Replaces a 388KB PNG of the previous brand. */
function Wordmark({ onDark = false }: { onDark?: boolean }) {
  return (
    <span className="font-logo text-[1.35rem] leading-none sm:text-[1.5rem]">
      <span className={onDark ? 'text-paper' : 'text-ink-900'}>Lugha</span>
      <span className="text-signal-500">Konnect</span>
    </span>
  )
}

export default function Header() {
  const { user, signOut, loading } = useAuth()
  const [menuOpen, setMenuOpen] = useState(false)
  const pathname = usePathname()

  useEffect(() => {
    setMenuOpen(false)
  }, [pathname])

  useEffect(() => {
    document.body.style.overflow = menuOpen ? 'hidden' : ''
    return () => {
      document.body.style.overflow = ''
    }
  }, [menuOpen])

  const isActive = (href: string) => pathname === href || pathname.startsWith(`${href}/`)

  return (
    <>
      <header className="sticky top-0 z-50 border-b border-ink-200 bg-paper/90 backdrop-blur-sm">
        <div className="mx-auto flex h-16 max-w-6xl items-center justify-between gap-4 px-4 sm:px-6">
          <Link href="/" aria-label="LughaKonnect home" className="shrink-0">
            <Wordmark />
          </Link>

          <nav aria-label="Main" className="hidden md:block">
            <ul className="flex items-center gap-7">
              {NAV.map((item) => (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    aria-current={isActive(item.href) ? 'page' : undefined}
                    className={`text-[0.9375rem] font-semibold transition-colors ${
                      isActive(item.href)
                        ? 'text-signal-500'
                        : 'text-ink-700 hover:text-ink-900'
                    }`}
                  >
                    {item.name}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          <div className="flex items-center gap-3">
            {!loading &&
              (user ? (
                <div className="hidden items-center gap-3 md:flex">
                  <Link href="/profile" className="text-[0.9375rem] font-semibold text-ink-700 hover:text-ink-900">
                    Your work
                  </Link>
                  <button
                    onClick={() => signOut()}
                    className="text-[0.9375rem] font-semibold text-ink-500 hover:text-ink-900"
                  >
                    Sign out
                  </button>
                </div>
              ) : (
                <Link href="/login" className="hidden btn-secondary py-2 text-sm md:inline-flex">
                  Sign in
                </Link>
              ))}

            <button
              type="button"
              onClick={() => setMenuOpen((open) => !open)}
              aria-expanded={menuOpen}
              aria-controls="mobile-nav"
              aria-label={menuOpen ? 'Close menu' : 'Open menu'}
              className="grid h-10 w-10 place-items-center rounded-md border border-ink-200 text-ink-900 md:hidden"
            >
              <svg width="18" height="14" viewBox="0 0 18 14" aria-hidden="true">
                {menuOpen ? (
                  <path
                    d="M1 1l16 12M17 1L1 13"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                  />
                ) : (
                  <path
                    d="M0 1h18M0 7h18M0 13h18"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                  />
                )}
              </svg>
            </button>
          </div>
        </div>
      </header>

      {menuOpen && (
        <div
          id="mobile-nav"
          className="fixed inset-x-0 bottom-0 top-16 z-40 overflow-y-auto bg-ink-900 px-6 py-8 md:hidden"
        >
          <ul className="space-y-1">
            {NAV.map((item) => (
              <li key={item.href}>
                <Link
                  href={item.href}
                  className="display block py-3 text-3xl text-paper hover:text-sand-300"
                >
                  {item.name}
                </Link>
              </li>
            ))}
          </ul>

          <div className="mt-8 space-y-1 border-t border-ink-800 pt-6">
            {user ? (
              <>
                <Link href="/profile" className="block py-2 text-lg font-semibold text-paper">
                  Your work
                </Link>
                <button
                  onClick={() => signOut()}
                  className="block py-2 text-lg font-semibold text-ink-300"
                >
                  Sign out
                </button>
              </>
            ) : (
              <Link href="/login" className="btn-on-dark mt-2 w-full">
                Sign in
              </Link>
            )}
          </div>

          <ul className="mt-8 space-y-2 border-t border-ink-800 pt-6">
            {[
              { name: 'About', href: '/about' },
              { name: 'Method', href: '/guidelines' },
              { name: 'Contact', href: '/contact' },
            ].map((item) => (
              <li key={item.href}>
                <Link href={item.href} className="label block py-1 text-ink-300">
                  {item.name}
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}
    </>
  )
}
