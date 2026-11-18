'use client'

import { Suspense, useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getLanguages } from '@/lib/api/languages'
import { isModerator } from '@/lib/api/users'
import { createEntryFromDraft, getMyLanguageIds, rememberLanguage } from '@/lib/api/entry-editor'
import { getMissingWords, markNotAWord, sentencesWithWord, type MissingWord, type SourceSentence } from '@/lib/api/sources'
import { emptyDraft, emptyExample, type EntryDraft } from '@/lib/entry-draft'
import { groupLanguages } from '@/lib/constants/languageGroups'
import ContributeTabs from '@/components/contribute/ContributeTabs'
import EntryForm from '@/components/entry/EntryForm'
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'
import Dropdown from '@/components/ui/Dropdown'

type Language = { id: string; name: string; code?: string | null }
type Saved = { id: string; headword: string }

// The words speakers actually use most, from thousands of recorded sentences,
// that the dictionary does not have yet (sql/121, scripts/import-sources.mjs).
// One at a time: the word, a few real sentences so its meaning is clear, and
// the full entry form. Adding it ticks it off the list for everyone.

function MostUsedWords() {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const [languages, setLanguages] = useState<Language[]>([])
  const [languageId, setLanguageId] = useState('')
  const [myLanguageIds, setMyLanguageIds] = useState<string[]>([])
  const [reviewer, setReviewer] = useState(false)
  const [words, setWords] = useState<MissingWord[]>([])
  const [index, setIndex] = useState(0)
  const [context, setContext] = useState<SourceSentence[]>([])
  const [draft, setDraft] = useState<EntryDraft>(() => emptyDraft(false))
  const [loading, setLoading] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [justSaved, setJustSaved] = useState<Saved | null>(null)
  const [savedCount, setSavedCount] = useState(0)

  useEffect(() => {
    if (!authLoading && !user) router.push('/login?next=/contribute/words')
  }, [user, authLoading, router])

  useEffect(() => {
    if (!user) return
    Promise.all([getLanguages(), getMyLanguageIds(user.id), isModerator(user.id)])
      .then(([data, ids, canReview]) => {
        const list = (data ?? []) as Language[]
        setLanguages(list)
        setMyLanguageIds(ids)
        setReviewer(canReview)
        const wanted = String(searchParams.get('lang') ?? '').toLowerCase()
        const fromLink = wanted ? list.find((l) => String(l.code ?? '').toLowerCase() === wanted) : undefined
        const fromProfile = ids.map((id) => list.find((l) => l.id === id)).find(Boolean)
        const chosen = fromLink ?? fromProfile
        if (chosen) setLanguageId(chosen.id)
      })
      .catch(() => setError('Could not load the language list.'))
  }, [user, searchParams])

  const load = useCallback(async (id: string, after = 0) => {
    if (!id) return
    setLoading(true)
    setError('')
    try {
      setWords(await getMissingWords(id, 30, after))
      setIndex(0)
      setJustSaved(null)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not load the word list.')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    if (languageId) load(languageId)
  }, [languageId, load])

  const current = words[index] ?? null
  const language = languages.find((l) => l.id === languageId) ?? null

  // Each word starts a fresh draft, and fetches a few real sentences using it.
  useEffect(() => {
    if (!current) return
    setDraft({ ...emptyDraft(false), headword: current.word })
    setContext([])
    let cancelled = false
    sentencesWithWord(languageId, current.word, 3).then((found) => {
      if (!cancelled) setContext(found)
    })
    return () => {
      cancelled = true
    }
  }, [current, languageId])

  const onDraftChange = (next: EntryDraft) => {
    if (next.isPhrase && !draft.isPhrase && next.examples.length === 0) next = { ...next, examples: [emptyExample()] }
    setDraft(next)
  }

  const advance = () => {
    setJustSaved(null)
    if (index + 1 < words.length) setIndex(index + 1)
    else if (words.length > 0) load(languageId, words[words.length - 1].rank)
  }

  const notAWord = async () => {
    if (!current) return
    setBusy(true)
    try {
      await markNotAWord(current.id)
      advance()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not update the list.')
    } finally {
      setBusy(false)
    }
  }

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!current || !user || !languageId) return
    setBusy(true)
    setError('')
    try {
      const id = await createEntryFromDraft(draft, languageId, String(language?.code ?? '').toLowerCase(), user.id, {
        elicited: true,
      })
      if (!myLanguageIds.includes(languageId)) {
        setMyLanguageIds(await rememberLanguage(user.id, languageId).catch(() => myLanguageIds))
      }
      setJustSaved({ id, headword: draft.headword.trim() })
      setSavedCount((n) => n + 1)
      window.scrollTo({ top: 0 })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that word.')
    } finally {
      setBusy(false)
    }
  }

  if (authLoading || !user) return null

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-12 sm:px-6 md:py-16">
          <p className="mark label mb-5 text-signal-300">Contribute</p>
          <h1 className="display text-4xl sm:text-5xl md:text-6xl">Most used words</h1>
          <p className="definition mt-6 max-w-xl text-ink-300">
            Words speakers use again and again in recorded speech, which this dictionary does not
            have yet. The most used come first.
          </p>
          {savedCount > 0 && (
            <p className="label mt-8 text-sand-300">
              {savedCount} {savedCount === 1 ? 'word' : 'words'} added this session
            </p>
          )}
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-10 sm:px-6">
        <ContributeTabs active="/contribute/words" />

        <div className="mb-10">
          <label htmlFor="words-language" className="label mb-2 block text-ink-600">
            Your language
          </label>
          <Dropdown
            id="words-language"
            value={languageId}
            onChange={setLanguageId}
            options={groupLanguages(languages).map((group) => ({
              label: group.label,
              options: group.languages.map((item) => ({ value: item.id, label: item.name })),
            }))}
            placeholder="Choose a language"
            size="lg"
            aria-label="Choose a language"
            searchPlaceholder="Find your language"
          />
        </div>

        {error && (
          <p role="alert" className="mb-8 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700">
            {error}
          </p>
        )}

        {languageId && loading && <p className="text-ink-600">Finding words.</p>}

        {languageId && !loading && !current && !justSaved && (
          <div className="border-y-2 border-ink-900 py-12 text-center">
            <p className="display mb-3 text-3xl text-ink-900">No word list yet</p>
            <p className="mx-auto mb-8 max-w-md text-ink-600">
              Lists come from recorded speech. So far there are lists for Dholuo and Kikuyu, with
              more languages on the way.
            </p>
            <Link href="/contribute/gaps" className="btn-primary">
              Fill missing meanings instead
            </Link>
          </div>
        )}

        {current && !justSaved && (
          <form onSubmit={submit}>
            <div className="mb-2 flex items-baseline justify-between">
              <p className="label text-ink-500">Number {current.rank} on the list</p>
              <p className="label text-signal-500">Heard {current.frequency.toLocaleString()} times</p>
            </div>

            <div key={current.id} className="land border-y-2 border-ink-900 py-8">
              <p className="headword break-words text-5xl text-ink-900 sm:text-6xl">{current.word}</p>
              {context.length > 0 && (
                <ul className="mt-6 space-y-3">
                  {context.map((s) => (
                    <li key={s.id} className="border-l-2 border-ink-200 pl-3">
                      <p className="text-ink-800">{s.text}</p>
                      {(s.translation_en || s.translation_sw) && (
                        <p className="text-sm text-ink-500">{s.translation_en || s.translation_sw}</p>
                      )}
                    </li>
                  ))}
                </ul>
              )}
            </div>

            <div className="mt-8">
              <EntryForm
                mode="contribute"
                draft={draft}
                onChange={onDraftChange}
                languageName={language?.name}
                languageId={languageId}
                definitionPlaceholder="What it means, in your own words. A small word like 'and' or 'of' counts too."
              />
            </div>

            <div className="mt-10 flex flex-wrap items-center gap-4 border-t border-ink-200 pt-8">
              <button type="submit" disabled={busy} className="btn-primary">
                {busy ? 'Saving' : 'Save and record it'}
              </button>
              <button
                type="button"
                onClick={advance}
                disabled={busy}
                className="text-[0.9375rem] font-semibold text-ink-600 underline underline-offset-4 hover:text-ink-900"
              >
                Skip this one
              </button>
              {reviewer && (
                <button
                  type="button"
                  onClick={notAWord}
                  disabled={busy}
                  className="text-[0.9375rem] font-semibold text-ink-500 underline underline-offset-4 hover:text-signal-600"
                >
                  Not a dictionary word
                </button>
              )}
            </div>
          </form>
        )}

        {justSaved && (
          <div>
            <div className="land border-y-2 border-ink-900 py-8">
              <p className="mark label mb-3 text-signal-500">Saved</p>
              <p className="headword text-5xl text-ink-900 sm:text-6xl">{justSaved.headword}</p>
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
              <p className="text-sm text-ink-600">A reviewer checks it before it appears publicly.</p>
            </div>
          </div>
        )}
      </main>
    </div>
  )
}

export default function MostUsedWordsPage() {
  return (
    <Suspense fallback={null}>
      <MostUsedWords />
    </Suspense>
  )
}
