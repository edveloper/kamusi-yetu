// The translation test: how well does the translator do on real sentences it
// has never seen?
//
//   node --env-file=.env.local --import ./scripts/ts-paths.mjs scripts/translation-test.mjs
//   ... --limit=50    fewer sentences per direction, for a quick look
//
// Reads only. Runs the same engine as the site, in this process, with gap
// logging off so the gaps queue is not filled with test sentences. Writes the
// full result to reports/translation/<date>.json (gitignored) and prints a
// summary.
//
// The sentences are the held-out slice of source_sentences (see
// lib/translation/evaluation.ts): Dholuo and Kikuyu sentences with a Swahili or
// English translation, tested in both directions. For each direction:
//
//   whole     the full sentence typed into the translator: how often anything
//             comes back, and how often it is exactly right
//   coverage  share of the sentence's words the translator knows on their own
//   chrF      word-by-word output (each word's top answer, unknown words left
//             as typed) scored against the real translation, 0 to 100
//   copy      chrF of leaving the sentence untranslated: the floor. Names and
//             numbers carry over, so it is not 0. Word-by-word only counts as
//             progress where it beats this.

import fs from 'node:fs'
import { runTranslation } from '../lib/translation/engine.ts'
import { HOLD_OUT_PREFIX, chrFOf, heldOutFilter, normaliseForCompare, words } from '../lib/translation/evaluation.ts'

const LIMIT = Number((process.argv.find((a) => a.startsWith('--limit=')) ?? '').slice(8)) || 0
const URL_ = process.env.NEXT_PUBLIC_SUPABASE_URL
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!URL_ || !KEY) throw new Error('Run with --env-file=.env.local')
const H = { apikey: KEY, Authorization: `Bearer ${KEY}` }

async function rest(path) {
  const res = await fetch(`${URL_}/rest/v1/${path}`, { headers: H })
  if (!res.ok) throw new Error(`${res.status} ${path}: ${(await res.text()).slice(0, 200)}`)
  return res.json()
}

const languages = await rest('languages?select=id,code,name&code=in.(luo,ki,sw,en)')
const lang = Object.fromEntries(languages.map((l) => [l.code, l]))

// ------------------------------------------------------------ the sentences --
async function heldOut(code) {
  const rows = []
  for (let from = 0; ; from += 1000) {
    const page = await rest(
      `source_sentences?select=text,translation_en,translation_sw,source,kind` +
        `&language_id=eq.${lang[code].id}&and=(${heldOutFilter(code)},or(translation_en.not.is.null,translation_sw.not.is.null))` +
        `&order=text_key&offset=${from}&limit=1000`
    )
    rows.push(...page)
    if (page.length < 1000) break
  }
  return rows
}

const directions = []
for (const code of ['luo', 'ki']) {
  const rows = await heldOut(code)
  for (const bridge of ['sw', 'en']) {
    const pairs = rows
      .map((r) => ({ native: r.text, bridge: bridge === 'sw' ? r.translation_sw : r.translation_en, source: r.source }))
      .filter((p) => p.bridge)
    const take = LIMIT ? pairs.slice(0, LIMIT) : pairs
    directions.push({ from: code, to: bridge, items: take.map((p) => ({ text: p.native, reference: p.bridge, source: p.source })) })
    directions.push({ from: bridge, to: code, items: take.map((p) => ({ text: p.bridge, reference: p.native, source: p.source })) })
  }
}

// ---------------------------------------------------------------- running --
const cache = new Map()
let calls = 0
function translate(text, from, to) {
  const key = `${from}|${to}|${normaliseForCompare(text)}`
  if (!cache.has(key)) {
    calls++
    cache.set(
      key,
      runTranslation({ text, sourceLanguageId: lang[from].id, targetLanguageId: lang[to].id, limit: 3 }, { recordGaps: false })
        .then((o) => (o.ok ? o.result : []))
        .catch(() => [])
    )
  }
  return cache.get(key)
}

// A few at a time, so the free database tier is not flooded.
async function inBatches(list, size, fn) {
  const out = []
  for (let i = 0; i < list.length; i += size) out.push(...(await Promise.all(list.slice(i, i + size).map(fn))))
  return out
}

const pct = (a, b) => (b ? Math.round((1000 * a) / b) / 10 : 0)
const round = (n) => Math.round(n * 10) / 10
const summary = []
const report = { date: new Date().toISOString(), holdOutPrefix: HOLD_OUT_PREFIX, directions: [] }

for (const d of directions) {
  process.stdout.write(`${d.from} -> ${d.to}: ${d.items.length} sentences `)
  const results = await inBatches(d.items, 4, async (item) => {
    const whole = await translate(item.text, d.from, d.to)
    const ws = words(item.text)
    const each = await inBatches(ws, 6, (w) => translate(w, d.from, d.to))
    const known = each.filter((r) => r.length > 0).length
    const wordByWord = ws.map((w, i) => each[i][0]?.translation ?? w).join(' ')
    return {
      ...item,
      whole: whole[0]?.translation ?? null,
      exact: !!whole[0] && normaliseForCompare(whole[0].translation) === normaliseForCompare(item.reference),
      words: ws.length,
      known,
      wordByWord,
    }
  })
  process.stdout.write('\n')

  const totalWords = results.reduce((a, r) => a + r.words, 0)
  const row = {
    direction: `${d.from} -> ${d.to}`,
    sentences: results.length,
    wholeAnswered: pct(results.filter((r) => r.whole).length, results.length),
    wholeExact: pct(results.filter((r) => r.exact).length, results.length),
    coverage: pct(results.reduce((a, r) => a + r.known, 0), totalWords),
    chrF: round(chrFOf(results.map((r) => [r.wordByWord, r.reference]))),
    copy: round(chrFOf(results.map((r) => [r.text, r.reference]))),
  }
  summary.push(row)
  report.directions.push({ ...row, samples: results.slice(0, 25) })
}

fs.mkdirSync('reports/translation', { recursive: true })
const file = `reports/translation/${report.date.slice(0, 16).replace(/[:T]/g, "-")}${LIMIT ? `-limit${LIMIT}` : ''}.json`
fs.writeFileSync(file, JSON.stringify(report, null, 2))

console.log('\n(percentages; chrF and copy are 0 to 100)')
console.table(summary)
console.log(`${calls} distinct lookups. Full results in ${file}`)
