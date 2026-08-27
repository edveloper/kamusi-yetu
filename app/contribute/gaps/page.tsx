'use client'

import { useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getLanguages } from '@/lib/api/languages'
import { groupLanguages } from '@/lib/constants/languageGroups'
import {
  getConceptGaps,
  getCoverageForLanguage,
  submitConceptEntry,
  type ConceptGap,
  type LanguageConceptCoverage,
} from '@/lib/api/concepts'

type Language = { id: string; name: string; code?: string | null }

/**
 * Elicitation.
 *
 * A blank thirteen-field form asks a contributor to think of a word. This asks
 * a much easier question: here is a meaning your language is missing — what do
 * you call it? That is how vocabulary is actually collected in the field, it
 * fills gaps in priority order rather than at random, and it produces the
 * aligned, comparable data a translation model needs.
 */
export default function ConceptGapsPage() {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()

  const [languages, setLanguages] = useState<Language[]>([])
  const [languageId, setLanguageId] = useState('')
  const [gaps, setGaps] = useState<ConceptGap[]>([])
  const [coverage, setCoverage] = useState<LanguageConceptCoverage | null>(null)
  const [index, setIndex] = useState(0)
  const [word, setWord] = useState('')
  const [note, setNote] = useState('')
  const [busy, setBusy] = useState(false)
  const [loadingGaps, setLoadingGaps] = useState(false)
  const [error, setError] = useState('')
  const [filled, setFilled] = useState<Array<{ headword: string; gloss: string }>>([])

  useEffect(() => {
    if (!authLoading && !user) router.push('/login')
  }, [user, authLoading, router])

  useEffect(() => {
    getLanguages()
      .then((data) => setLanguages((data ?? []) as Language[]))
      .catch(() => setError('Could not load languages.'))
  }, [])

  const loadGaps = useCallback(async (id: string) => {
    if (!id) return
    setLoadingGaps(true)
    setError('')
    try {
      const [nextGaps, nextCoverage] = await Promise.all([
        getConceptGaps(id, 25),
        getCoverageForLanguage(id),
      ])
      setGaps(nextGaps)
      setCoverage(nextCoverage)
      setIndex(0)
      setWord('')
      setNote('')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not load the queue.')
    } finally {
      setLoadingGaps(false)
    }
  }, [])

  useEffect(() => {
    if (languageId) loadGaps(languageId)
  }, [languageId, loadGaps])

  const current = gaps[index] ?? null
  const language = languages.find((l) => l.id === languageId) ?? null

  const advance = () => {
    setWord('')
    setNote('')
    setIndex((prev) => prev + 1)
  }

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!current || !user || !languageId) return

    setBusy(true)
    setError('')
    try {
      await submitConceptEntry({
        conceptId: current.concept_id,
        languageId,
        headword: word,
        userId: user.id,
        glossEn: current.gloss_en,
        glossSw: current.gloss_sw,
        domain: current.domain,
        note,
      })
      setFilled((prev) => [
        { headword: word.trim(), gloss: current.gloss_en || current.gloss_sw || '' },
        ...prev,
      ])
      advance()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that word.')
    } finally {
      setBusy(false)
    }
  }

  if (authLoading || !user) return null

  return (
    <div className="min-h-screen bg-neutral-100 pb-20">
      <header className="bg-heritage-dark text-white py-16 md:py-20 px-4 sm:px-6">
        <div className="max-w-3xl mx-auto text-center">
          <p className="text-xs uppercase tracking-[0.35em] text-accent-300 mb-4 font-semibold">
            Fill a gap
          </p>
          <h1 className="text-4xl md:text-5xl font-black font-display leading-tight">
            What do you call this?
          </h1>
          <p className="mt-5 text-base text-white/90 max-w-xl mx-auto leading-8">
            These meanings exist in other Kenyan languages but not yet in yours.
            One word at a time is enough.
          </p>
        </div>
      </header>

      <main className="max-w-3xl mx-auto px-4 -mt-8">
        <div className="bg-neutral-50 rounded-[2rem] border border-neutral-200 shadow-soft p-6 md:p-10">
          <div className="mb-8">
            <label
              htmlFor="gap-language"
              className="block text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em] mb-2"
            >
              Your language
            </label>
            <select
              id="gap-language"
              value={languageId}
              onChange={(event) => setLanguageId(event.target.value)}
              className="w-full px-5 py-4 bg-neutral-50 border-2 border-neutral-200 rounded-2xl focus:border-heritage-dark outline-none"
            >
              <option value="">Choose a language…</option>
              {groupLanguages(languages).map((group) => (
                <optgroup key={group.key} label={group.label}>
                  {group.languages.map((item) => (
                    <option key={item.id} value={item.id}>{item.name}</option>
                  ))}
                </optgroup>
              ))}
            </select>

            {coverage && (
              <p className="mt-3 text-sm text-neutral-700">
                <strong>{language?.name}</strong> has {coverage.concepts_covered} of{' '}
                {coverage.concepts_total} core meanings — {coverage.percent_covered}%.
              </p>
            )}
          </div>

          {error && (
            <p role="alert" className="text-sm font-semibold text-red-700 bg-red-50 border border-red-100 rounded-xl px-4 py-3 mb-6">
              {error}
            </p>
          )}

          {!languageId && (
            <p className="text-sm text-neutral-700">
              Choose a language to see what it is missing.
            </p>
          )}

          {languageId && loadingGaps && (
            <p className="text-sm text-neutral-700">Finding gaps…</p>
          )}

          {languageId && !loadingGaps && !current && (
            <div className="text-center py-8">
              <p className="text-lg font-bold text-neutral-900 mb-2">
                {gaps.length === 0
                  ? 'Nothing missing from the current concept set.'
                  : 'That is the whole queue. Asante sana.'}
              </p>
              <p className="text-sm text-neutral-700 mb-6">
                {filled.length > 0
                  ? `You added ${filled.length} ${filled.length === 1 ? 'word' : 'words'} just now.`
                  : 'Try another language, or add a word the queue has not asked for.'}
              </p>
              <div className="flex flex-wrap gap-3 justify-center">
                <button onClick={() => loadGaps(languageId)} className="btn-primary text-xs">
                  Reload the queue
                </button>
                <Link href="/contribute" className="btn-secondary text-xs">
                  Add any word
                </Link>
              </div>
            </div>
          )}

          {current && (
            <form onSubmit={handleSubmit}>
              <div className="flex items-baseline justify-between mb-2">
                <p className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em]">
                  {index + 1} of {gaps.length}
                </p>
                {current.domain && (
                  <p className="text-[10px] font-black text-accent-700 uppercase tracking-[0.22em]">
                    {current.domain}
                  </p>
                )}
              </div>

              <div className="bg-accent-50 border border-accent-200 rounded-2xl p-6 mb-6">
                <p className="text-3xl md:text-4xl font-black font-display text-heritage-dark break-words">
                  {current.gloss_en || current.gloss_sw}
                </p>
                {current.gloss_en && current.gloss_sw && (
                  <p className="mt-2 text-base text-neutral-700">
                    Kiswahili: <strong>{current.gloss_sw}</strong>
                  </p>
                )}
              </div>

              <label
                htmlFor="gap-word"
                className="block text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em] mb-2"
              >
                In {language?.name}
              </label>
              <input
                id="gap-word"
                type="text"
                required
                autoFocus
                autoComplete="off"
                autoCapitalize="none"
                spellCheck={false}
                value={word}
                onChange={(event) => setWord(event.target.value)}
                placeholder="Type the word…"
                className="w-full px-5 py-4 text-lg bg-neutral-50 border-2 border-neutral-200 rounded-2xl focus:border-heritage-dark outline-none"
              />

              <label
                htmlFor="gap-note"
                className="block text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em] mt-5 mb-2"
              >
                Anything worth knowing (optional)
              </label>
              <input
                id="gap-note"
                type="text"
                value={note}
                onChange={(event) => setNote(event.target.value)}
                placeholder="A shade of meaning, when it is used, a dialect note…"
                className="w-full px-5 py-3 bg-neutral-50 border-2 border-neutral-200 rounded-2xl focus:border-heritage-dark outline-none"
              />

              <div className="flex flex-wrap gap-3 mt-7">
                <button type="submit" disabled={busy} className="btn-primary text-xs disabled:opacity-50">
                  {busy ? 'Saving…' : 'Save and next'}
                </button>
                <button
                  type="button"
                  onClick={advance}
                  disabled={busy}
                  className="text-xs font-black uppercase tracking-[0.22em] text-neutral-600 hover:text-accent-700"
                >
                  I don&apos;t know this one
                </button>
              </div>
              <p className="mt-4 text-xs text-neutral-600">
                Your word goes to a moderator before it appears publicly. You can record
                the pronunciation from its entry page once it is approved.
              </p>
            </form>
          )}

          {filled.length > 0 && (
            <div className="mt-10 pt-6 border-t border-neutral-200">
              <p className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.22em] mb-3">
                Added this session
              </p>
              <ul className="space-y-1.5">
                {filled.slice(0, 8).map((item, i) => (
                  <li key={`${item.headword}-${i}`} className="text-sm text-neutral-700">
                    <strong className="text-neutral-900">{item.headword}</strong>
                    {item.gloss ? ` — ${item.gloss}` : ''}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </div>
      </main>
    </div>
  )
}
