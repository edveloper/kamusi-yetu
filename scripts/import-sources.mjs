// Load licensed source sentences and the words they show we are missing.
//
//   node scripts/fetch-sources.mjs          # once, downloads the text
//   node scripts/import-sources.mjs          # dry run: counts and samples only
//   node scripts/import-sources.mjs --apply  # writes to source_sentences and headword_candidates
//
// Needs sql/121 applied, and SUPABASE_SERVICE_ROLE_KEY in .env.local for --apply.
//
// What is kept (agreed November 2026):
//   AfriVoices-KE read speech: only prompts the dataset team wrote themselves,
//     or from Amazon MASSIVE or MedQuAD (both CC BY 4.0). Prompts taken from
//     BBC, VOA and other news collections are left out of what we store,
//     because the news text belongs to those outlets. They still count towards
//     word frequencies, which copy no text.
//   AfriVoices-KE spontaneous speech: approved transcripts, annotation tags
//     such as [CS] and [pause] removed.
//   KenTrans: Dholuo-Kiswahili pairs, recased from capitals.
//   Common Voice (added November 2026): Swahili and Somali read sentences, CC0.
//   node scripts/import-sources.mjs --only=sw,som   loads just those two.
//   Added 20 November 2026, for training the translator on more languages:
//     thinkKenya pairs (Kidaw'ida, Kalenjin, Dholuo with Kiswahili), KenTrans
//     Luhya pairs (Bukusu, Marachi, Logooli), the Dholuo Common Voice release,
//     Common Voice Spontaneous Speech (Bukusu, Kiswahili) and CLEAR Global's
//     Gamayun Kiswahili kit. Bible passages are left out.
//   Everything: no damaged letters (? in place of ĩ or ũ), 3 to 30 words (2 for
//   sentence pairs, which the translator learns from), no repeats.

import fs from 'node:fs'

const APPLY = process.argv.includes('--apply')
const ROOT = 'data/sources'
const CLEAN_ORIGINS = new Set(['self', 'self-generated', 'amazon massive', 'medquad'])
const CANDIDATE_MIN_FREQUENCY = 5
const CANDIDATE_LIMIT = 3000

const env = Object.fromEntries(
  fs.readFileSync('.env.local', 'utf8').split(/\r?\n/).filter((l) => l.includes('='))
    .map((l) => [l.slice(0, l.indexOf('=')).trim(), l.slice(l.indexOf('=') + 1).trim().replace(/^"|"$/g, '')])
)
const URL_ = env.NEXT_PUBLIC_SUPABASE_URL
const KEY = env.SUPABASE_SERVICE_ROLE_KEY
const H = { apikey: KEY, Authorization: `Bearer ${KEY}`, 'Content-Type': 'application/json' }

// ---------------------------------------------------------------- helpers --
function parseCsv(text) {
  const delim = text.split('\n')[0].includes('\t') ? '\t' : ','
  const rows = []
  let row = [], cur = '', quoted = false
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (quoted) {
      if (c === '"') { if (text[i + 1] === '"') { cur += '"'; i++ } else quoted = false } else cur += c
      continue
    }
    if (c === '"') quoted = true
    else if (c === delim) { row.push(cur); cur = '' }
    else if (c === '\n') { row.push(cur.replace(/\r$/, '')); rows.push(row); row = []; cur = '' }
    else cur += c
  }
  if (cur || row.length) { row.push(cur); rows.push(row) }
  const head = rows[0]
  return rows.slice(1).filter((r) => r.length > 1).map((r) => Object.fromEntries(head.map((h, i) => [h, r[i] ?? ''])))
}

