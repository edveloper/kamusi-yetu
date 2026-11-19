// Export sentence pairs for fine-tuning NLLB (services/finetune/).
//
//   node --env-file=.env.local scripts/export-training-pairs.mjs
//
// Writes data/training/pairs.tsv (gitignored): one pair per line,
//   lang <TAB> bridge <TAB> text <TAB> translation <TAB> source
// for Dholuo and Kikuyu against Kiswahili and English. Held-out test sentences
// (text_key starting with HOLD_OUT_PREFIX) are left out, so the translation
// test stays a fair measure of the fine-tuned model.
import fs from 'node:fs'
import { HOLD_OUT_PREFIX } from '../lib/translation/evaluation.ts'

const URL_ = process.env.NEXT_PUBLIC_SUPABASE_URL
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!URL_ || !KEY) throw new Error('Run with --env-file=.env.local')
const H = { apikey: KEY, Authorization: `Bearer ${KEY}` }
const rest = async (p) => {
  const res = await fetch(`${URL_}/rest/v1/${p}`, { headers: H })
  if (!res.ok) throw new Error(`${res.status} ${p}`)
  return res.json()
}

const tidy = (s) => String(s ?? '').replace(/[\t\r\n]+/g, ' ').replace(/\s+/g, ' ').trim()
const languages = await rest('languages?select=id,code&code=in.(luo,ki)')
const lines = []
const counts = {}
let heldOut = 0

for (const { id, code } of languages) {
  for (let from = 0; ; from += 1000) {
    const rows = await rest(
      `source_sentences?select=text,translation_en,translation_sw,source,text_key&language_id=eq.${id}` +
        `&or=(translation_en.not.is.null,translation_sw.not.is.null)&order=id&offset=${from}&limit=1000`
    )
    for (const r of rows) {
      if (String(r.text_key).startsWith(HOLD_OUT_PREFIX)) { heldOut++; continue }
      for (const bridge of ['sw', 'en']) {
        const translation = tidy(bridge === 'sw' ? r.translation_sw : r.translation_en)
        if (!translation) continue
        lines.push([code, bridge, tidy(r.text), translation, r.source].join('\t'))
        counts[`${code}-${bridge}`] = (counts[`${code}-${bridge}`] || 0) + 1
      }
    }
    if (rows.length < 1000) break
  }
}

fs.mkdirSync('data/training', { recursive: true })
fs.writeFileSync('data/training/pairs.tsv', ['lang\tbridge\ttext\ttranslation\tsource', ...lines].join('\n') + '\n')
console.log('pairs', lines.length, JSON.stringify(counts), '| held-out sentences left out', heldOut)
console.log('written to data/training/pairs.tsv', (fs.statSync('data/training/pairs.tsv').size / 1e6).toFixed(1) + 'MB')
