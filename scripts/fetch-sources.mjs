// Download the text parts of the licensed source datasets into data/sources/.
// Audio is never downloaded. Needs HF_TOKEN in .env.local (read-only token).
//
//   node scripts/fetch-sources.mjs
//
// AfriVoices-KE (CC BY 4.0, https://huggingface.co/Anv-ke): transcripts.csv and
// meta.csv for each split. KenTrans (CC BY 4.0): Dholuo-Swahili sentence pairs.
import fs from 'node:fs'
import path from 'node:path'

const env = Object.fromEntries(
  fs.readFileSync('.env.local', 'utf8').split(/\r?\n/).filter((l) => l.includes('='))
    .map((l) => [l.slice(0, l.indexOf('=')).trim(), l.slice(l.indexOf('=') + 1).trim().replace(/^"|"$/g, '')])
)
const H = env.HF_TOKEN ? { Authorization: `Bearer ${env.HF_TOKEN}` } : {}
const OUT = 'data/sources'

async function get(url, dest) {
  if (fs.existsSync(dest)) return console.log('have', dest)
  const res = await fetch(url, { headers: H })
  if (!res.ok) throw new Error(`${res.status} ${url}`)
  fs.mkdirSync(path.dirname(dest), { recursive: true })
  fs.writeFileSync(dest, Buffer.from(await res.arrayBuffer()))
  console.log('got ', dest, (fs.statSync(dest).size / 1e6).toFixed(1) + 'MB')
}

for (const [repo, short] of [['Anv-ke/Dholuo', 'luo'], ['Anv-ke/kikuyu', 'ki']]) {
  for (const split of ['train', 'dev', 'dev_test']) {
    for (const kind of ['scripted', 'unscripted']) {
      for (const file of ['transcripts.csv', 'meta.csv']) {
        await get(
          `https://huggingface.co/datasets/${repo}/resolve/main/${split}/${kind}/files/${file}`,
          `${OUT}/afrivoices/${short}/${split}-${kind}-${file}`
        )
      }
    }
  }
}
await get('https://huggingface.co/datasets/Kencorpus/KenTrans/resolve/main/data/dho/dho_combined.txt', `${OUT}/kentrans/dho_combined.txt`)
