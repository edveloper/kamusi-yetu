'use client'

import { useMemo, useState } from 'react'
import Dropdown from '@/components/ui/Dropdown'
import { CATEGORIES } from '@/lib/constants'
import {
  changedColumns,
  emptyExample,
  emptySense,
  MAX_NEW_EXAMPLES,
  MAX_SENSES,
  PARTS_OF_SPEECH,
  REGISTERS,
  type EntryDraft,
  type ExampleDraft,
  type SenseDraft,
} from '@/lib/entry-draft'

// One form for every way an entry is written: adding it, suggesting a
// correction, and reviewing it. The mode only changes what can be edited and
// how much is shown open; the fields and their rules are the same everywhere,
// so a reviewer always sees exactly what a contributor could fill in.

export type EntryFormMode = 'contribute' | 'suggest' | 'review'

type Props = {
  mode: EntryFormMode
  draft: EntryDraft
  onChange: (next: EntryDraft) => void
  /** The entry as it stands, to mark what has changed. */
  original?: EntryDraft
  languageName?: string
  /** Overrides for the gaps queue, which asks for a known meaning. */
  headwordLabel?: string
  definitionLabel?: string
  definitionPlaceholder?: string
}

const FIELD =
  'w-full border border-ink-300 bg-card px-4 py-3 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900'
const LABEL = 'label mb-2 block text-ink-600'

const capitalise = (s: string) => s.charAt(0).toUpperCase() + s.slice(1)

