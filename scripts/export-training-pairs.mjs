// Export sentence pairs for fine-tuning NLLB (services/finetune/).
//
//   node --env-file=.env.local scripts/export-training-pairs.mjs
//
// Writes data/training/pairs.tsv (gitignored): one pair per line,
//   lang <TAB> bridge <TAB> text <TAB> translation <TAB> source
// for every language in LANGUAGES against Kiswahili and English.
//
// Held-out test sentences (lib/translation/evaluation.ts, isHeldOut) are left
// out, so the translation test stays a fair measure of the fine-tuned model.
// A pair is also left out when either side matches a held-out sentence or its
// translation: the same Kiswahili sentence translated twice would otherwise
// let the model see the test's answer.
import fs from 'node:fs'
import { isHeldOut, normaliseForCompare } from '../lib/translation/evaluation.ts'

// Dholuo, Kikuyu, Kidaw'ida, Kalenjin, and the Luhya dialects Bukusu, Logooli
// and Marachi.
const LANGUAGES = ['luo', 'ki', 'dav', 'kal', 'bxk', 'rag', 'lri']

const URL_ = process.env.NEXT_PUBLIC_SUPABASE_URL
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!URL_ || !KEY) throw new Error('Run with --env-file=.env.local')
const H = { apikey: KEY, Authorization: `Bearer ${KEY}` }
const rest = async (p) => {
  for (let attempt = 1; ; attempt++) {
    const res = await fetch(`${URL_}/rest/v1/${p}`, { headers: H }).catch((e) => e)
    if (res instanceof Response && res.ok) return res.json()
    if (attempt >= 4) throw new Error(`${res?.status ?? res} ${p}`)
    await new Promise((r) => setTimeout(r, 2000 * attempt))
  }
}

const tidy = (s) => String(s ?? '').replace(/[\t\r\n]+/g, ' ').replace(/\s+/g, ' ').trim()
const languages = await rest(`languages?select=id,code&code=in.(${LANGUAGES.join(',')})`)

const lines = []
const counts = {}
const sources = {}
const report = {}

for (const { id, code } of languages) {
  // Paged by text_key, which follows the (language_id, text_key) index; paging
  // by offset times out on a table this size.
  const rows = []
  for (let last = ''; ; ) {
    const page = await rest(
      `source_sentences?select=text,translation_en,translation_sw,source,text_key&language_id=eq.${id}` +
        `${last ? `&text_key=gt.${last}` : ''}&order=text_key&limit=1000`
    )
    rows.push(...page.filter((r) => r.translation_en || r.translation_sw))
    if (page.length < 1000) break
    last = page[page.length - 1].text_key
  }
  const held = rows.filter((r) => isHeldOut(String(r.text_key), code))
  const banned = new Set(held.flatMap((r) => [r.text, r.translation_sw, r.translation_en]).filter(Boolean).map(normaliseForCompare))
  let leaks = 0
  for (const r of rows) {
    if (isHeldOut(String(r.text_key), code)) continue
    for (const bridge of ['sw', 'en']) {
      const translation = tidy(bridge === 'sw' ? r.translation_sw : r.translation_en)
      if (!translation) continue
      if (banned.has(normaliseForCompare(r.text)) || banned.has(normaliseForCompare(translation))) { leaks++; continue }
      lines.push([code, bridge, tidy(r.text), translation, r.source].join('\t'))
      counts[`${code}-${bridge}`] = (counts[`${code}-${bridge}`] || 0) + 1
      sources[`${code} ${r.source}`] = (sources[`${code} ${r.source}`] || 0) + 1
    }
  }
  report[code] = { withTranslation: rows.length, heldOut: held.length, leftOutAsLeaks: leaks }
}

fs.mkdirSync('data/training', { recursive: true })
fs.writeFileSync('data/training/pairs.tsv', ['lang\tbridge\ttext\ttranslation\tsource', ...lines].join('\n') + '\n')
console.log('pairs', lines.length)
console.table(counts)
console.table(report)
console.table(sources)
console.log('written to data/training/pairs.tsv', (fs.statSync('data/training/pairs.tsv').size / 1e6).toFixed(1) + 'MB')
