import { test } from 'node:test'
import assert from 'node:assert/strict'
import { termMatch } from '../lib/translation/matching.ts'

test('letters inside another word are not a match', () => {
  // The faults the translation test found in November 2026.
  assert.equal(termMatch('mbaya', 'ya'), null)
  assert.equal(termMatch('nane', 'na'), null)
  assert.equal(termMatch('mother of twins', 'of'), null)
  assert.equal(termMatch('How are you?', 'e'), null)
})

test('a whole term in a gloss is a match', () => {
  assert.equal(termMatch('bad; evil, wicked', 'evil'), 'exact')
  assert.equal(termMatch('Boy', 'boy'), 'exact')
  assert.equal(termMatch('na', 'na'), 'exact')
})

test('accents, case and punctuation do not matter', () => {
  assert.equal(termMatch('Maitũ', 'maitu'), 'exact')
  assert.equal(termMatch('How are you?', 'how are you'), 'exact')
})

test('"to", articles and notes in brackets are ignored', () => {
  assert.equal(termMatch('to eat', 'eat'), 'exact')
  assert.equal(termMatch('a house', 'house'), 'exact')
  assert.equal(termMatch('(of a cow) to low', 'low'), 'exact')
  assert.equal(termMatch('kula', 'kula'), 'exact')
  assert.equal(termMatch('kula', 'la'), null)
})

test('a phrase of two words or more can sit inside a longer gloss', () => {
  assert.equal(termMatch('how are you today', 'how are you'), 'phrase')
  assert.equal(termMatch('good morning to you', 'good morning'), 'phrase')
  // One word inside a longer gloss is not enough: "of" would match everything.
  assert.equal(termMatch('house of prayer', 'house'), null)
})

test('empty input never matches', () => {
  assert.equal(termMatch(null, 'ya'), null)
  assert.equal(termMatch('ya', '  '), null)
})
