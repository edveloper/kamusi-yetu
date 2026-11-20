import { test } from 'node:test'
import assert from 'node:assert/strict'
import { chrFOf, heldOutFilter, isHeldOut, normaliseForCompare, words } from '../lib/translation/evaluation.ts'

test('identical sentences score 100, unrelated ones close to 0', () => {
  assert.equal(chrFOf([['Nĩ wega mũno.', 'nĩ wega mũno']]), 100)
  assert.ok(chrFOf([['xyz qqq', 'Nĩ wega mũno']]) < 5)
})

test('a near miss earns partial credit', () => {
  const near = chrFOf([['ohinya ahinya', 'ohande tin ahinya']])
  assert.ok(near > 20 && near < 90, String(near))
})

test('recall counts more than precision', () => {
  // Saying only half of it is worse than saying all of it plus a bit extra.
  const half = chrFOf([['ohande tin', 'ohande tin ahinya']])
  const extra = chrFOf([['ohande tin ahinya kendo', 'ohande tin ahinya']])
  assert.ok(extra > half, `${extra} > ${half}`)
})

test('an empty answer scores 0', () => {
  assert.equal(chrFOf([['', 'Kazi yetu imejaa changamoto.']]), 0)
})

test('comparison ignores case and punctuation but keeps letters like ĩ', () => {
  assert.equal(normaliseForCompare('  Nĩ WEGA, mũno! '), 'nĩ wega mũno')
  assert.notEqual(normaliseForCompare('mũno'), normaliseForCompare('muno'))
})

test('words splits on spaces and punctuation and keeps apostrophes inside', () => {
  assert.deepEqual(words("Kidaw'ida, ni lugha!"), ["Kidaw'ida", 'ni', 'lugha'])
})

test('the hold-out rule is fixed by the text key', () => {
  assert.equal(isHeldOut('00a1'), true)
  assert.equal(isHeldOut('0a01'), false)
  assert.equal(isHeldOut('03ff', 'luo'), false)
})

test('smaller languages keep back a bigger slice that includes 00', () => {
  assert.equal(isHeldOut('00a1', 'dav'), true)
  assert.equal(isHeldOut('03ff', 'dav'), true)
  assert.equal(isHeldOut('04aa', 'dav'), false)
  assert.equal(isHeldOut('0fff', 'bxk'), true)
  assert.equal(isHeldOut('10aa', 'bxk'), false)
  assert.equal(heldOutFilter('kal'), 'or(text_key.like.00*,text_key.like.01*,text_key.like.02*,text_key.like.03*)')
  assert.equal(heldOutFilter('ki'), 'or(text_key.like.00*)')
})
