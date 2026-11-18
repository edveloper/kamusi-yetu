// The single shape of an entry as a person edits it, shared by the three
// places an entry is written: adding a word, suggesting a correction, and
// reviewing. Pure functions only, so the rules can be tested without a browser.

// Relative with the extension so the node test runner can load this file too.
import { validateEntryRules } from './validation/entry-rules.ts'

export type SenseDraft = {
  id?: string
  definition: string
  english: string
  swahili: string
  partOfSpeech: string
  status?: string
}

export type ExampleDraft = {
  id?: string
  text: string
  english: string
  swahili: string
  status?: string
  /** Set when the sentence came from a source dataset, so it is credited. */
  sourceName?: string
  sourceUrl?: string
  licence?: string
}

export type EntryDraft = {
  isPhrase: boolean
  headword: string
  definition: string
  english: string
  swahili: string
  partOfSpeech: string
  category: string
  register: string
  dialect: string
  ipa: string
  respelling: string
  etymology: string
  literalMeaning: string
  usageNote: string
  responseText: string
  sourceReference: string
  sourceUrl: string
  senses: SenseDraft[]
  examples: ExampleDraft[]
}

/** Draft field to entries column. Order is the order changes are listed in. */
export const ENTRY_COLUMNS = {
  headword: 'headword',
  definition: 'primary_definition',
  english: 'english_translation',
  swahili: 'swahili_translation',
  partOfSpeech: 'part_of_speech',
  literalMeaning: 'literal_meaning',
  responseText: 'response_text',
  usageNote: 'usage_note',
  category: 'category',
  register: 'register',
  dialect: 'dialect_variant',
  respelling: 'pronunciation',
  ipa: 'pronunciation_ipa',
  etymology: 'etymology',
  sourceReference: 'source_reference',
  sourceUrl: 'source_url',
} as const

type ColumnKey = keyof typeof ENTRY_COLUMNS

export const FIELD_LABELS: Record<ColumnKey, string> = {
  headword: 'Headword',
  definition: 'Meaning',
  english: 'In English',
  swahili: 'In Kiswahili',
  partOfSpeech: 'Part of speech',
  literalMeaning: 'Literal meaning',
  responseText: 'Usual reply',
  usageNote: 'How it is used',
  category: 'Topic',
  register: 'Register',
  dialect: 'Dialect or region',
  respelling: 'Pronunciation',
  ipa: 'Pronunciation in IPA',
  etymology: 'Where it comes from',
  sourceReference: 'Source',
  sourceUrl: 'Source link',
}

export const PARTS_OF_SPEECH = [
  'noun', 'verb', 'adjective', 'adverb', 'pronoun',
  'number', 'preposition', 'conjunction', 'interjection',
] as const

export const REGISTERS = [
  { value: 'both', label: 'Everyday' },
  { value: 'formal', label: 'Formal or respectful' },
  { value: 'informal', label: 'Informal or casual' },
] as const

/** Fields that only make sense for one kind of entry. */
export const PHRASE_ONLY: ColumnKey[] = ['literalMeaning', 'responseText']
export const WORD_ONLY: ColumnKey[] = ['partOfSpeech', 'etymology']

export const MAX_NEW_EXAMPLES = 5
export const MAX_SENSES = 8

const clean = (value: unknown) => String(value ?? '').trim()

export function emptyDraft(isPhrase = false): EntryDraft {
  return {
    isPhrase,
    headword: '', definition: '', english: '', swahili: '', partOfSpeech: '',
    category: '', register: 'both', dialect: '', ipa: '', respelling: '', etymology: '',
    literalMeaning: '', usageNote: '', responseText: '', sourceReference: '', sourceUrl: '',
    senses: [], examples: [],
  }
}

export const emptySense = (): SenseDraft => ({ definition: '', english: '', swahili: '', partOfSpeech: '' })
export const emptyExample = (): ExampleDraft => ({ text: '', english: '', swahili: '' })

type Row = Record<string, unknown>

