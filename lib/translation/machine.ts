// Machine translation through LughaKonnect's private Hugging Face Space
// (services/translate-space/), NLLB-200 by Meta under CC BY-NC 4.0.
// Shown free and labelled; never saved into the dictionary (sql/124).

// NLLB-200 distilled 1.3B adapted to Dholuo and Kikuyu (services/finetune/).
// Also the key for saved answers, so changing it starts a fresh cache.
export const MACHINE_MODEL = 'Edveloper/lughakonnect-nllb'
export const MACHINE_LANGUAGES = new Set(['sw', 'en', 'luo', 'ki', 'kam', 'som'])
export const MACHINE_MAX_CHARS = 400

const SPACE_URL = 'https://edveloper-lughakonnect-translate.hf.space/gradio_api/call/translate'

export function machinePairSupported(from: string, to: string) {
  return from !== to && MACHINE_LANGUAGES.has(from) && MACHINE_LANGUAGES.has(to)
}

/** Whitespace collapsed, so "a  b" and "a b" are one request. */
export function cleanMachineInput(text: string) {
  return String(text ?? '').replace(/\s+/g, ' ').trim()
}

/**
 * Ask the Space. A Space that has been asleep takes a minute or two to wake,
 * so the wait is long; the page shows a note while it runs.
 */
export async function callTranslateSpace(text: string, from: string, to: string, timeoutMs = 120_000) {
  const token = process.env.HF_TOKEN
  if (!token) throw new Error('Machine translation is not configured.')
  const headers = { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' }
  const signal = AbortSignal.timeout(timeoutMs)

  const start = await fetch(SPACE_URL, { method: 'POST', headers, body: JSON.stringify({ data: [text, from, to] }), signal })
  if (!start.ok) throw new Error(`Space returned ${start.status}`)
  const { event_id } = (await start.json()) as { event_id?: string }
  if (!event_id) throw new Error('Space did not accept the request')

  const stream = await fetch(`${SPACE_URL}/${event_id}`, { headers, signal })
  const lines = (await stream.text()).trim().split('\n')
  const kind = lines.find((l) => l.startsWith('event:'))?.slice(6).trim()
  const data = lines.filter((l) => l.startsWith('data:')).pop()?.slice(5).trim()
  if (kind !== 'complete' || !data) throw new Error(`Space ${kind ?? 'gave no answer'}`)
  const [translation] = JSON.parse(data) as [string]
  return String(translation ?? '').trim()
}
