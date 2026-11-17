'use client'

import { useSyncExternalStore } from 'react'
import Link from 'next/link'
import {
  getServerChoiceSnapshot,
  readAnalyticsChoice,
  resetAnalyticsChoice,
  saveAnalyticsChoice,
  subscribeAnalyticsChoice,
} from '@/lib/analytics-consent'

// Asks once, remembers the answer, and stays out of the way. Both buttons
// look the same on purpose: saying no should be as easy as saying yes.

const BUTTON =
  'border border-ink-500 px-5 py-2.5 text-sm font-semibold text-paper transition-colors hover:border-paper'

export function CookieBanner() {
  const choice = useSyncExternalStore(
    subscribeAnalyticsChoice,
    readAnalyticsChoice,
    getServerChoiceSnapshot
  )

  // Only an explicit "not decided yet" opens the banner. The server value is
  // 'unknown', so nothing flashes before the browser has been asked.
  if (choice !== null) return null

  return (
    <div
      role="region"
      aria-label="Cookie choice"
      className="fixed inset-x-0 bottom-0 z-50 border-t border-ink-800 bg-ink-900 text-paper shadow-2xl"
    >
      <div className="mx-auto flex max-w-6xl flex-col gap-4 px-4 py-5 sm:px-6 md:flex-row md:items-center md:justify-between">
        <p className="max-w-2xl text-[0.9375rem] leading-relaxed text-ink-300">
          May we use analytics cookies to see which pages help people? They tell us nothing about
          who you are, and the site works the same either way. Read more in our{' '}
          <Link href="/privacy" className="font-semibold text-paper underline underline-offset-2">
            privacy notice
          </Link>
          .
        </p>
        <div className="flex shrink-0 gap-3">
          <button type="button" onClick={() => saveAnalyticsChoice('denied')} className={BUTTON}>
            No Thanks
          </button>
          <button type="button" onClick={() => saveAnalyticsChoice('granted')} className={BUTTON}>
            Allow Analytics
          </button>
        </div>
      </div>
    </div>
  )
}

/** Footer link that reopens the banner so a choice can be changed later. */
export function CookieSettingsButton({ className }: { className?: string }) {
  return (
    <button type="button" onClick={resetAnalyticsChoice} className={className}>
      Cookie Settings
    </button>
  )
}
