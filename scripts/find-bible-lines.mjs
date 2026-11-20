// Find sentence pairs that are Bible verses.
//
//   node --env-file=.env.local scripts/find-bible-lines.mjs
//
// Reads only. Needs a Kiswahili Bible as plain verse-per-line text:
//   data/sources/bible-check/swhonen_vpl.txt
// from https://eBible.org/Scriptures/swhonen_vpl.zip (Biblica Neno, CC BY-SA).
// It is used only to recognise Bible words; none of it goes into LughaKonnect.
//
// The name list in import-sources.mjs (BIBLE) misses most verses, and the
// Kiswahili side of a verse is often retold in plain words, so matching whole
// verses does not work either. What does give verses away is their names and
// rare words: Sisera, Gidioni, Melikisedeki, sadaka ya kuteketezwa. A "Bible
// word" here is one the Bible uses and our other sources almost never do.
//
// A sentence is marked when its Kiswahili side has a Bible word. KenTrans keeps
// each sentence's place in its file (source_ref), and verses come in runs, so a
// KenTrans sentence is also marked when most of the sentences around it are.
// Writes reports/bible-check/<date>.tsv for a person to check.

import fs from 'node:fs'

const BIBLE_FILE = 'data/sources/bible-check/swhonen_vpl.txt'
const URL_ = process.env.NEXT_PUBLIC_SUPABASE_URL
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!URL_ || !KEY) throw new Error('Run with --env-file=.env.local')
if (!fs.existsSync(BIBLE_FILE)) throw new Error(`Download ${BIBLE_FILE} first (see the top of this file)`)
const H = { apikey: KEY, Authorization: `Bearer ${KEY}` }
const rest = async (p) => {
  for (let attempt = 1; ; attempt++) {
    const res = await fetch(`${URL_}/rest/v1/${p}`, { headers: H }).catch((e) => e)
    if (res instanceof Response && res.ok) return res.json()
    if (attempt >= 4) throw new Error(`${res?.status ?? res} ${p}`)
    await new Promise((r) => setTimeout(r, 2000 * attempt))
  }
}

const words = (s) => [...new Set((String(s).toLowerCase().normalize('NFC').match(/\p{L}[\p{L}'’ʼ]*/gu) ?? []).map((w) => w.replace(/[’ʼ]/g, "'")))]

// The Bible's names: words it writes with a capital in mid-sentence nearly
// every time (Sisera, Gideoni, Abimeleki, Sodoma).
const capital = new Map()
const lower = new Map()
for (const line of fs.readFileSync(BIBLE_FILE, 'utf8').split(/\r?\n/)) {
  const m = line.match(/^\S+ \d+:\d+\s+(.*)$/)
  if (!m) continue
  const raw = m[1].normalize('NFC').match(/[.!?:;“"‘(]?\s*\p{L}[\p{L}'’ʼ-]*/gu) ?? []
  raw.forEach((tok, i) => {
    const w = tok.replace(/^[^\p{L}]+/u, '')
    if (i === 0 || /^[.!?:;“"‘(]/.test(tok)) return // sentence start: capital tells nothing
    for (const part of w.split('-')) {
      const key = part.toLowerCase().replace(/[’ʼ]/g, "'")
      if (key.length < 4) continue
      const map = /^\p{Lu}/u.test(part) ? capital : lower
      map.set(key, (map.get(key) || 0) + 1)
    }
  })
}
const names = new Set([...capital].filter(([w, n]) => n >= 2 && n >= 9 * (lower.get(w) || 0)).map(([w]) => w))
// Spelling varies between Bibles and writers (Aburamu, Abramu), so a name also
// matches with one letter added, dropped or changed: both sides are reduced to
// every form with one letter removed.
const dropOne = (w) => [w, ...[...w].map((_, i) => w.slice(0, i) + w.slice(i + 1))]
const nameForms = new Map()
for (const n of names) for (const f of dropOne(n)) nameForms.set(f, n)
const bibleName = (w) => {
  if (w.length < 4) return null
  if (names.has(w)) return w
  if (w.length < 6) return null // short words match too much by accident
  for (const f of dropOne(w)) if (nameForms.has(f)) return nameForms.get(f)
  return null
}

// Every sentence pair with a Kiswahili side.
const languages = await rest('languages?select=id,code')
const rows = []
for (const { id: languageId, code } of languages) {
  for (let last = ''; ; ) {
    const page = await rest(
      `source_sentences?select=id,text,translation_sw,source,source_ref,text_key&language_id=eq.${languageId}&translation_sw=not.is.null` +
        `${last ? `&text_key=gt.${last}` : ''}&order=text_key&limit=1000`
    )
    for (const r of page) rows.push({ ...r, lang: code, sw: words(r.translation_sw) })
    if (page.length < 1000) break
    last = page[page.length - 1].text_key
  }
}

// A Bible name that ordinary Kenyan sentences also use (Daudi, Yusufu, Petro,
// Mungu) proves nothing, so names common outside KenTrans are ignored.
const corpusDf = new Map()
for (const r of rows) if (r.source !== 'KenTrans') for (const w of r.sw) corpusDf.set(w, (corpusDf.get(w) || 0) + 1)
const everyday = (w) => (corpusDf.get(w) || 0) > 3
for (const r of rows) r.marks = [...new Set(r.sw.filter((w) => !everyday(w)).map(bibleName).filter((n) => n && !everyday(n)))]

// KenTrans: in file order, look at the 6 sentences either side.
const RUN = 6
const byFile = {}
for (const r of rows) if (r.source === 'KenTrans' && r.source_ref) {
  const [file, line] = r.source_ref.split(':')
  ;(byFile[file] ??= []).push({ r, line: Number(line) })
}
for (const list of Object.values(byFile)) {
  list.sort((a, b) => a.line - b.line)
  list.forEach(({ r }, i) => {
    const around = list.slice(Math.max(0, i - RUN), i + RUN + 1).filter((x) => x.r !== r)
    r.runShare = around.filter((x) => x.r.marks.length > 0).length / Math.max(1, around.length)
  })
}

const verdict = (r) => (r.marks.length >= 2 ? 'words' : r.marks.length === 1 ? (r.runShare >= 0.3 ? 'word+run' : 'one word') : r.runShare >= 0.5 ? 'run' : null)
const found = rows.map((r) => ({ ...r, why: verdict(r) })).filter((r) => r.why)

const clean = (s) => String(s ?? '').replace(/[\t\r\n]+/g, ' ')
fs.mkdirSync('reports/bible-check', { recursive: true })
const file = `reports/bible-check/${new Date().toISOString().slice(0, 10)}.tsv`
found.sort((a, b) => a.lang.localeCompare(b.lang) || String(a.source_ref).localeCompare(String(b.source_ref), 'en', { numeric: true }))
fs.writeFileSync(file, ['why\tlang\tsource\tref\tbible words\ttext\tswahili\tid', ...found.map((f) => [f.why, f.lang, f.source, f.source_ref ?? '', f.marks.join(' '), clean(f.text), clean(f.translation_sw), f.id].join('\t'))].join('\n') + '\n')

const table = {}
const totals = {}
for (const r of rows) totals[`${r.lang} ${r.source}`] = (totals[`${r.lang} ${r.source}`] || 0) + 1
for (const f of found) {
  const k = `${f.lang} ${f.source}`
  table[k] ??= { pairs: totals[k], words: 0, 'word+run': 0, run: 0, 'one word': 0 }
  table[k][f.why]++
}
console.log(`checked ${rows.length} sentence pairs`)
console.table(table)
console.log('written to', file)