const FROM = 'ĩĨũŨẽẼãÃõÕáÁàÀâÂéÉèÈêÊíÍìÌîÎóÓòÒôÔúÚùÙûÛñÑçÇ'
const TO = 'iIuUeEaAoOaAaAaAeEeEeEiIiIiIoOoOoOuUuUuUnNcC'
const lkNormalize = (s) => {
  let t = ''
  for (const ch of String(s ?? '')) { const i = FROM.indexOf(ch); t += i >= 0 ? TO[i] : ch }
  return t.toLowerCase().replace(/[^a-z0-9 ]/g, ' ').replace(/\s+/g, ' ').trim()
}
const clean = (s) =>
  String(s ?? '')
    .replace(/\[\/?\s*(cs|pause|noise|laugh|\?)\s*\]/gi, ' ')
    .replace(/\((pause|cs|noise|laugh)\)/gi, ' ')
    .replace(/\s+/g, ' ')
    .trim()
const damaged = (s) => /\p{L}\?\p{L}|^\?\p{L}|\p{L}\?\s/u.test(s) || s.includes('�')
const wordCount = (s) => s.split(/\s+/).filter(Boolean).length

// Which language is a prompt in: Kiswahili, English, or the target language
// itself? Some prompts the dataset team wrote are already in Dholuo or Kikuyu,
// and storing those as a "translation" would be wrong. Function words give a
// first guess; vocabularies learned from the data itself then decide.
const SW = /\b(na|ya|wa|kwa|ni|za|katika|kuwa|hii|kama|cha|vya|la|kwamba|pia|sana|lakini)\b/gi
const EN = /\b(the|and|of|to|is|in|that|for|are|with|this|what|how|you|was)\b/gi
const tokens = (s) => s.normalize('NFC').toLowerCase().split(/[^\p{L}'’]+/u).filter((w) => w.length > 1)

function learnVocabularies(pairs) {
  const count = (texts) => {
    const m = new Map()
    for (const t of texts) for (const w of tokens(t)) m.set(w, (m.get(w) || 0) + 1)
    return new Set([...m.entries()].filter(([, n]) => n >= 10).map(([w]) => w))
  }
  const target = count(pairs.map((p) => p.text))
  const sw = count(pairs.filter((p) => (p.prompt.match(SW) || []).length >= 2 && !(p.prompt.match(EN) || []).length).map((p) => p.prompt))
  const en = count(pairs.filter((p) => (p.prompt.match(EN) || []).length >= 2 && !(p.prompt.match(SW) || []).length).map((p) => p.prompt))
  return { target, sw, en }
}

// Checked by hand on samples (November 2026): prompts are Kiswahili or English,
// never the target language, so the only question is which of the two. Words
// shared with the target language (na, wa, ya in Kikuyu) are not counted
// first; if that leaves nothing, every known word counts. No signal at all
// means no translation is stored, rather than a guess.
function languageOf(prompt, v) {
  let s = 0, e = 0, s2 = 0, e2 = 0
  for (const w of tokens(prompt)) {
    if (v.sw.has(w)) { s2++; if (!v.target.has(w)) s++ }
    if (v.en.has(w)) { e2++; if (!v.target.has(w)) e++ }
  }
  if (s !== e) return s > e ? 'sw' : 'en'
  if (s2 !== e2) return s2 > e2 ? 'sw' : 'en'
  return 'unknown'
}

const recase = (s) => {
  const lower = s.toLowerCase().trim()
  return lower.replace(/(^|[.!?]\s+)(\p{L})/gu, (_, a, b) => a + b.toUpperCase())
}

// ------------------------------------------------------------- AfriVoices --
function afrivoices(lang, repo) {
  const dir = `${ROOT}/afrivoices/${lang}`
  const kept = []
  const allText = []
  let skipped = { origin: 0, damaged: 0, length: 0, rejected: 0 }
  for (const file of fs.readdirSync(dir).filter((f) => f.includes('transcripts'))) {
    const spontaneous = file.includes('unscripted')
    for (const r of parseCsv(fs.readFileSync(`${dir}/${file}`, 'utf8'))) {
      const text = clean(spontaneous ? r.transcript || r.cleaned_transcript || r.audio_transcript : r.actualSentence)
      if (!text) continue
      if (!damaged(text)) allText.push(text)
      if (spontaneous && r.decision === 'rejected') { skipped.rejected++; continue }
      if (!spontaneous && !CLEAN_ORIGINS.has(String(r.sentenceSource ?? '').trim().toLowerCase())) { skipped.origin++; continue }
      if (damaged(text)) { skipped.damaged++; continue }
      // Annotation the tidy-up could not untangle, e.g. "[account name]cs".
      if (spontaneous && /[[\]]/.test(text)) { skipped.damaged++; continue }
      const n = wordCount(text)
      if (n < 3 || n > 30) { skipped.length++; continue }
      kept.push({
        text,
        prompt: spontaneous ? '' : clean(r.translatedText),
        translation_en: null,
        translation_sw: null,
        source: 'AfriVoices-KE',
        source_url: `https://huggingface.co/datasets/${repo}`,
        source_origin: spontaneous ? 'spontaneous speech' : String(r.sentenceSource ?? '').trim(),
        source_ref: String(r.mediaPathId ?? '').trim() || null,
        kind: spontaneous ? 'spontaneous' : 'read',
        domain: String(r.topic || r.domain || '').trim() || null,
        dialect: String(r.sentenceDialect || '').trim() || null,
      })
    }
  }
  // Second pass: with the vocabularies known, decide each prompt's language,
  // then drop the working field so it is not sent to the database.
  const v = learnVocabularies(kept.filter((k) => k.prompt))
  const languages = {}
  const samples = {}
  const rows = kept.map(({ prompt, ...row }) => {
    const lang = prompt ? languageOf(prompt, v) : 'none'
    languages[lang] = (languages[lang] || 0) + 1
    if (process.argv.includes('--sample') && (samples[lang] ??= []).length < 5 && Math.random() < 0.01) {
      samples[lang].push(`${prompt.slice(0, 80)}  =>  ${row.text.slice(0, 60)}`)
    }
    return { ...row, translation_en: lang === 'en' ? prompt : null, translation_sw: lang === 'sw' ? prompt : null }
  })
  for (const [lang, list] of Object.entries(samples)) console.log(`  [${lang}]\n    ` + list.join('\n    '))
  return { kept: rows, allText, skipped, languages }
}

// --------------------------------------------------------------- KenTrans --
// Bible passages are left out (agreed November 2026): the translations belong
// to Bible publishers, and they would make the translator sound like
// scripture. Parts of the Bukusu and Logooli files retell Bible books, so a
// line naming a Bible figure or place is skipped. This catches most of them,
// not every verse.
const BIBLE = /\b(yuda|isiraeli|israeli|yosefu|yosefa|farao|daudi|yakobo|aburahamu|ibrahimu|abrahamu|misri|yerusalemu|musa|elamu|yokitani|kanaani|bakanaani|filisti|bafilisti|beteli|manase|efuraimu|lawi|benjamini|samueli|sauli|amoni|moabu|nuhu|isaka|esau|yesu|kristo|yesoo|yoshua|baraka|debora|lapidothi|taboru|gideoni|samsoni|yebusi|bayebusi|shemu|aramu|arifakisati|mesha|sefari|ebari|peleki|horima|ashikeloni|ekironi|sidoni|hebroni|ahabu|eliya|elisha|solomoni|sulemani|rehobu|afeki)\b/i
// A capitalised heading such as "OBULWARE OBWA KORONA." is recased; ordinary
// text is left as written.
const shouting = (s) => { const letters = s.replace(/[^\p{L}]/gu, ''); return letters.length > 3 && letters === letters.toUpperCase() }
const tidyCase = (s) => (shouting(s) ? recase(s) : s)

function kentrans(file, origin, domain) {
  const lines = fs.readFileSync(`${ROOT}/kentrans/${file}`, 'utf8').split(/\r?\n/)
  const kept = []
  let bible = 0
  for (let i = 0; i < lines.length; i++) {
    if (!lines[i].startsWith('O:')) continue
    // Usually "O:" and "T:" are consecutive lines; some Bukusu lines carry both.
    let [o, t] = lines[i].includes(' T: ') ? lines[i].split(' T: ') : [lines[i], lines[i + 1]]
    if (!t?.replace(/^\s*/, '').startsWith('T:') && !lines[i].includes(' T: ')) continue
    t = t.replace(/^\s*T:/, '')
    // Notes in English, e.g. "(a story encouraging benevolence)", are removed.
    const text = tidyCase(clean(o.slice(2).replace(/\([^)]*\)/g, (m) => ((m.match(EN) || []).length >= 2 ? ' ' : m))))
    const sw = tidyCase(clean(t))
    if (BIBLE.test(text) || BIBLE.test(sw)) { bible++; continue }
    const n = wordCount(text)
    if (!text || !sw || n < 2 || n > 30 || damaged(text) || /\t|\s-\s/.test(o)) continue
    kept.push({
      text, translation_en: null, translation_sw: sw,
      source: 'KenTrans', source_url: 'https://huggingface.co/datasets/Kencorpus/KenTrans',
      source_origin: origin, source_ref: `${file}:${i + 1}`,
      kind: 'parallel', domain, dialect: null,
    })
  }
  if (bible) console.log(`  ${file}: ${bible} Bible lines left out`)
  return kept
}

// ------------------------------------------------------------- thinkKenya --
// Low-Resource Language Data (CC BY 4.0): sentence pairs with Kiswahili, made
// for training translation. Both the train and test files are stored; our own
// held-out slice (text_key starting 00) is what the translation test uses.
async function thinkKenya(config) {
  const { parquetReadObjects } = await import('hyparquet')
  const lang = config.slice(0, 3)
  const kept = []
  for (const split of ['train', 'test']) {
    const buf = fs.readFileSync(`${ROOT}/thinkkenya/${config}_${split}.parquet`)
    const rows = await parquetReadObjects({ file: buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteLength) })
    for (const r of rows) {
      const text = tidyCase(clean(r.translation?.[lang]))
      const sw = tidyCase(clean(r.translation?.swa))
      const n = wordCount(text)
      if (!text || !sw || n < 2 || n > 30 || damaged(text) || text.toLowerCase() === sw.toLowerCase()) continue
      if (BIBLE.test(text) || BIBLE.test(sw)) continue
      kept.push({
        text, translation_en: null, translation_sw: sw,
        source: 'thinkKenya', source_url: 'https://huggingface.co/datasets/thinkKenya/kenyan-low-resource-language-data',
        source_origin: 'Low-Resource Language Data', source_ref: `${config}/${split}:${r.id}`,
        licence: 'CC-BY-4.0', kind: 'parallel', domain: null, dialect: null,
      })
    }
  }
  return kept
}

