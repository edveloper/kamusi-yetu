// When does an entry answer what someone typed? Pure, so it can be tested.
//
// The engine fetches rows with a broad "contains these letters" search, which
// is cheap, and then has to throw away the rows that only contain the letters
// inside another word. Before November 2026 it kept them, so Swahili "ya"
// matched the gloss "mbaya" and came back as Dholuo "marach" (bad), and "of"
// matched "mother of …". The translation test (scripts/translation-test.mjs)
// measured that.

/** Lower case, accents and apostrophes gone, punctuation to spaces. */
export function normalizeText(s: string) {
  return s
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/['’]/g, '')
    .replace(/[^a-zA-Z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .toLowerCase()
    .trim()
}

/** A gloss such as "bad; evil, wicked" holds several terms. */
export function splitTerms(value: string) {
  return value
    .split(/[;,/|]/g)
    .map((s) => s.trim())
    .filter((s) => s.length > 0)
}

// "to eat", "a house", "(of a cow) to low": the bare term is what people type.
function bareTerm(term: string) {
  const withoutNotes = term.replace(/\([^)]*\)/g, ' ').replace(/\[[^\]]*\]/g, ' ')
  return normalizeText(withoutNotes).replace(/^(to|a|an|the)\s+/, '')
}

export type TermMatch = 'exact' | 'phrase' | null

/**
 * 'exact': one of the value's terms is what was typed.
 * 'phrase': what was typed is two words or more and appears, whole words
 *   only, inside a term ("how are you" in "how are you today").
 * null: anything else, including the letters turning up inside a longer word.
 */
export function termMatch(value: string | null | undefined, typed: string): TermMatch {
  const q = bareTerm(typed)
  if (!q || !value) return null
  const terms = [value, ...splitTerms(value)].map(bareTerm).filter(Boolean)
  if (terms.includes(q)) return 'exact'
  if (q.includes(' ') && terms.some((t) => ` ${t} `.includes(` ${q} `))) return 'phrase'
  return null
}
