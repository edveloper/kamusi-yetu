import test from 'node:test'
import assert from 'node:assert/strict'
import { validateEntryRules } from '../lib/validation/entry-rules.ts'

/**
 * validateEntryRules decides what is allowed into the corpus, and had no test
 * coverage at all. It runs in three places — the contribute form, createEntry,
 * and the moderation route's revalidation of a projected post-edit state — so a
 * regression here is a regression in every write path at once.
 */

const base = {
  languageCode: 'luo',
  headword: 'pi',
  primaryDefinition: 'Water, the drinkable liquid.',
  partOfSpeech: 'noun',
  englishTranslation: 'water',
  swahiliTranslation: 'maji',
  usageExample: 'Amiyi pi.',
}

const rejects = (input: Partial<typeof base>, matching: RegExp) =>
  assert.throws(() => validateEntryRules({ ...base, ...input }), matching)

const accepts = (input: Partial<typeof base>) =>
  assert.doesNotThrow(() => validateEntryRules({ ...base, ...input }))

/* ------------------------------------------------------------------ bridge */

test('an entry needs at least one bridge translation', () => {
  rejects({ englishTranslation: '', swahiliTranslation: '' }, /bridge translation/i)
})

test('either bridge alone is enough', () => {
  accepts({ englishTranslation: 'water', swahiliTranslation: '' })
  accepts({ englishTranslation: '', swahiliTranslation: 'maji' })
})

test('whitespace is not a bridge translation', () => {
  rejects({ englishTranslation: '   ', swahiliTranslation: '\t' }, /bridge translation/i)
})

test('an English entry must carry the Swahili side', () => {
  rejects(
    { languageCode: 'en', headword: 'water', englishTranslation: 'water', swahiliTranslation: '' },
    /Swahili/i
  )
  accepts({ languageCode: 'en', headword: 'water', swahiliTranslation: 'maji' })
})

test('a Swahili entry must carry the English side', () => {
  rejects(
    { languageCode: 'sw', headword: 'maji', swahiliTranslation: 'maji', englishTranslation: '' },
    /English/i
  )
  accepts({ languageCode: 'sw', headword: 'maji', englishTranslation: 'water' })
})

test('the bridge language check is case-insensitive on the code', () => {
  rejects({ languageCode: 'EN', swahiliTranslation: '' }, /Swahili/i)
})

/* ------------------------------------------------------------------ phrases */

test('a phrase needs an explanatory definition, not a bare gloss', () => {
  rejects(
    { partOfSpeech: 'phrase', headword: 'Nade?', primaryDefinition: 'hi' },
    /explanatory definition/i
  )
})

test('a phrase definition that merely repeats the bridge gloss is rejected', () => {
  rejects(
    {
      partOfSpeech: 'phrase',
      headword: 'Nade?',
      primaryDefinition: 'How are you?',
      englishTranslation: 'How are you?',
    },
    /not just the bridge translation/i
  )
})

test('the repeat check ignores case and spacing', () => {
  rejects(
    {
      partOfSpeech: 'phrase',
      headword: 'Nade?',
      primaryDefinition: '  how   ARE you?  ',
      englishTranslation: 'How are you?',
    },
    /not just the bridge translation/i
  )
})

test('a phrase with a real explanation passes', () => {
  accepts({
    partOfSpeech: 'phrase',
    headword: 'Nade?',
    primaryDefinition: 'A common greeting used to ask how someone is doing.',
    englishTranslation: 'How are you?',
  })
})

test('the phrase rules do not apply to ordinary words', () => {
  accepts({ partOfSpeech: 'noun', primaryDefinition: 'water' })
})

test('part of speech is matched case-insensitively', () => {
  rejects({ partOfSpeech: 'Phrase', primaryDefinition: 'hi' }, /explanatory definition/i)
})

/* ------------------------------------------------------------ usage example */

test('a usage example may not simply repeat the headword', () => {
  rejects({ usageExample: 'pi' }, /in context/i)
})

test('the repeat check on usage examples ignores case and spacing', () => {
  rejects({ headword: 'Amani', usageExample: '  amani  ' }, /in context/i)
})

test('a usage example that shows the word in context passes', () => {
  accepts({ usageExample: 'Amiyi pi.' })
})

test('a missing usage example is allowed for words', () => {
  accepts({ usageExample: '' })
})

/* ------------------------------------------------------------------- misc */

test('a missing language code still enforces the bridge rule', () => {
  rejects({ languageCode: '', englishTranslation: '', swahiliTranslation: '' }, /bridge/i)
  accepts({ languageCode: '' })
})

test('null and undefined optional fields are tolerated', () => {
  assert.doesNotThrow(() =>
    validateEntryRules({
      languageCode: null,
      headword: 'pi',
      primaryDefinition: 'Water.',
      partOfSpeech: null,
      englishTranslation: 'water',
      swahiliTranslation: null,
      usageExample: null,
    })
  )
})
