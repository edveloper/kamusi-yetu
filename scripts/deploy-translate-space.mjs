// Upload services/translate-space/ to the Hugging Face Space as one commit.
//
//   node --env-file=.env.local scripts/deploy-translate-space.mjs
//
// Needs HF_WRITE_TOKEN in .env.local: a fine-grained token that can write to
// this Space only.
import fs from 'node:fs'
import path from 'node:path'

const SPACE = 'Edveloper/lughakonnect-translate'
const DIR = 'services/translate-space'
const token = process.env.HF_WRITE_TOKEN
if (!token) throw new Error('HF_WRITE_TOKEN is not set in .env.local')

const files = fs.readdirSync(DIR).filter((f) => fs.statSync(path.join(DIR, f)).isFile())
const lines = [
  { key: 'header', value: { summary: `Deploy from LughaKonnect (${new Date().toISOString().slice(0, 16)})` } },
  ...files.map((f) => ({
    key: 'file',
    value: { path: f, encoding: 'base64', content: fs.readFileSync(path.join(DIR, f)).toString('base64') },
  })),
]

const res = await fetch(`https://huggingface.co/api/spaces/${SPACE}/commit/main`, {
  method: 'POST',
  headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/x-ndjson' },
  body: lines.map((l) => JSON.stringify(l)).join('\n'),
})
const body = await res.text()
if (!res.ok) throw new Error(`${res.status}: ${body.slice(0, 300)}`)
console.log('Uploaded', files.join(', '), '->', JSON.parse(body).commitUrl ?? 'ok')