// ----------------------------------------------------- CLEAR Global Gamayun --
// Kiswahili translations of everyday English sentences from Tatoeba, by
// professional translators (CC BY 4.0, from Mozilla Data Collective). Unpack
// with: tar -xzf <file>.tar.gz -C data/sources/mdc/text
function gamayunSwahili() {
  const file = `${ROOT}/mdc/text/CLEAR_Gamayun_swa-eng_5k/kit5k.tsv`
  if (!fs.existsSync(file)) return []
  const [, ...lines] = fs.readFileSync(file, 'utf8').split(/\r?\n/)
  const kept = []
  lines.forEach((line, i) => {
    const [en, sw] = line.split('\t').map(clean)
    const n = wordCount(sw ?? '')
    if (!en || !sw || n < 2 || n > 30 || damaged(sw)) return
    kept.push({
      text: sw, translation_en: en, translation_sw: null,
      source: 'CLEAR Global', source_url: 'https://mozilladatacollective.com/datasets/cmoskxn8k00vtmj07ubxtu0f2',
      source_origin: 'Gamayun kit, English from Tatoeba', source_ref: `kit5k.tsv:${i + 2}`,
      licence: 'CC-BY-4.0', kind: 'parallel', domain: null, dialect: null,
    })
  })
  return kept
}

