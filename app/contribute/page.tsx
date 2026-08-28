'use client'

import { Suspense, useEffect, useMemo, useState } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/lib/contexts/AuthContext'
import { createEntry } from '@/lib/api/entries'
import { getLanguages } from '@/lib/api/languages'
import { validateEntryRules } from '@/lib/validation/entry-rules'
import { groupLanguages } from '@/lib/constants/languageGroups'
import { CATEGORIES } from '@/lib/constants'
import { supabase } from '@/lib/supabase'
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'
import Dropdown from '@/components/ui/Dropdown'

type Language = { id: string; name: string; code?: string | null }

// The queue at /contribute/gaps is the front door. This is the other door, for
// a word nobody thought to ask about.
//
// The old form put thirteen fields on one screen with audio eleventh, which is
// why it produced no recordings. Four fields are required here; everything else
// is behind a disclosure, and the recorder appears the moment there is an entry
// to attach it to.

const PARTS_OF_SPEECH = [
  'Noun', 'Verb', 'Adjective', 'Adverb', 'Pronoun',
  'Preposition', 'Conjunction', 'Interjection',
]

function AddWord() {
  const { user, loading: authLoading } = useAuth()
  const router = useRouter()
  const searchParams = useSearchParams()

  const [languages, setLanguages] = useState<Language[]>([])
  const [isPhrase, setIsPhrase] = useState(false)
  const [showDetail, setShowDetail] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [duplicate, setDuplicate] = useState(false)
  const [saved, setSaved] = useState<{ id: string; headword: string } | null>(null)

  const [form, setForm] = useState({
    language: '',
    word: '',
    definition: '',
    english: '',
    swahili: '',
    usage: '',
    category: '',
    partOfSpeech: '',
    ipa: '',
    dialect: '',
    etymology: '',
  })

  const set = (key: keyof typeof form, value: string) =>
    setForm((prev) => ({ ...prev, [key]: value }))

  const language = useMemo(
    () => languages.find((l) => l.id === form.language) ?? null,
    [languages, form.language]
  )
  const code = String(language?.code ?? '').toLowerCase()

  useEffect(() => {
    if (!authLoading && !user) router.push('/login?next=/contribute')
  }, [user, authLoading, router])

  useEffect(() => {
    getLanguages()
      .then((data) => {
        const list = (data ?? []) as Language[]
        setLanguages(list)
        const wanted = String(searchParams.get('lang') ?? '').toLowerCase()
        if (wanted) {
          const match = list.find((l) => String(l.code ?? '').toLowerCase() === wanted)
          if (match) set('language', match.id)
        }
        if (searchParams.get('type') === 'phrase') setIsPhrase(true)
      })
      .catch(() => setError('Could not load the language list.'))
  }, [searchParams])

  // Warn before someone types out a word that is already recorded.
  useEffect(() => {
    if (form.word.trim().length < 2 || !form.language) {
      setDuplicate(false)
      return
    }
    const timer = setTimeout(async () => {
      const { data } = await supabase
        .from('entries')
        .select('id')
        .eq('language_id', form.language)
        .ilike('headword', form.word.trim())
        .limit(1)
      setDuplicate(Boolean(data && data.length > 0))
    }, 400)
    return () => clearTimeout(timer)
  }, [form.word, form.language])

  const submit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!user || duplicate) return

    setBusy(true)
    setError('')
    try {
      validateEntryRules({
        languageCode: code,
        headword: form.word,
        primaryDefinition: form.definition,
        partOfSpeech: isPhrase ? 'phrase' : form.partOfSpeech.toLowerCase(),
        englishTranslation: form.english,
        swahiliTranslation: form.swahili,
        usageExample: form.usage,
      })
      if (isPhrase && !form.usage.trim()) {
        throw new Error('A phrase needs an example showing how it is used.')
      }

      const entry = await createEntry({
        language_id: form.language,
        headword: form.word.trim(),
        primary_definition: form.definition,
        category: form.category || undefined,
        part_of_speech: isPhrase ? 'phrase' : form.partOfSpeech.toLowerCase() || undefined,
        pronunciation_ipa: form.ipa || undefined,
        dialect_variant: form.dialect || undefined,
        etymology: form.etymology || undefined,
        register: 'both',
        created_by: user.id,
        usage_example: form.usage,
        english_translation: form.english,
        swahili_translation: form.swahili,
      })
      setSaved({ id: entry.id, headword: form.word.trim() })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save that entry.')
    } finally {
      setBusy(false)
    }
  }

  const reset = () => {
    setSaved(null)
    setShowDetail(false)
    setForm((prev) => ({
      ...prev,
      word: '', definition: '', english: '', swahili: '',
      usage: '', ipa: '', dialect: '', etymology: '',
    }))
  }

  if (authLoading || !user) return null

  const field =
    'w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900'

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-2xl px-4 py-12 sm:px-6 md:py-16">
          <p className="mark label mb-5 text-signal-300">Contribute</p>
          <h1 className="display text-4xl sm:text-5xl">
            {isPhrase ? 'Add a phrase' : 'Add any word'}
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
              <p className="mt-3 text-ink-600">
                A reviewer checks it before it appears publicly.
              </p>
            </div>

            <div className="mt-8">
              <RecordEntryAudio
                entryId={saved.id}
                headword={saved.headword}
                languageId={form.language}
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
                {duplicate
                  ? `${language?.name} already has an entry for that word.`
                  : error}
              </p>
            )}

            {/* Word or phrase, up front, because it changes the rules below. */}
            <fieldset className="mb-8">
              <legend className="label mb-3 text-ink-600">What are you adding</legend>
              <div className="flex gap-2" role="radiogroup">
                {[false, true].map((phrase) => (
                  <button
                    key={String(phrase)}
                    type="button"
                    role="radio"
                    aria-checked={isPhrase === phrase}
                    onClick={() => setIsPhrase(phrase)}
                    className={`border px-4 py-2.5 text-[0.9375rem] font-semibold transition-colors ${
                      isPhrase === phrase
                        ? 'border-ink-900 bg-ink-900 text-paper'
                        : 'border-ink-300 text-ink-700 hover:border-ink-900'
                    }`}
                  >
                    {phrase ? 'A phrase' : 'A single word'}
                  </button>
                ))}
              </div>
            </fieldset>

            <div className="space-y-6">
              <div>
                <label htmlFor="c-language" className="label mb-2 block text-ink-600">
                  Language
                </label>
                <Dropdown
                  id="c-language"
                  value={form.language}
                  onChange={(next) => set('language', next)}
                  options={groupLanguages(languages).map((group) => ({
                    label: group.label,
                    options: group.languages.map((item) => ({
                      value: item.id,
                      label: item.name,
                    })),
                  }))}
                  placeholder="Choose a language"
                  aria-label="Language"
                  searchPlaceholder="Find your language"
                />
              </div>

              <div>
                <label htmlFor="c-word" className="label mb-2 block text-ink-600">
                  {isPhrase ? 'The phrase' : 'The word'}
                </label>
                <input
                  id="c-word"
                  required
                  type="text"
                  autoComplete="off"
                  autoCapitalize="none"
                  spellCheck={false}
                  value={form.word}
                  onChange={(e) => set('word', e.target.value)}
                  placeholder={isPhrase ? 'For example, habari yako' : 'For example, amani'}
                  className={`${field} text-xl`}
                />
              </div>

              <div>
                <label htmlFor="c-definition" className="label mb-2 block text-ink-600">
                  What it means
                </label>
                <textarea
                  id="c-definition"
                  required
                  rows={3}
                  value={form.definition}
                  onChange={(e) => set('definition', e.target.value)}
                  placeholder={
                    isPhrase
                      ? 'What it means, when people say it, and the tone it carries'
                      : 'A sentence explaining the meaning, not just the English word'
                  }
                  className={`${field} resize-none`}
                />
              </div>

              <div className="grid gap-4 sm:grid-cols-2">
                <div>
                  <label htmlFor="c-english" className="label mb-2 block text-ink-600">
                    In English
                  </label>
                  <input
                    id="c-english"
                    type="text"
                    value={form.english}
                    onChange={(e) => set('english', e.target.value)}
                    className={field}
                  />
                </div>
                <div>
                  <label htmlFor="c-swahili" className="label mb-2 block text-ink-600">
                    In Kiswahili
                  </label>
                  <input
                    id="c-swahili"
                    type="text"
                    value={form.swahili}
                    onChange={(e) => set('swahili', e.target.value)}
                    className={field}
                  />
                </div>
              </div>
              <p className="text-sm text-ink-600">
                One of these two is required. It is what connects your entry to the other
                languages in the corpus.
              </p>

              <div>
                <label htmlFor="c-usage" className="label mb-2 block text-ink-600">
                  Used in a sentence {isPhrase ? '' : '(optional)'}
                </label>
                <textarea
                  id="c-usage"
                  rows={2}
                  required={isPhrase}
                  value={form.usage}
                  onChange={(e) => set('usage', e.target.value)}
                  placeholder="Show it being used the way someone would actually say it"
                  className={`${field} resize-none`}
                />
              </div>
            </div>

            {/* Everything a linguist wants and a first-time contributor does not. */}
            <div className="mt-8 border-t border-ink-200 pt-6">
              <button
                type="button"
                onClick={() => setShowDetail((open) => !open)}
                aria-expanded={showDetail}
                className="text-[0.9375rem] font-semibold text-ink-700 underline underline-offset-4 hover:text-ink-900"
              >
                {showDetail ? 'Hide extra detail' : 'Add extra detail'}
              </button>

              {showDetail && (
                <div className="mt-6 space-y-6">
                  <div className="grid gap-4 sm:grid-cols-2">
                    <div>
                      <label htmlFor="c-pos" className="label mb-2 block text-ink-600">
                        Part of speech
                      </label>
                      <Dropdown
                        id="c-pos"
                        value={form.partOfSpeech}
                        onChange={(next) => set('partOfSpeech', next)}
                        options={[
                          { value: '', label: 'Not sure' },
                          ...PARTS_OF_SPEECH.map((part) => ({ value: part, label: part })),
                        ]}
                        placeholder="Not sure"
                        searchable={false}
                        disabled={isPhrase}
                        aria-label="Part of speech"
                      />
                    </div>
                    <div>
                      <label htmlFor="c-category" className="label mb-2 block text-ink-600">
                        Topic
                      </label>
                      <Dropdown
                        id="c-category"
                        value={form.category}
                        onChange={(next) => set('category', next)}
                        options={[
                          { value: '', label: 'Not sure' },
                          ...CATEGORIES.map((category) => ({
                            value: category.id,
                            label: category.name,
                          })),
                        ]}
                        placeholder="Not sure"
                        aria-label="Topic"
                        searchPlaceholder="Find a topic"
                      />
                    </div>
                  </div>

                  <div className="grid gap-4 sm:grid-cols-2">
                    <div>
                      <label htmlFor="c-ipa" className="label mb-2 block text-ink-600">
                        Pronunciation in IPA
                      </label>
                      <input
                        id="c-ipa"
                        type="text"
                        value={form.ipa}
                        onChange={(e) => set('ipa', e.target.value)}
                        placeholder="/a.ma.ni/"
                        className={`${field} font-mono`}
                      />
                    </div>
                    <div>
                      <label htmlFor="c-dialect" className="label mb-2 block text-ink-600">
                        Dialect or region
                      </label>
                      <input
                        id="c-dialect"
                        type="text"
                        value={form.dialect}
                        onChange={(e) => set('dialect', e.target.value)}
                        placeholder="Where this form is used"
                        className={field}
                      />
                    </div>
                  </div>

                  <div>
                    <label htmlFor="c-etymology" className="label mb-2 block text-ink-600">
                      Where the word comes from
                    </label>
                    <textarea
                      id="c-etymology"
                      rows={2}
                      value={form.etymology}
                      onChange={(e) => set('etymology', e.target.value)}
                      placeholder="A root form, a borrowing, or a story attached to it"
                      className={`${field} resize-none`}
                    />
                  </div>
                </div>
              )}
            </div>

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
