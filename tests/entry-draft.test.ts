import test from 'node:test'
import assert from 'node:assert/strict'
import {
  changedColumns,
  draftFromRows,
  emptyDraft,
  entryColumns,
  validateDraft,
} from '../lib/entry-draft.ts'

const word = () => ({ ...emptyDraft(false), headword: 'pi', definition: 'Water, to drink or wash with.', english: 'water' })

test('a word with a meaning and a bridge passes', () => {
  assert.doesNotThrow(() => validateDraft(word(), 'luo'))
})

test('a word with no bridge translation is refused', () => {
  assert.throws(() => validateDraft({ ...word(), english: '' }, 'luo'), /bridge translation/)
})

test('a phrase needs an example, and each example needs a translation', () => {
  const phrase = { ...emptyDraft(true), headword: 'Inyalo nade?', definition: 'A way of asking how someone is doing.', english: 'how are you' }
  assert.throws(() => validateDraft(phrase, 'luo'), /needs at least one example/)
  assert.throws(
    () => validateDraft({ ...phrase, examples: [{ text: 'Inyalo nade, Achieng?', english: '', swahili: '' }] }, 'luo'),
    /needs its meaning/
  )
  assert.doesNotThrow(() =>
    validateDraft({ ...phrase, examples: [{ text: 'Inyalo nade, Achieng?', english: 'How are you, Achieng?', swahili: '' }] }, 'luo')
  )
})

test('entryColumns writes phrase fields only for phrases, and nulls empty values', () => {
  const w = entryColumns({ ...word(), literalMeaning: 'stray', responseText: 'stray' })
  assert.equal(w.literal_meaning, null)
  assert.equal(w.response_text, null)
  assert.equal(w.etymology, null)
  const p = entryColumns({ ...emptyDraft(true), headword: 'Oyawore', responseText: 'Oyawore ahinya' })
  assert.equal(p.part_of_speech, 'phrase')
  assert.equal(p.response_text, 'Oyawore ahinya')
})

test('changedColumns lists only what differs, with labels', () => {
  const before = draftFromRows({ headword: 'guok', primary_definition: 'A dog.', english_translation: 'dog', part_of_speech: 'noun' })
  const after = { ...before, english: 'dog, hound', usageNote: 'Also used as an insult.' }
  const changes = changedColumns(before, after)
  assert.deepEqual(changes.map((c) => c.label), ['In English', 'How it is used'])
})

test('a bad source link is refused', () => {
  assert.throws(() => validateDraft({ ...word(), sourceUrl: 'my grandmother' }, 'luo'), /source link/)
})