// ---------------------------------------- Common Voice Spontaneous Speech --
// Spoken answers to questions, written down by volunteers (CC0, from Mozilla
// Data Collective). The questions are in the same language and are kept too.
// Recordings someone reported are skipped. Unpack the text only with:
//   tar -xzf <file>.tar.gz -C data/sources/mdc/text --wildcards --no-anchored '*.tsv'
const SPONTANEOUS = {
  bxk: 'https://mozilladatacollective.com/datasets/cmu5ner0d00uwmi078sjx1bgq',
  sw: 'https://mozilladatacollective.com/datasets/cmu5m0d8l00remh07n4t18drh',
}
function spontaneous(locale) {
  const base = `${ROOT}/mdc/text`
  const dir = fs.existsSync(base) && fs.readdirSync(base).find((d) => d.startsWith('sps-corpus-') && d.endsWith(`-${locale}`))
  if (!dir) return []
  const read = (name) => {
    const path = `${base}/${dir}/${name}`
    if (!fs.existsSync(path)) return []
    const [head, ...lines] = fs.readFileSync(path, 'utf8').split(/\r?\n/)
    const col = Object.fromEntries(head.split('\t').map((h, i) => [h, i]))
    return lines.filter(Boolean).map((l) => { const c = l.split('\t'); return Object.fromEntries(Object.entries(col).map(([k, i]) => [k, c[i] ?? ''])) })
  }
  const reported = new Set(read(`ss-reported-audios-${locale}.tsv`).map((r) => r.audio_id))
  const kept = []
  for (const r of read(`ss-corpus-${locale}.tsv`)) {
    if (reported.has(r.audio_id)) continue
    for (const [text, ref] of [[clean(r.transcription), `audio ${r.audio_id}`], [clean(r.prompt), `prompt ${r.prompt_id}`]]) {
      const n = wordCount(text)
      if (!text || n < 3 || n > 30 || damaged(text) || /[[\]]/.test(text)) continue
      kept.push({
        text, translation_en: null, translation_sw: null,
        source: 'Common Voice', source_url: SPONTANEOUS[locale],
        source_origin: ref.startsWith('prompt') ? 'spontaneous speech questions' : 'spontaneous speech',
        source_ref: ref, licence: 'CC0-1.0', kind: ref.startsWith('prompt') ? 'read' : 'spontaneous',
        domain: null, dialect: String(r.variant || '').trim() || null,
      })
    }
  }
  return kept
}

