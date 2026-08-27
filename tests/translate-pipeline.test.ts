import test from 'node:test'
import assert from 'node:assert/strict'
import { rankCandidates, type TranslationCandidate } from '../lib/translation/pipeline.ts'

test('one translation reached by several paths collapses to a single result', () => {
  // This previously returned two rows for the same word, which reads to a user
  // as the system disagreeing with itself. Reaching a word by several routes is
  // corroboration, so it belongs on one row.
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
  assert.equal(result.length, 1)
  assert.equal(result[0].path_type, 'direct_edge')
  assert.equal(result[0].confidence, 0.91)
  assert.deepEqual(result[0].via_paths, ['direct_edge', 'pivot_sw'])
})

test('case and whitespace variants of the same translation are folded together', () => {
  const candidates: TranslationCandidate[] = [
    {
      translation: 'Habari yako?',
      confidence: 0.95,
      path_type: 'direct_bridge',
      source_entry_id: 'source-1'
    },
    {
      translation: 'habari yako? ',
      confidence: 0.95,
      path_type: 'direct_bridge',
      source_entry_id: 'source-2'
    }
  ]

  const result = rankCandidates(candidates, 10)
  assert.equal(result.length, 1)
  assert.equal(result[0].translation, 'Habari yako?')
})

test('distinct translations are all kept, strongest first', () => {
  const candidates: TranslationCandidate[] = [
    { translation: 'Dayo', confidence: 0.6, path_type: 'pivot_sw', source_entry_id: 's1' },
    { translation: 'Min', confidence: 0.9, path_type: 'direct_bridge', source_entry_id: 's1' }
  ]

  const result = rankCandidates(candidates, 10)
  assert.equal(result.length, 2)
  assert.equal(result[0].translation, 'Min')
  assert.equal(result[1].translation, 'Dayo')
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

test('the limit is respected', () => {
  const candidates: TranslationCandidate[] = Array.from({ length: 8 }, (_, i) => ({
    translation: `word-${i}`,
    confidence: i / 10,
    path_type: 'pivot_en' as const,
    source_entry_id: 's1'
  }))

  assert.equal(rankCandidates(candidates, 3).length, 3)
})

test('translate pipeline returns no results when candidate set is empty', () => {
  const result = rankCandidates([], 10)
  assert.deepEqual(result, [])
})
