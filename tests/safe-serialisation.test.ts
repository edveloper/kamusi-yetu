import test from 'node:test'
import assert from 'node:assert/strict'
import { escapeLike, ilikeCondition, eqCondition, quoteFilterValue } from '../lib/postgrest-filter.ts'
import { serializeJsonLd } from '../lib/json-ld.ts'

test('filter values with commas and brackets are quoted, not split', () => {
  assert.equal(
    ilikeCondition('headword', '%yes, thank you%'),
    'headword.ilike."%yes, thank you%"'
  )
  assert.equal(eqCondition('normalized_headword', 'a)b,c'), 'normalized_headword.eq."a)b,c"')
})

test('quotes and backslashes inside a value are escaped', () => {
  assert.equal(quoteFilterValue('say "hi"'), '"say \\"hi\\""')
  assert.equal(quoteFilterValue('a\\b'), '"a\\\\b"')
})

test('LIKE wildcards in user text match literally', () => {
  assert.equal(escapeLike('100%_sure'), '100\\%\\_sure')
})

test('structured data cannot close its script tag', () => {
  const out = serializeJsonLd({ name: '</script><script>alert(1)</script>' })
  assert.ok(!out.includes('</script>'))
  assert.deepEqual(JSON.parse(out), { name: '</script><script>alert(1)</script>' })
})