// ----------------------------------------------------------- Common Voice --
// Sentences volunteers read aloud (CC0). Files named after a dialect, such as
// sw-kimvita.txt, are tagged with it. Sentence Collector and Wikipedia files
// are credited as such, the rest as volunteer contributions.
function commonVoice(locale) {
  const dir = `${ROOT}/commonvoice/${locale}`
  if (!fs.existsSync(dir)) return []
  const kept = []
  for (const file of fs.readdirSync(dir).filter((f) => f.endsWith('.txt'))) {
    const dialectMatch = file.match(/^[a-z]+-(ki[a-z]+|baratz)\.txt$/)
    const dialect = dialectMatch ? dialectMatch[1][0].toUpperCase() + dialectMatch[1].slice(1) : null
    const origin = file.startsWith('wiki.')
      ? 'Wikipedia sentences'
      : file.startsWith('sentence-collector')
        ? 'Sentence Collector'
        : dialect
          ? `${dialect} sentences`
          : 'volunteer sentences'
    const domain = /livestock|agriculture/.test(file) ? 'Agriculture' : null
    fs.readFileSync(`${dir}/${file}`, 'utf8').split(/\r?\n/).forEach((line, i) => {
      const text = clean(line)
      const n = wordCount(text)
      if (!text || n < 3 || n > 30 || damaged(text)) return
      kept.push({
        text, translation_en: null, translation_sw: null,
        source: 'Common Voice',
        source_url: `https://github.com/common-voice/common-voice/blob/main/server/data/${locale}/${file}`,
        source_origin: origin, source_ref: `${file}:${i + 1}`,
        licence: 'CC0-1.0', kind: 'read', domain, dialect,
      })
    })
  }
  return kept
}

