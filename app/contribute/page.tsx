'use client'

import { Suspense, useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { getLanguages } from '@/lib/api/languages'
import { createEntryFromDraft, getMyLanguageIds, rememberLanguage } from '@/lib/api/entry-editor'
import { emptyDraft, emptyExample, type EntryDraft } from '@/lib/entry-draft'
import { groupLanguages } from '@/lib/constants/languageGroups'
import { supabase } from '@/lib/supabase'
import EntryForm from '@/components/entry/EntryForm'
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'
import Dropdown from '@/components/ui/Dropdown'

type Language = { id: string; name: string; code?: string | null }

// The queue at /contribute/gaps is the front door. This is the other door, for
// a word nobody thought to ask about.
//
// It opens on the language from the person's profile, so nobody chooses it
// every time. Someone who speaks several gets one button per language; any
// other language they add to is remembered on their profile.

function AddWord() {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const [languages, setLanguages] = useState<Language[]>([])
  const [myLanguageIds, setMyLanguageIds] = useState<string[]>([])
  const [languageId, setLanguageId] = useState('')
  const [draft, setDraft] = useState<EntryDraft>(() => emptyDraft(false))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [duplicate, setDuplicate] = useState(false)
  const [saved, setSaved] = useState<{ id: string; headword: string } | null>(null)

  const language = useMemo(() => languages.find((l) => l.id === languageId) ?? null, [languages, languageId])
  const code = String(language?.code ?? '').toLowerCase()
  const mine = useMemo(
    () => myLanguageIds.map((id) => languages.find((l) => l.id === id)).filter((l): l is Language => !!l),
    [myLanguageIds, languages]
  )

  useEffect(() => {
    if (!authLoading && !user) router.push('/login?next=/contribute')
  }, [user, authLoading, router])

  useEffect(() => {
    if (!user) return
    let cancelled = false
    ;(async () => {
      try {
        const [list, ids] = await Promise.all([getLanguages(), getMyLanguageIds(user.id)])
        if (cancelled) return
        const active = (list ?? []) as Language[]
        setLanguages(active)
        setMyLanguageIds(ids)

        // A link that names a language wins; otherwise the first on the profile.
        const wanted = String(searchParams.get('lang') ?? '').toLowerCase()
        const fromLink = wanted ? active.find((l) => String(l.code ?? '').toLowerCase() === wanted) : undefined
        const fromProfile = ids.map((id) => active.find((l) => l.id === id)).find(Boolean)
        setLanguageId((fromLink ?? fromProfile)?.id ?? '')

        if (searchParams.get('type') === 'phrase') setDraft({ ...emptyDraft(true), examples: [emptyExample()] })
      } catch {
        if (!cancelled) setError('Could not load the language list.')
      }
    })()
    return () => {
      cancelled = true
    }
  }, [user, searchParams])

  // A phrase always needs an example, so offer the first box straight away.
  const onDraftChange = (next: EntryDraft) => {
    if (next.isPhrase && !draft.isPhrase && next.examples.length === 0) next = { ...next, examples: [emptyExample()] }
    setDraft(next)
  }

  // Warn before someone types out a word that is already recorded.
  useEffect(() => {
    const word = draft.headword.trim()
    if (word.length < 2 || !languageId) {
      setDuplicate(false)
      return
    }
    const timer = setTimeout(async () => {
      const { data } = await supabase
        .from('entries')
        .select('id')
        .eq('language_id', languageId)
        .ilike('headword', word.replace(/[\\%_]/g, (c) => `\\${c}`))
        .limit(1)
      setDuplicate(Boolean(data && data.length > 0))
    }, 400)
    return () => clearTimeout(timer)
  }, [draft.headword, languageId])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!user || duplicate) return
    if (!languageId) {
      setError('Choose the language first.')
      return
    }

    setBusy(true)
    setError('')
    try {
      const id = await createEntryFromDraft(draft, languageId, code, user.id)
      if (!myLanguageIds.includes(languageId)) {
        setMyLanguageIds(await rememberLanguage(user.id, languageId).catch(() => myLanguageIds))
      }
      setSaved({ id, headword: draft.headword.trim() })
      window.scrollTo({ top: 0 })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that entry.')
    } finally {
      setBusy(false)
    }
  }

  const reset = () => {
    setSaved(null)
    setDraft(emptyDraft(draft.isPhrase))
  }

  if (authLoading || !user) return null

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-2xl px-4 py-12 sm:px-6 md:py-16">
          <p className="mark label mb-5 text-signal-300">Contribute</p>
          <h1 className="display text-4xl sm:text-5xl">
            {draft.isPhrase ? 'Add a phrase' : 'Add any word'}
            {language ? ` in ${language.name}` : ''}
          </h1>
          <p className="definition mt-6 max-w-lg text-ink-300">
            For something the queue has not asked about. If you would rather be shown what is
            missing,{' '}
            <Link href="/contribute/gaps" className="text-signal-300 underline underline-offset-4">
              start there instead
            </Link>
            .
          </p>
        </div>
      </header>

      <main className="mx-auto max-w-2xl px-4 py-10 sm:px-6">
        {saved ? (
          <div>
            <div className="border-y-2 border-ink-900 py-8">
              <p className="mark label mb-3 text-signal-500">Saved</p>
              <p className="headword text-5xl text-ink-900">{saved.headword}</p>
              <p className="mt-3 text-ink-600">A reviewer checks it before it appears publicly.</p>
            </div>

            <div className="mt-8">
              <RecordEntryAudio
                entryId={saved.id}
                headword={saved.headword}
                languageId={languageId}
                languageCode={code}
                languageName={language?.name ?? 'this language'}
              />
            </div>

            <div className="mt-8 flex flex-wrap gap-3">
              <button onClick={reset} className="btn-primary">
                Add another
              </button>
              <Link href={`/entry/${saved.id}`} className="btn-secondary">
                See the entry
              </Link>
            </div>
          </div>
        ) : (
          <form onSubmit={submit}>
            {(error || duplicate) && (
              <p
                role="alert"
                className="mb-8 border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700"
              >
                {duplicate ? (
                  <>
                    {language?.name} already has an entry for that word. To improve it, open the
                    entry and choose Suggest a Correction.
                  </>
                ) : (
                  error
                )}
              </p>
            )}

            {/* The language: buttons for the ones on the profile, a list for any other. */}
            <fieldset className="mb-8">
              <legend className="label mb-3 text-ink-600">Language</legend>
              {mine.length > 1 && (
                <div className="mb-3 flex flex-wrap gap-2" role="radiogroup">
                  {mine.map((l) => (
                    <button
                      key={l.id}
                      type="button"
                      role="radio"
                      aria-checked={languageId === l.id}
                      onClick={() => setLanguageId(l.id)}
                      className={`border px-4 py-2.5 text-[0.9375rem] font-semibold transition-colors ${
                        languageId === l.id
                          ? 'border-ink-900 bg-ink-900 text-paper'
                          : 'border-ink-300 text-ink-700 hover:border-ink-900'
                      }`}
                    >
                      {l.name}
                    </button>
                  ))}
                </div>
              )}
              <Dropdown
                id="c-language"
                value={languageId}
                onChange={setLanguageId}
                options={groupLanguages(languages).map((group) => ({
                  label: group.label,
                  options: group.languages.map((item) => ({ value: item.id, label: item.name })),
                }))}
                placeholder={mine.length > 1 ? 'Or another language' : 'Choose a language'}
                aria-label="Language"
                searchPlaceholder="Find your language"
              />
              {mine.length === 0 && languageId && (
                <p className="mt-2 text-sm text-ink-600">
                  We will remember this language for next time.
                </p>
              )}
            </fieldset>

            <EntryForm mode="contribute" draft={draft} onChange={onDraftChange} languageName={language?.name} />

            <div className="mt-10 flex flex-wrap items-center gap-4 border-t border-ink-200 pt-8">
              <button type="submit" disabled={busy || duplicate} className="btn-primary">
                {busy ? 'Saving' : 'Save and record it'}
              </button>
              <p className="text-sm text-ink-600">You can record it on the next screen.</p>
            </div>
          </form>
        )}
      </main>
    </div>
  )
}

export default function ContributePage() {
  return (
    <Suspense fallback={null}>
      <AddWord />
    </Suspense>
  )
}
