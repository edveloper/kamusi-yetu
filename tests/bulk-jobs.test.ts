import test from 'node:test'
import assert from 'node:assert/strict'
import { deriveBridgeUpdate, nextApplyStatus, nextRollbackStatus } from '../lib/moderation/bulk-jobs.ts'

test('bulk dry-run logic backfills Swahili on English entries using headword', () => {
  const enToSw = new Map([
    ['water', { term: 'maji', score: 0.9, ambiguous: false }]
  ])
  const swToEn = new Map<string, { term: string; score: number; ambiguous: boolean }>()

  const updates = deriveBridgeUpdate(
    {
      id: '1',
      language_id: 'en-id',
      headword: 'Water',
      english_translation: null,
      swahili_translation: null
    },
    'en',
    enToSw,
    swToEn
  )

  assert.deepEqual(updates, { swahili_translation: 'maji' })
})

test('bulk dry-run logic backfills missing bridge on indigenous entry', () => {
  const enToSw = new Map([
    ['water', { term: 'maji', score: 0.9, ambiguous: false }]
  ])
  const swToEn = new Map<string, { term: string; score: number; ambiguous: boolean }>()

  const updates = deriveBridgeUpdate(
    {
      id: '2',
      language_id: 'kikuyu-id',
      headword: 'maai',
      english_translation: 'water',
      swahili_translation: null
    },
    'ki',
    enToSw,
    swToEn
  )

  assert.deepEqual(updates, { swahili_translation: 'maji' })
})

test('bulk lifecycle status transitions are deterministic', () => {
  assert.equal(nextApplyStatus(0), 'completed')
  assert.equal(nextApplyStatus(1), 'failed')
  assert.equal(nextRollbackStatus(0), 'rolled_back')
  assert.equal(nextRollbackStatus(2), 'failed')
})