// Common Voice releases from Mozilla Data Collective (CC0), for languages that
// are not in the public repository. Only validated_sentences.tsv is read: the
// sentences that passed Common Voice's own review. The other files in the
// release describe recordings and speakers and are never touched. Extract with
//   tar -xzf <release>.tar.gz -C <locale>/text --wildcards --no-anchored '*.tsv'
const MDC = {
  dav: 'https://mozilladatacollective.com/datasets/cmu5w2bh700aso107ffpduqpp',
  kln: 'https://mozilladatacollective.com/datasets/cmu5webje00bgo1079qb3nubj',
  luo: 'https://mozilladatacollective.com/datasets/cmu5wfvfn00bso107clj45iop',
}
function commonVoiceRelease(locale) {
  const base = `${ROOT}/commonvoice/${locale}/text`
  const release = fs.existsSync(base) ? fs.readdirSync(base).find((d) => d.startsWith('cv-corpus-')) : null
  const file = release && `${base}/${release}/${locale}/validated_sentences.tsv`
  if (!file || !fs.existsSync(file)) throw new Error(`No validated_sentences.tsv for ${locale}`)
  // Plain tab-separated lines: Common Voice does not quote, and sentences may
  // contain quote marks, so the CSV reader is not used here.
  const [head, ...lines] = fs.readFileSync(file, 'utf8').split(/\r?\n/)
  const col = Object.fromEntries(head.split('\t').map((h, i) => [h, i]))
  const kept = []
  for (const line of lines) {
    const cells = line.split('\t')
    const text = clean(cells[col.sentence])
    const n = wordCount(text)
    if (!text || n < 3 || n > 30 || damaged(text)) continue
    const domain = String(cells[col.sentence_domain] ?? '').trim()
    kept.push({
      text, translation_en: null, translation_sw: null,
      source: 'Common Voice',
      source_url: MDC[locale],
      source_origin: `volunteer sentences, ${release.replace('cv-corpus-', 'release ').replace(/-\d{4}-\d{2}-\d{2}$/, '')}`,
      source_ref: String(cells[col.sentence_id] ?? '').trim() || null,
      licence: 'CC0-1.0', kind: 'read',
      domain: domain && domain !== 'general' ? domain.replace(/_/g, ' ') : null,
      dialect: String(cells[col.variant] ?? '').trim() || null,
    })
  }
  return kept
}

