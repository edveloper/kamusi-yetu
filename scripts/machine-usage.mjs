// How much the machine translator is used, and how often it turns people away.
//
//   node --env-file=.env.local scripts/machine-usage.mjs          last 14 days
//   node --env-file=.env.local scripts/machine-usage.mjs --days=30
//
// Reads only. "New" are answers the Space had to make (they cost GPU time);
// "repeats" are later requests served from the saved answers (free).
// "Turned away" comes from sql/125 and is empty until that migration has run.

const DAYS = Number((process.argv.find((a) => a.startsWith('--days=')) ?? '').slice(7)) || 14
const URL_ = process.env.NEXT_PUBLIC_SUPABASE_URL
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!URL_ || !KEY) throw new Error('Run with --env-file=.env.local')
const H = { apikey: KEY, Authorization: `Bearer ${KEY}` }

async function all(path) {
  const rows = []
  for (let from = 0; ; from += 1000) {
    const res = await fetch(`${URL_}/rest/v1/${path}&offset=${from}&limit=1000`, { headers: H })
    if (!res.ok) return { error: `${res.status} ${(await res.text()).slice(0, 120)}`, rows }
    const page = await res.json()
    rows.push(...page)
    if (page.length < 1000) return { rows }
  }
}

const since = new Date(Date.now() - DAYS * 86_400_000).toISOString().slice(0, 10)
const made = await all(`machine_translations?select=created_at,last_used_at,hits,source_code,target_code&last_used_at=gte.${since}&order=created_at`)
const failures = await all(`machine_translation_failures?select=day,source_code,target_code,reason,count&day=gte.${since}&order=day`)

const days = {}
const row = (d) => (days[d] ??= { new: 0, repeats: 0, quota: 0, busy: 0, unavailable: 0 })
const pairs = {}
for (const r of made.rows) {
  const d = r.created_at.slice(0, 10)
  if (d >= since) row(d).new++
  // Repeats are not dated one by one; they are counted on the day last used.
  row(r.last_used_at.slice(0, 10)).repeats += Math.max(0, Number(r.hits) - 1)
  const p = `${r.source_code} -> ${r.target_code}`
  pairs[p] = (pairs[p] || 0) + Number(r.hits)
}
for (const f of failures.rows) row(f.day)[f.reason] += f.count

console.log(`Machine translation, last ${DAYS} days`)
console.table(Object.fromEntries(Object.entries(days).sort()))
console.log('Requests by language pair (new and repeats)')
console.table(Object.fromEntries(Object.entries(pairs).sort((a, b) => b[1] - a[1]).slice(0, 20)))
if (failures.error) console.log('Turned away: not recorded yet (run sql/125_machine_translation_failures.sql).')