export function draftFromRows(entry: Row, senses: Row[] = [], examples: Row[] = []): EntryDraft {
  const draft = emptyDraft(clean(entry.part_of_speech).toLowerCase() === 'phrase')
  for (const [key, column] of Object.entries(ENTRY_COLUMNS) as Array<[ColumnKey, string]>) {
    draft[key] = clean(entry[column])
  }
  if (draft.isPhrase) draft.partOfSpeech = ''
  if (!draft.register) draft.register = 'both'
  draft.senses = senses
    .slice()
    .sort((a, b) => Number(a.position ?? 0) - Number(b.position ?? 0))
    .map((s) => ({
      id: clean(s.id) || undefined,
      definition: clean(s.definition),
      english: clean(s.english_translation),
      swahili: clean(s.swahili_translation),
      partOfSpeech: clean(s.part_of_speech),
      status: clean(s.validation_status) || undefined,
    }))
  draft.examples = examples.map((e) => ({
    id: clean(e.id) || undefined,
    text: clean(e.example_text),
    english: clean(e.english_translation),
    swahili: clean(e.swahili_translation),
    status: clean(e.validation_status) || undefined,
  }))
  return draft
}

/** The entries columns this draft writes. Empty strings become null. */
export function entryColumns(draft: EntryDraft): Record<string, string | null> {
  const out: Record<string, string | null> = {}
  for (const [key, column] of Object.entries(ENTRY_COLUMNS) as Array<[ColumnKey, string]>) {
    const value = clean(draft[key])
    out[column] = value || null
  }
  out.part_of_speech = draft.isPhrase ? 'phrase' : out.part_of_speech?.toLowerCase() ?? null
  if (!out.register) out.register = 'both'
  if (draft.isPhrase) out.etymology = out.etymology ?? null
  else {
    out.literal_meaning = null
    out.response_text = null
  }
  return out
}

/** Entry columns that differ between two drafts, with labels, for review. */
export function changedColumns(before: EntryDraft, after: EntryDraft) {
  const a = entryColumns(before)
  const b = entryColumns(after)
  const changes: Array<{ key: ColumnKey; column: string; label: string; from: string | null; to: string | null }> = []
  for (const [key, column] of Object.entries(ENTRY_COLUMNS) as Array<[ColumnKey, string]>) {
    if ((a[column] ?? null) !== (b[column] ?? null)) {
      changes.push({ key, column, label: FIELD_LABELS[key], from: a[column] ?? null, to: b[column] ?? null })
    }
  }
  return changes
}

const filled = (s: { text?: string; definition?: string; english?: string; swahili?: string }) =>
  !!(clean(s.text) || clean(s.definition) || clean(s.english) || clean(s.swahili))

/**
 * Every rule the form enforces, in the order a person would fix them. Throws
 * with a message written for the contributor.
 */
export function validateDraft(draft: EntryDraft, languageCode: string) {
  if (!clean(draft.headword)) {
    throw new Error(draft.isPhrase ? 'Type the phrase itself first.' : 'Type the word itself first.')
  }
  if (!clean(draft.definition)) throw new Error('Say what it means.')

  const examples = draft.examples.filter(filled)
  validateEntryRules({
    languageCode,
    headword: draft.headword,
    primaryDefinition: draft.definition,
    partOfSpeech: draft.isPhrase ? 'phrase' : draft.partOfSpeech,
    englishTranslation: draft.english,
    swahiliTranslation: draft.swahili,
    usageExample: examples[0]?.text,
  })

  if (draft.isPhrase && examples.length === 0) {
    throw new Error('A phrase needs at least one example showing how it is used.')
  }
  examples.forEach((example, i) => {
    if (!clean(example.text)) throw new Error(`Example ${i + 1} has a translation but no sentence.`)
    if (!clean(example.english) && !clean(example.swahili)) {
      throw new Error(`Example ${i + 1} needs its meaning in English or Kiswahili.`)
    }
  })

  draft.senses.filter(filled).forEach((sense, i) => {
    if (!clean(sense.definition) && !clean(sense.english) && !clean(sense.swahili)) {
      throw new Error(`Meaning ${i + 2} is empty.`)
    }
  })
  if (draft.senses.filter(filled).length > MAX_SENSES) {
    throw new Error(`Up to ${MAX_SENSES} further meanings, please. More than that usually means separate entries.`)
  }

  const url = clean(draft.sourceUrl)
  if (url && !/^https?:\/\/\S+$/i.test(url)) throw new Error('The source link should start with http:// or https://')
}

/** Examples and senses the person actually filled in. */
export const filledSenses = (draft: EntryDraft) => draft.senses.filter(filled)
export const filledExamples = (draft: EntryDraft) => draft.examples.filter(filled)
