import test from 'node:test'
import assert from 'node:assert/strict'
import { rankCandidates, type TranslationCandidate } from '../lib/translation/pipeline.ts'

test('translate pipeline prefers direct path when confidence is highest', () => {
  const candidates: TranslationCandidate[] = [
    {
      translation: 'maai',
      confidence: 0.6,
      path_type: 'pivot_sw',
      source_entry_id: 'source-1',
      target_entry_id: 'target-1'
    },
    {
      translation: 'maai',
      confidence: 0.91,
      path_type: 'direct_edge',
      source_entry_id: 'source-1',
      target_entry_id: 'target-1'
    }
  ]

  const result = rankCandidates(candidates, 10)
  assert.equal(result.length, 2)
  assert.equal(result[0].path_type, 'direct_edge')
  assert.equal(result[0].translation, 'maai')
})

test('translate pipeline returns pivot candidate when no direct candidate exists', () => {
  const candidates: TranslationCandidate[] = [
    {
      translation: 'maai',
      confidence: 0.6,
      path_type: 'pivot_sw',
      source_entry_id: 'source-1',
      target_entry_id: 'target-1'
    }
  ]

  const result = rankCandidates(candidates, 10)
  assert.equal(result.length, 1)
  assert.equal(result[0].path_type, 'pivot_sw')
})

test('translate pipeline returns no results when candidate set is empty', () => {
  const result = rankCandidates([], 10)
  assert.deepEqual(result, [])
})
