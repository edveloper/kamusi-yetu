// The visitor's choice about analytics cookies, kept in their own browser.
//
// Google Analytics is not loaded at all until someone says yes. This is the
// stricter of GA's two consent setups: nothing is sent to Google, not even a
// cookieless ping, before agreement.

export type AnalyticsChoice = 'granted' | 'denied'

/** Measurement IDs are public; the env var only exists to override it. */
export const GA_ID = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID || 'G-W2FP9YBNP6'

/**
 * GA honours this window flag, so a "no" after a "yes" in the same visit stops
 * collection at once, even though the loaded script stays in memory.
 */
function setGaDisabled(disabled: boolean) {
  ;(window as unknown as Record<string, boolean>)[`ga-disable-${GA_ID}`] = disabled
}

const STORAGE_KEY = 'lk-analytics-consent'
const CHANGE_EVENT = 'lk-analytics-consent-change'

/** Bump when what analytics collects changes, so everyone is asked again. */
const CHOICE_VERSION = 1

type Stored = { choice: AnalyticsChoice; version: number; decidedAt: string }

export function readAnalyticsChoice(): AnalyticsChoice | null {
  if (typeof window === 'undefined') return null
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw) as Stored
    if (parsed.version !== CHOICE_VERSION) return null
    return parsed.choice === 'granted' || parsed.choice === 'denied' ? parsed.choice : null
  } catch {
    return null
  }
}

export function saveAnalyticsChoice(choice: AnalyticsChoice) {
  const value: Stored = { choice, version: CHOICE_VERSION, decidedAt: new Date().toISOString() }
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(value))
  } catch {
    // Private browsing can refuse storage. The choice still applies this visit.
  }
  setGaDisabled(choice !== 'granted')
  window.dispatchEvent(new CustomEvent(CHANGE_EVENT, { detail: choice }))
}

/** Forget the choice so the banner asks again. */
export function resetAnalyticsChoice() {
  try {
    window.localStorage.removeItem(STORAGE_KEY)
  } catch {
    // Nothing stored to remove.
  }
  setGaDisabled(true)
  window.dispatchEvent(new CustomEvent(CHANGE_EVENT, { detail: null }))
}

/**
 * For useSyncExternalStore. Also listens to `storage`, so a choice made in
 * one tab applies in the others.
 */
export function subscribeAnalyticsChoice(onChange: () => void) {
  window.addEventListener(CHANGE_EVENT, onChange)
  window.addEventListener('storage', onChange)
  return () => {
    window.removeEventListener(CHANGE_EVENT, onChange)
    window.removeEventListener('storage', onChange)
  }
}

/**
 * What the server renders, before the browser can be asked. Neither the
 * banner nor analytics should appear in server HTML, so this is its own value.
 */
export const CHOICE_UNKNOWN_ON_SERVER = 'unknown' as const
export type ChoiceSnapshot = AnalyticsChoice | null | typeof CHOICE_UNKNOWN_ON_SERVER
export const getServerChoiceSnapshot = (): ChoiceSnapshot => CHOICE_UNKNOWN_ON_SERVER
