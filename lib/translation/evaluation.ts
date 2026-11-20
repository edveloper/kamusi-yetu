// Scoring for the translation test (scripts/translation-test.mjs). Pure, so it
// can be unit tested.
//
// The test set is a fixed slice of the licensed source sentences (sql/121):
// every sentence whose text_key, an md5 of the lower-cased text, starts with
// HOLD_OUT_PREFIX. That is about 1 in 256, chosen by the text itself, so the
// same sentences are held out on every run and on every machine, and nothing
// has to be stored. Held-out sentences must never become examples or feed any
// sentence memory, or the test would be marking its own homework (sql/122
// keeps them out of the example suggestions).

export const HOLD_OUT_PREFIX = '00'

// Languages with fewer pairs keep back a bigger slice, so their test still has
// a few hundred sentences: text_keys starting 00 up to (share - 1) in hex, out
// of 256. The 00 slice is always part of it. Changing a share changes the test
// set, so scores before and after are no longer comparable.
export const HOLD_OUT_SHARE: Record<string, number> = { dav: 4, kal: 4, bxk: 16, rag: 16, lri: 16 }

export function isHeldOut(textKey: string, code?: string) {
  const share = (code && HOLD_OUT_SHARE[code]) || 1
  return parseInt(textKey.slice(0, 2), 16) < share
}

/** PostgREST condition on text_key for a language's held-out slice, for use inside and=(...). */
export function heldOutFilter(code: string) {
  const share = HOLD_OUT_SHARE[code] || 1
  const prefixes = Array.from({ length: share }, (_, i) => i.toString(16).padStart(2, '0'))
  return `or(${prefixes.map((p) => `text_key.like.${p}*`).join(',')})`
}

/** Lower case, accents kept, punctuation and extra spaces gone. */
export function normaliseForCompare(s: string) {
  return s
    .normalize('NFC')
    .toLowerCase()
    .replace(/[^\p{L}\p{N}'’ ]+/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/** The words of a sentence, in order, as typed (case kept). */
export function words(s: string) {
  return s
    .normalize('NFC')
    .split(/[^\p{L}\p{N}'’]+/u)
    .map((w) => w.replace(/^['’]+|['’]+$/g, ''))
    .filter(Boolean)
}

type NgramStats = { matches: number[]; hyp: number[]; ref: number[] }

const MAX_ORDER = 6
const BETA = 2

function charNgrams(s: string, n: number) {
  const chars = [...normaliseForCompare(s).replace(/ /g, '')]
  const counts = new Map<string, number>()
  for (let i = 0; i + n <= chars.length; i++) {
    const gram = chars.slice(i, i + n).join('')
    counts.set(gram, (counts.get(gram) || 0) + 1)
  }
  return counts
}

export function emptyStats(): NgramStats {
  return { matches: Array(MAX_ORDER).fill(0), hyp: Array(MAX_ORDER).fill(0), ref: Array(MAX_ORDER).fill(0) }
}

/** Adds one hypothesis and reference pair to running corpus statistics. */
export function addPair(stats: NgramStats, hypothesis: string, reference: string) {
  for (let n = 1; n <= MAX_ORDER; n++) {
    const h = charNgrams(hypothesis, n)
    const r = charNgrams(reference, n)
    let matched = 0
    for (const [gram, count] of h) matched += Math.min(count, r.get(gram) || 0)
    stats.matches[n - 1] += matched
    stats.hyp[n - 1] += [...h.values()].reduce((a, b) => a + b, 0)
    stats.ref[n - 1] += [...r.values()].reduce((a, b) => a + b, 0)
  }
  return stats
}

/**
 * Corpus chrF (Popović 2015, the sacreBLEU defaults: character 1 to 6-grams,
 * spaces ignored, recall weighted twice as heavily as precision), 0 to 100.
 * Orders the text is too short to have are left out of the average.
 */
export function chrF(stats: NgramStats) {
  let precision = 0
  let recall = 0
  let orders = 0
  for (let i = 0; i < MAX_ORDER; i++) {
    if (stats.hyp[i] === 0 || stats.ref[i] === 0) continue
    precision += stats.matches[i] / stats.hyp[i]
    recall += stats.matches[i] / stats.ref[i]
    orders++
  }
  if (orders === 0) return 0
  precision /= orders
  recall /= orders
  if (precision + recall === 0) return 0
  const b2 = BETA * BETA
  return (100 * (1 + b2) * precision * recall) / (b2 * precision + recall)
}

export function chrFOf(pairs: Array<[hypothesis: string, reference: string]>) {
  const stats = emptyStats()
  for (const [h, r] of pairs) addPair(stats, h, r)
  return chrF(stats)
}
