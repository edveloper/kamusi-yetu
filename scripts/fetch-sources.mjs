// Download the text parts of the licensed source datasets into data/sources/.
// Audio is never downloaded. Needs HF_TOKEN in .env.local (read-only token).
//
//   node scripts/fetch-sources.mjs
//
// AfriVoices-KE (CC BY 4.0, https://huggingface.co/Anv-ke): transcripts.csv and
// meta.csv for each split. KenTrans (CC BY 4.0): Dholuo and Luhya sentence
// pairs with Swahili. thinkKenya (CC BY 4.0): Kidaw'ida, Kalenjin and Dholuo
// pairs with Swahili. Common Voice (CC0): Swahili and Somali sentences.
//
// Downloaded by hand from Mozilla Data Collective (needs an account), into
// data/sources/mdc/<name>/ and unpacked as the import script describes:
// Common Voice releases, Common Voice Spontaneous Speech, and CLEAR Global's
// Gamayun Swahili kit.
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
  // The token only ever goes to Hugging Face.
  const res = await fetch(url, { headers: url.startsWith('https://huggingface.co/') ? H : {} })
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
// KenTrans: Dholuo, and the three Luhya dialects (Bukusu lbk, Marachi lch,
// Logooli llg), each against Kiswahili.
for (const file of ['dho', 'lbk', 'lch', 'llg']) {
  await get(`https://huggingface.co/datasets/Kencorpus/KenTrans/resolve/main/data/${file}/${file}_combined.txt`, `${OUT}/kentrans/${file}_combined.txt`)
}

// thinkKenya Low-Resource Language Data (CC BY 4.0, gated with automatic
// approval: accept the terms once on the dataset page). Kidaw'ida, Kalenjin
// and Dholuo, each against Kiswahili.
for (const config of ['dav_swa', 'kln_swa', 'luo_swa']) {
  for (const split of ['train', 'test']) {
    await get(
      `https://huggingface.co/datasets/thinkKenya/kenyan-low-resource-language-data/resolve/main/${config}/${split}-00000-of-00001.parquet`,
      `${OUT}/thinkkenya/${config}_${split}.parquet`
    )
  }
}

// Common Voice (CC0): the sentences volunteers read aloud, as published in the
// project's repository. Swahili and Somali are there; newer languages such as
// Kidaw'ida only come with the full downloads from Mozilla Data Collective.
for (const locale of ['sw', 'so']) {
  const res = await fetch(`https://api.github.com/repos/common-voice/common-voice/contents/server/data/${locale}`)
  if (!res.ok) throw new Error(`${res.status} Common Voice listing for ${locale}`)
  for (const file of await res.json()) {
    if (file.type === 'file' && file.name.endsWith('.txt')) {
      await get(file.download_url, `${OUT}/commonvoice/${locale}/${file.name}`)
    }
  }
}
