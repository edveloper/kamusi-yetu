import test from 'node:test'
import assert from 'node:assert/strict'
import { methodFromPath, validateFeedbackInput } from '../lib/translation/feedback.ts'

test('feedback maps path types to expected methods', () => {
  assert.equal(methodFromPath('direct_edge'), 'manual')
  assert.equal(methodFromPath('pivot_sw'), 'pivot_sw')
  assert.equal(methodFromPath('pivot_en'), 'pivot_en')
  assert.equal(methodFromPath('pivot_sw_en'), 'ml')
})

test('feedback validator rejects incomplete payload', () => {
  const result = validateFeedbackInput({
    sourceEntryId: 'a',
    verdict: 'correct'
  })

  assert.equal(result.ok, false)
  if (!result.ok) {
    assert.equal(result.error, 'Missing required fields.')
  }
})

test('feedback validator normalizes valid payload', () => {
  const result = validateFeedbackInput({
    sourceEntryId: '  source-1  ',
    targetEntryId: 'target-1',
    sourceLanguageId: 'lang-1',
    targetLanguageId: 'lang-2',
    verdict: 'partially_correct',
    pathType: 'pivot_en_sw',
    confidence: 2,
    note: '  useful  '
  })

  assert.equal(result.ok, true)
  if (result.ok) {
    assert.equal(result.value.sourceEntryId, 'source-1')
    assert.equal(result.value.confidence, 1)
    assert.equal(result.value.note, 'useful')
  }
})
