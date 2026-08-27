'use client'

import { Suspense, useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
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
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'

type Language = { id: string; name: string; code?: string | null }
type Saved = { id: string; headword: string; gloss: string }

/**
 * Contribute.
 *
 * A blank thirteen-field form asks someone to think of a word. This shows a
 * meaning their language is missing and asks what they call it, which is how
 * vocabulary is actually elicited in the field.
 *
 * The important change is what happens after saving. The recorder appears for
 * the word just added, while the person is still here and still thinking about
 * it. Asking them to come back to an entry page later is how a corpus ends up
 * with thousands of words and no audio.
 */
function ContributeGaps() {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

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
  const [saved, setSaved] = useState<Saved[]>([])
  const [justSaved, setJustSaved] = useState<Saved | null>(null)

  useEffect(() => {
    if (!authLoading && !user) router.push('/login?next=/contribute/gaps')
  }, [user, authLoading, router])

  useEffect(() => {
    getLanguages()
      .then((data) => {
        const list = (data ?? []) as Language[]
        setLanguages(list)
        const wanted = String(searchParams.get('lang') ?? '').toLowerCase()
        if (wanted) {
          const match = list.find((l) => String(l.code ?? '').toLowerCase() === wanted)
          if (match) setLanguageId(match.id)
        }
      })
      .catch(() => setError('Could not load the language list.'))
  }, [searchParams])

  const loadGaps = useCallback(async (id: string) => {
    if (!id) return
    setLoadingGaps(true)
    setError('')
    try {
      const [nextGaps, nextCoverage] = await Promise.all([
        getConceptGaps(id, 30),
        getCoverageForLanguage(id),
      ])
      setGaps(nextGaps)
      setCoverage(nextCoverage)
      setIndex(0)
      setWord('')
      setNote('')
      setJustSaved(null)
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
    setJustSaved(null)
    setIndex((prev) => prev + 1)
  }

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!current || !user || !languageId) return

    setBusy(true)
    setError('')
    try {
      const created = await submitConceptEntry({
        conceptId: current.concept_id,
        languageId,
        headword: word,
        userId: user.id,
        glossEn: current.gloss_en,
        glossSw: current.gloss_sw,
        domain: current.domain,
        note,
      })
      const record = {
        id: created.id,
        headword: word.trim(),
        gloss: current.gloss_en || current.gloss_sw || '',
      }
      setSaved((prev) => [record, ...prev])
      setJustSaved(record)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that word.')
    } finally {
      setBusy(false)
    }
  }

  if (authLoading || !user) return null

  const remaining = coverage ? coverage.concepts_total - coverage.concepts_covered : null

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-12 sm:px-6 md:py-16">
          <p className="mark label mb-5 text-signal-300">Contribute</p>
          <h1 className="display text-4xl sm:text-5xl md:text-6xl">Add a word</h1>
          <p className="definition mt-6 max-w-xl text-ink-300">
            Pick your language and we will show you meanings it is missing, one at a time.
          </p>

          {saved.length > 0 && (
            <p className="label mt-8 text-sand-300">
              {saved.length} {saved.length === 1 ? 'word' : 'words'} added this session
            </p>
          )}
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-10 sm:px-6">
        <div className="mb-10">
          <label htmlFor="gap-language" className="label mb-2 block text-ink-600">
            Your language
          </label>
          <select
            id="gap-language"
            value={languageId}
            onChange={(event) => setLanguageId(event.target.value)}
            className="w-full border border-ink-300 bg-card px-4 py-3.5 text-lg text-ink-900 outline-none focus:border-ink-900"
          >
            <option value="">Choose a language</option>
            {groupLanguages(languages).map((group) => (
              <optgroup key={group.key} label={group.label}>
                {group.languages.map((item) => (
                  <option key={item.id} value={item.id}>
                    {item.name}
                  </option>
                ))}
              </optgroup>
            ))}
          </select>

          {coverage && (
            <div className="mt-4">
              <div className="flex h-1.5 w-full bg-ink-200">
                <div
                  key={coverage.language_id}
                  className="bar-fill h-full bg-signal-500"
                  style={{ width: `${Math.min(100, Math.max(1, coverage.percent_covered))}%` }}
                />
              </div>
              <p className="mt-2.5 text-sm text-ink-600">
                <strong className="text-ink-900">{language?.name}</strong> has{' '}
                {coverage.concepts_covered} of {coverage.concepts_total} core meanings.{' '}
                {remaining} still to go.
              </p>
            </div>
          )}
        </div>

        {error && (
          <p
            role="alert"
            className="mb-8 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
          >
            {error}
          </p>
        )}

        {!languageId && (
          <p className="text-ink-600">Choose a language to see what it is missing.</p>
        )}

        {languageId && loadingGaps && <p className="text-ink-600">Finding gaps.</p>}

        {current && !justSaved && (
          <form onSubmit={handleSubmit}>
            <div className="mb-2 flex items-baseline justify-between">
              <p className="label text-ink-500">
                {index + 1} of {gaps.length}
              </p>
              {current.domain && <p className="label text-signal-500">{current.domain}</p>}
            </div>

            <div key={current.concept_id} className="land border-y-2 border-ink-900 py-8">
              <p className="headword text-5xl text-ink-900 sm:text-6xl">
                {current.gloss_en || current.gloss_sw}
              </p>
              {current.gloss_en && current.gloss_sw && (
                <p className="mt-3 text-lg text-ink-600">
                  Kiswahili <strong className="text-ink-900">{current.gloss_sw}</strong>
                </p>
              )}
            </div>

            <label htmlFor="gap-word" className="label mb-2 mt-8 block text-ink-600">
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
              placeholder="Type the word"
              className="w-full border-2 border-ink-300 bg-card px-5 py-4 text-2xl text-ink-900 outline-none placeholder:text-ink-400 focus:border-signal-500"
            />

            <label htmlFor="gap-note" className="label mb-2 mt-6 block text-ink-600">
              Anything worth knowing
            </label>
            <input
              id="gap-note"
              type="text"
              value={note}
              onChange={(event) => setNote(event.target.value)}
              placeholder="When it is used, a shade of meaning, a dialect note"
              className="w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900"
            />

            <div className="mt-8 flex flex-wrap items-center gap-4">
              <button type="submit" disabled={busy} className="btn-primary">
                {busy ? 'Saving' : 'Save and record it'}
              </button>
              <button
                type="button"
                onClick={advance}
                disabled={busy}
                className="text-[0.9375rem] font-semibold text-ink-600 underline underline-offset-4 hover:text-ink-900"
              >
                I do not know this one
              </button>
            </div>
          </form>
        )}

        {justSaved && (
          <div>
            <div className="land border-y-2 border-ink-900 py-8">
              <p className="mark label mb-3 text-signal-500">Saved</p>
              <p className="headword text-5xl text-ink-900 sm:text-6xl">{justSaved.headword}</p>
              {justSaved.gloss && <p className="mt-3 text-lg text-ink-600">{justSaved.gloss}</p>}
            </div>

            <div className="mt-8">
              <RecordEntryAudio
                entryId={justSaved.id}
                headword={justSaved.headword}
                languageId={languageId}
                languageCode={String(language?.code ?? '')}
                languageName={language?.name ?? 'this language'}
              />
            </div>

            <div className="mt-8 flex flex-wrap items-center gap-4">
              <button onClick={advance} className="btn-primary">
                Next word
              </button>
              <p className="text-sm text-ink-600">
                A reviewer checks it before it appears publicly.
              </p>
            </div>
          </div>
        )}

        {languageId && !loadingGaps && !current && !justSaved && (
          <div className="border-y-2 border-ink-900 py-12 text-center">
            <p className="display mb-3 text-3xl text-ink-900">
              {gaps.length === 0 ? 'Nothing missing here' : 'That is the whole queue'}
            </p>
            <p className="mx-auto mb-8 max-w-md text-ink-600">
              {saved.length > 0
                ? `You added ${saved.length} ${saved.length === 1 ? 'word' : 'words'}. Asante sana.`
                : 'Try another language, or add a word the queue did not ask for.'}
            </p>
            <div className="flex flex-wrap justify-center gap-3">
              <button onClick={() => loadGaps(languageId)} className="btn-primary">
                Reload the queue
              </button>
              <Link href="/contribute" className="btn-secondary">
                Add any word
              </Link>
            </div>
          </div>
        )}

        {saved.length > 0 && (
          <div className="mt-14 border-t border-ink-200 pt-8">
            <h2 className="mark label mb-4 text-ink-600">Added this session</h2>
            <ul className="stagger border-t border-ink-200">
              {saved.slice(0, 10).map((item, index) => (
                <li
                  key={item.id}
                  style={{ '--i': index } as React.CSSProperties}
                  className="flex flex-wrap items-baseline justify-between gap-x-6 border-b border-ink-200 py-3"
                >
                  <Link
                    href={`/entry/${item.id}`}
                    className="text-lg font-semibold text-ink-900 hover:text-signal-600"
                  >
                    {item.headword}
                  </Link>
                  <span className="text-sm text-ink-600">{item.gloss}</span>
                </li>
              ))}
            </ul>
          </div>
        )}

        <p className="mt-12 text-sm text-ink-600">
          Looking for something the queue has not asked about?{' '}
          <Link
            href="/contribute"
            className="font-semibold text-signal-600 underline underline-offset-2"
          >
            Add any word
          </Link>
          .
        </p>
      </main>
    </div>
  )
}

export default function ContributeGapsPage() {
  return (
    <Suspense fallback={null}>
      <ContributeGaps />
    </Suspense>
  )
}