export default function EntryForm({
  mode,
  draft,
  onChange,
  original,
  languageName,
  headwordLabel,
  definitionLabel,
  definitionPlaceholder,
}: Props) {
  const [showDetail, setShowDetail] = useState(mode === 'review')
  const changed = useMemo(
    () => new Set(original ? changedColumns(original, draft).map((c) => c.key) : []),
    [original, draft]
  )

  const set = <K extends keyof EntryDraft>(key: K, value: EntryDraft[K]) => onChange({ ...draft, [key]: value })

  const Changed = ({ field }: { field: string }) =>
    changed.has(field as never) ? (
      <span className="ml-2 bg-signal-50 px-1.5 py-0.5 font-mono text-[10px] font-semibold uppercase tracking-widest text-signal-700">
        Changed
      </span>
    ) : null

  const label = (htmlFor: string, text: string, field?: string) => (
    <label htmlFor={htmlFor} className={LABEL}>
      {text}
      {field && <Changed field={field} />}
    </label>
  )

  const input = (id: string, field: keyof EntryDraft, opts: { placeholder?: string; mono?: boolean; large?: boolean } = {}) => (
    <input
      id={id}
      type="text"
      autoComplete="off"
      spellCheck={false}
      value={draft[field] as string}
      onChange={(e) => set(field, e.target.value as never)}
      placeholder={opts.placeholder}
      className={`${FIELD} ${opts.mono ? 'font-mono' : ''} ${opts.large ? 'text-xl' : ''}`}
    />
  )

  const textarea = (id: string, field: keyof EntryDraft, rows: number, placeholder?: string) => (
    <textarea
      id={id}
      rows={rows}
      value={draft[field] as string}
      onChange={(e) => set(field, e.target.value as never)}
      placeholder={placeholder}
      className={`${FIELD} resize-y`}
    />
  )

  // Existing meanings and examples: a contributor sees them, a reviewer edits them.
  const canEditExisting = mode === 'review'

  const updateSense = (index: number, patch: Partial<SenseDraft>) =>
    set('senses', draft.senses.map((s, i) => (i === index ? { ...s, ...patch } : s)))
  const updateExample = (index: number, patch: Partial<ExampleDraft>) =>
    set('examples', draft.examples.map((e, i) => (i === index ? { ...e, ...patch } : e)))
  const newExamples = draft.examples.filter((e) => !e.id).length

  return (
    <div>
      {/* Word or phrase, up front, because it changes the fields below. */}
      <fieldset className="mb-8">
        <legend className="label mb-3 text-ink-600">
          {mode === 'contribute' ? 'What are you adding' : 'Kind of entry'}
        </legend>
        <div className="flex gap-2" role="radiogroup">
          {[false, true].map((phrase) => (
            <button
              key={String(phrase)}
              type="button"
              role="radio"
              aria-checked={draft.isPhrase === phrase}
              onClick={() => set('isPhrase', phrase)}
              className={`border px-4 py-2.5 text-[0.9375rem] font-semibold transition-colors ${
                draft.isPhrase === phrase
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
          {label('ef-headword', headwordLabel ?? (draft.isPhrase ? 'The phrase' : 'The word'), 'headword')}
          {input('ef-headword', 'headword', {
            large: true,
            placeholder: draft.isPhrase ? 'For example, habari yako' : 'For example, amani',
          })}
        </div>

        <div>
          {label('ef-definition', definitionLabel ?? 'What it means', 'definition')}
          {textarea(
            'ef-definition',
            'definition',
            3,
            definitionPlaceholder ??
              (draft.isPhrase
                ? 'What it means and when people say it'
                : 'A sentence explaining the meaning, not just the English word')
          )}
        </div>

        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            {label('ef-english', 'In English', 'english')}
            {input('ef-english', 'english')}
          </div>
          <div>
            {label('ef-swahili', 'In Kiswahili', 'swahili')}
            {input('ef-swahili', 'swahili')}
          </div>
        </div>
        <p className="text-sm text-ink-600">
          One of these two is required. It is what connects the entry to every other language here.
        </p>

        {draft.isPhrase && (
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              {label('ef-literal', 'Word for word', 'literalMeaning')}
              {input('ef-literal', 'literalMeaning', { placeholder: 'For example, have you woken?' })}
            </div>
            <div>
              {label('ef-reply', 'The usual reply', 'responseText')}
              {input('ef-reply', 'responseText', { placeholder: 'What people say back, if anything' })}
            </div>
          </div>
        )}

        <div>
          {label('ef-usage', 'How it is used', 'usageNote')}
          {textarea(
            'ef-usage',
            'usageNote',
            2,
            'Who says it to whom, when, and anything a learner would get wrong'
          )}
        </div>
      </div>

      {/* ------------------------------------------------------------ examples */}
      <section className="mt-10 border-t border-ink-200 pt-6">
        <h2 className="label mb-1 text-ink-900">
          Examples {draft.isPhrase ? '' : '(optional)'}
        </h2>
        <p className="mb-5 text-sm text-ink-600">
          Real sentences, the way someone would actually say them, each with its meaning.
        </p>

        <ul className="space-y-5">
          {draft.examples.map((example, index) => {
            const locked = !!example.id && !canEditExisting
            return (
              <li key={example.id ?? `new-${index}`} className="border-l-2 border-ink-200 pl-4">
                {locked ? (
                  <div>
                    <p className="text-ink-900">{example.text}</p>
                    <p className="mt-1 text-sm text-ink-600">
                      {[example.english, example.swahili].filter(Boolean).join(' · ')}
                    </p>
                    {example.status === 'pending' && (
                      <p className="label mt-1 text-ink-500">Waiting for review</p>
                    )}
                  </div>
                ) : (
                  <div className="space-y-3">
                    <textarea
                      aria-label={`Example ${index + 1}`}
                      rows={2}
                      value={example.text}
                      onChange={(e) => updateExample(index, { text: e.target.value })}
                      placeholder={`A sentence using it, in ${languageName || 'the language'}`}
                      className={`${FIELD} resize-y`}
                    />
                    <div className="grid gap-3 sm:grid-cols-2">
                      <input
                        aria-label={`Example ${index + 1} in English`}
                        value={example.english}
                        onChange={(e) => updateExample(index, { english: e.target.value })}
                        placeholder="The sentence in English"
                        className={FIELD}
                      />
                      <input
                        aria-label={`Example ${index + 1} in Kiswahili`}
                        value={example.swahili}
                        onChange={(e) => updateExample(index, { swahili: e.target.value })}
                        placeholder="The sentence in Kiswahili"
                        className={FIELD}
                      />
                    </div>
                    <div className="flex items-center gap-4">
                      {example.status === 'pending' && mode === 'review' && (
                        <span className="label text-signal-600">New, approve by saving</span>
                      )}
                      <button
                        type="button"
                        onClick={() => set('examples', draft.examples.filter((_, i) => i !== index))}
                        className="text-sm font-semibold text-ink-600 underline underline-offset-4 hover:text-signal-600"
                      >
                        Remove
                      </button>
                    </div>
                  </div>
                )}
              </li>
            )
          })}
        </ul>

        {newExamples < MAX_NEW_EXAMPLES && (
          <button
            type="button"
            onClick={() => set('examples', [...draft.examples, emptyExample()])}
            className="mt-5 text-[0.9375rem] font-semibold text-ink-700 underline underline-offset-4 hover:text-ink-900"
          >
            {draft.examples.length === 0 ? 'Add an example' : 'Add another example'}
          </button>
        )}
      </section>

      {/* ------------------------------------------------------- more meanings */}
      <section className="mt-10 border-t border-ink-200 pt-6">
        <h2 className="label mb-1 text-ink-900">Other meanings (optional)</h2>
        <p className="mb-5 text-sm text-ink-600">
          If the same word also means something else. A different word that happens to look the
          same belongs in its own entry.
        </p>

        <ol className="space-y-5">
          {draft.senses.map((sense, index) => {
            const locked = !!sense.id && !canEditExisting
            return (
              <li key={sense.id ?? `new-${index}`} className="border-l-2 border-ink-200 pl-4">
                <p className="label mb-2 text-ink-500">Meaning {index + 2}</p>
                {locked ? (
                  <div>
                    <p className="text-ink-900">{sense.definition}</p>
                    <p className="mt-1 text-sm text-ink-600">
                      {[sense.english, sense.swahili].filter(Boolean).join(' · ')}
                    </p>
                    {sense.status === 'pending' && <p className="label mt-1 text-ink-500">Waiting for review</p>}
                  </div>
                ) : (
                  <div className="space-y-3">
                    <textarea
                      aria-label={`Meaning ${index + 2}`}
                      rows={2}
                      value={sense.definition}
                      onChange={(e) => updateSense(index, { definition: e.target.value })}
                      placeholder="What it means in this sense"
                      className={`${FIELD} resize-y`}
                    />
                    <div className="grid gap-3 sm:grid-cols-2">
                      <input
                        aria-label={`Meaning ${index + 2} in English`}
                        value={sense.english}
                        onChange={(e) => updateSense(index, { english: e.target.value })}
                        placeholder="In English"
                        className={FIELD}
                      />
                      <input
                        aria-label={`Meaning ${index + 2} in Kiswahili`}
                        value={sense.swahili}
                        onChange={(e) => updateSense(index, { swahili: e.target.value })}
                        placeholder="In Kiswahili"
                        className={FIELD}
                      />
                    </div>
                    <div className="flex items-center gap-4">
                      {sense.status === 'pending' && mode === 'review' && (
                        <span className="label text-signal-600">New, approve by saving</span>
                      )}
                      <button
                        type="button"
                        onClick={() => set('senses', draft.senses.filter((_, i) => i !== index))}
                        className="text-sm font-semibold text-ink-600 underline underline-offset-4 hover:text-signal-600"
                      >
                        Remove
                      </button>
                    </div>
                  </div>
                )}
              </li>
            )
          })}
        </ol>

        {draft.senses.length < MAX_SENSES && (
          <button
            type="button"
            onClick={() => set('senses', [...draft.senses, emptySense()])}
            className="mt-5 text-[0.9375rem] font-semibold text-ink-700 underline underline-offset-4 hover:text-ink-900"
          >
            Add another meaning
          </button>
        )}
      </section>

      {/* -------------------------------------------------------------- detail */}
      <section className="mt-10 border-t border-ink-200 pt-6">
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
              {!draft.isPhrase && (
                <div>
                  {label('ef-pos', 'Part of speech', 'partOfSpeech')}
                  <Dropdown
                    id="ef-pos"
                    value={draft.partOfSpeech}
                    onChange={(next) => set('partOfSpeech', next)}
                    options={[
                      { value: '', label: 'Not sure' },
                      ...PARTS_OF_SPEECH.map((part) => ({ value: part, label: capitalise(part) })),
                    ]}
                    placeholder="Not sure"
                    searchable={false}
                    aria-label="Part of speech"
                  />
                </div>
              )}
              <div>
                {label('ef-category', 'Topic', 'category')}
                <Dropdown
                  id="ef-category"
                  value={draft.category}
                  onChange={(next) => set('category', next)}
                  options={[
                    { value: '', label: 'Not sure' },
                    ...CATEGORIES.map((category) => ({ value: category.id, label: category.name })),
                  ]}
                  placeholder="Not sure"
                  aria-label="Topic"
                  searchPlaceholder="Find a topic"
                />
              </div>
              <div>
                {label('ef-register', 'Register', 'register')}
                <Dropdown
                  id="ef-register"
                  value={draft.register}
                  onChange={(next) => set('register', next)}
                  options={REGISTERS.map((r) => ({ value: r.value, label: r.label }))}
                  searchable={false}
                  aria-label="Register"
                />
              </div>
              <div>
                {label('ef-dialect', 'Dialect or region', 'dialect')}
                {input('ef-dialect', 'dialect', { placeholder: 'Where this form is used' })}
              </div>
            </div>

            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                {label('ef-respelling', 'How it sounds', 'respelling')}
                {input('ef-respelling', 'respelling', { placeholder: 'For example, ah-MAH-nee' })}
              </div>
              <div>
                {label('ef-ipa', 'Pronunciation in IPA', 'ipa')}
                {input('ef-ipa', 'ipa', { placeholder: '/a.ma.ni/', mono: true })}
              </div>
            </div>

            {!draft.isPhrase && (
              <div>
                {label('ef-etymology', 'Where the word comes from', 'etymology')}
                {textarea('ef-etymology', 'etymology', 2, 'A root form, a borrowing, or a story attached to it')}
              </div>
            )}

            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                {label('ef-source', 'How you know it', 'sourceReference')}
                {input('ef-source', 'sourceReference', {
                  placeholder: 'I grew up with it, my grandmother, a book...',
                })}
              </div>
              <div>
                {label('ef-source-url', 'Source link', 'sourceUrl')}
                {input('ef-source-url', 'sourceUrl', { placeholder: 'https://' })}
              </div>
            </div>
          </div>
        )}
      </section>
    </div>
  )
}