// -------------------------------------------------------------- the words --
// Names are not dictionary words. A word that is capitalised in most of the
// places it appears away from the start of a sentence (Mandela, Siberia) is
// treated as a name and left off the list.
function candidates(texts, existingKeys) {
  const freq = new Map()
  const spelling = new Map()
  const inner = new Map()
  const capitalised = new Map()
  for (const t of texts) {
    const raws = t.normalize('NFC').split(/[^\p{L}'’]+/u).filter(Boolean)
    raws.forEach((original, position) => {
      const w = original.toLowerCase().replace(/^['’]+|['’]+$/g, '')
      if (w.length < 2) return
      const key = lkNormalize(w)
      if (!key || key.includes(' ')) return
      freq.set(key, (freq.get(key) || 0) + 1)
      const forms = spelling.get(key) ?? new Map()
      forms.set(w, (forms.get(w) || 0) + 1)
      spelling.set(key, forms)
      if (position > 0) {
        inner.set(key, (inner.get(key) || 0) + 1)
        if (/^\p{Lu}/u.test(original)) capitalised.set(key, (capitalised.get(key) || 0) + 1)
      }
    })
  }
  const isName = (key) => (inner.get(key) || 0) >= 3 && (capitalised.get(key) || 0) / inner.get(key) > 0.6
  return [...freq.entries()]
    .filter(([key, n]) => n >= CANDIDATE_MIN_FREQUENCY && !existingKeys.has(key) && !isName(key))
    .sort((a, b) => b[1] - a[1])
    .slice(0, CANDIDATE_LIMIT)
    .map(([key, n], i) => ({
      word: [...spelling.get(key).entries()].sort((a, b) => b[1] - a[1])[0][0],
      word_key: key,
      frequency: n,
      rank: i + 1,
    }))
}

// -------------------------------------------------------------------- run --
async function rest(path, init = {}) {
  const res = await fetch(`${URL_}/rest/v1/${path}`, { ...init, headers: { ...H, ...(init.headers || {}) } })
  if (!res.ok) throw new Error(`${res.status} ${path}: ${(await res.text()).slice(0, 300)}`)
  return res.status === 204 ? null : res.json().catch(() => null)
}

async function existingHeadwordKeys(languageId) {
  const keys = new Set()
  for (let from = 0; ; from += 1000) {
    const rows = await rest(`entries?select=headword&language_id=eq.${languageId}&validation_status=neq.archived&order=id`, { headers: { Range: `${from}-${from + 999}` } })
    for (const r of rows) keys.add(lkNormalize(r.headword))
    if (rows.length < 1000) break
  }
  return keys
}

async function insertBatches(table, rows, conflict) {
  for (let i = 0; i < rows.length; i += 500) {
    // A dropped connection is retried; repeats are ignored by the database.
    for (let attempt = 1; ; attempt++) {
      try {
        await rest(`${table}?on_conflict=${conflict}`, {
          method: 'POST',
          headers: { Prefer: 'resolution=ignore-duplicates,return=minimal' },
          body: JSON.stringify(rows.slice(i, i + 500)),
        })
        break
      } catch (err) {
        if (attempt >= 4 || !/fetch failed|ECONNRESET|5\d\d /.test(String(err?.message ?? err))) throw err
        await new Promise((r) => setTimeout(r, 2000 * attempt))
      }
    }
    process.stdout.write(`\r  ${table}: ${Math.min(i + 500, rows.length)} / ${rows.length}`)
  }
  process.stdout.write('\n')
}

// A sentence stored earlier without a translation (from Common Voice, say) is
// skipped by the insert when a new source brings the same sentence with one.
// Such rows take the new source's row, translation and credit included. Rows
// that already have a translation are never changed.
async function attachTranslations(languageId, rows) {
  const { createHash } = await import('node:crypto')
  const keyOf = (r) => createHash('md5').update(r.text.toLowerCase()).digest('hex')
  const translated = rows.filter((r) => r.translation_en || r.translation_sw)
  // Looked up by key, a few hundred at a time, so the unique index does the work.
  const bare = new Map()
  for (let i = 0; i < translated.length; i += 200) {
    const keys = translated.slice(i, i + 200).map(keyOf)
    const page = await rest(
      `source_sentences?select=id,text_key&language_id=eq.${languageId}&text_key=in.(${keys.join(',')})` +
        `&translation_en=is.null&translation_sw=is.null`
    )
    for (const r of page) bare.set(r.text_key, r.id)
  }
  const updates = translated.map((r) => ({ id: bare.get(keyOf(r)), ...r })).filter((r) => r.id)
  if (!updates.length) return
  for (let i = 0; i < updates.length; i += 500) {
    await rest('source_sentences?on_conflict=id', {
      method: 'POST',
      headers: { Prefer: 'resolution=merge-duplicates,return=minimal' },
      body: JSON.stringify(updates.slice(i, i + 500)),
    })
  }
  console.log(`  ${updates.length} sentences already stored without a translation now have one`)
}

// Our language code, and where its sentences come from.
// Sources with translations come first, so a sentence found in two places
// keeps the copy that has one.
const only_ = (kept) => ({ kept, allText: [], skipped: {}, languages: {} })
const SOURCES = {
  luo: async () => {
    const av = afrivoices('luo', 'Anv-ke/Dholuo')
    return { ...av, kept: [...av.kept, ...kentrans('dho_combined.txt', 'Kencorpus radio transcripts', 'News and Media'), ...(await thinkKenya('luo_swa')), ...commonVoiceRelease('luo')] }
  },
  ki: async () => afrivoices('ki', 'Anv-ke/kikuyu'),
  sw: async () => only_([...gamayunSwahili(), ...commonVoice('sw'), ...spontaneous('sw')]),
  som: async () => only_(commonVoice('so')),
  dav: async () => only_([...(await thinkKenya('dav_swa')), ...commonVoiceRelease('dav')]),
  kal: async () => only_([...(await thinkKenya('kln_swa')), ...commonVoiceRelease('kln')]),
  // Luhya: KenTrans covers Bukusu, Marachi (our lri) and Logooli (our rag).
  bxk: async () => only_([...kentrans('lbk_combined.txt', 'Kencorpus texts', null), ...spontaneous('bxk')]),
  lri: async () => only_(kentrans('lch_combined.txt', 'Kencorpus texts', null)),
  rag: async () => only_(kentrans('llg_combined.txt', 'Kencorpus texts', null)),
}
// --only=sw,som loads just those languages; the default is all of them.
const only = (process.argv.find((a) => a.startsWith('--only=')) ?? '').slice(7).split(',').filter(Boolean)
const codes = only.length ? only : Object.keys(SOURCES)

const languages = await rest(`languages?select=id,code&code=in.(${codes.join(',')})`)
const idOf = Object.fromEntries(languages.map((l) => [l.code, l.id]))

for (const code of codes) {
  if (!SOURCES[code] || !idOf[code]) throw new Error(`No source or language for ${code}`)
  const av = await SOURCES[code]()
  // Every row sends the same columns (PostgREST needs that within a batch).
  const rows = av.kept.map((r) => ({ licence: 'CC-BY-4.0', ...r }))

  // One copy of each sentence per language.
  const seen = new Set()
  const unique = rows.filter((r) => {
    const k = r.text.toLowerCase()
    if (seen.has(k)) return false
    seen.add(k)
    return true
  }).map((r) => ({ ...r, language_id: idOf[code] }))

  const existing = await existingHeadwordKeys(idOf[code])
  const words = candidates([...av.allText, ...unique.map((r) => r.text)], existing)
    .map((w) => ({ ...w, language_id: idOf[code] }))

  const by = (k) => unique.reduce((a, r) => ((a[r[k] ?? 'none'] = (a[r[k] ?? 'none'] || 0) + 1), a), {})
  console.log(`\n${code}: ${unique.length} sentences to store`, JSON.stringify(by('kind')))
  console.log('  with English', unique.filter((r) => r.translation_en).length, '| with Kiswahili', unique.filter((r) => r.translation_sw).length)
  console.log('  left out', JSON.stringify(av.skipped))
  console.log('  prompt language', JSON.stringify(av.languages))
  console.log(`  ${words.length} missing words; top 15:`, words.slice(0, 15).map((w) => `${w.word}(${w.frequency})`).join(' '))
  console.log('  sample:', JSON.stringify(unique[Math.floor(unique.length / 3)]).slice(0, 300))

  if (APPLY) {
    await insertBatches('source_sentences', unique, 'language_id,text_key')
    await attachTranslations(idOf[code], unique)
    await insertBatches('headword_candidates', words, 'language_id,word_key')
  }
}
if (!APPLY) console.log('\nDry run. Nothing was written. Run with --apply to load.')
