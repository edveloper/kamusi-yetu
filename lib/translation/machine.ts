// Machine translation through LughaKonnect's private Hugging Face Space
// (services/translate-space/), NLLB-200 by Meta under CC BY-NC 4.0.
// Shown free and labelled; never saved into the dictionary (sql/124).

// NLLB-200 distilled 1.3B adapted by LughaKonnect (services/finetune/), run 2
// on the Space's MODEL_REVISION. Also the key for saved answers, so changing it
// starts a fresh cache.
export const MACHINE_MODEL = 'Edveloper/lughakonnect-nllb@run2'
// Bukusu (bxk) is in the run 2 model but not offered: nearly all it learned
// from was Bible text, since removed from the data (2026-11-21). It returns
// when there are real Bukusu sentence pairs to train on.
export const MACHINE_LANGUAGES = new Set(['sw', 'en', 'luo', 'ki', 'kam', 'som', 'dav', 'kal', 'rag', 'lri'])
// New to the model in run 2 and learned from Kiswahili pairs only (Kidaw'ida,
// Kalenjin, and the Luhya dialects Logooli and Marachi). Labelled Early.
export const EARLY_MACHINE_LANGUAGES = new Set(['dav', 'kal', 'rag', 'lri'])
export const MACHINE_MAX_CHARS = 400

export function machinePairIsEarly(from: string, to: string) {
  return EARLY_MACHINE_LANGUAGES.has(from) || EARLY_MACHINE_LANGUAGES.has(to)
}

/**
 * How far machine translation has come in each language, for the public pages.
 *   trained  trained on LughaKonnect's sentence pairs and tested on sentences it never saw
 *   early    new to the model, learning from a smaller set; labelled Early on Translate
 *   base     Meta's model as it comes, not yet trained on our data
 *   bridge   Kiswahili: the model already handles it well, and the others
 *            translate through it
 * A language not listed has no machine translation yet.
 */
export type MachineLevel = 'trained' | 'early' | 'base' | 'bridge'

export function machineLevel(code: string): MachineLevel | null {
  if (!MACHINE_LANGUAGES.has(code) || code === 'en') return null
  if (code === 'sw') return 'bridge'
  if (EARLY_MACHINE_LANGUAGES.has(code)) return 'early'
  if (code === 'kam' || code === 'som') return 'base'
  return 'trained'
}

/**
 * The held-out test: chrF, 0 to 100, against a speaker's own translation, on
 * sentences the model never saw in training (scripts in services/finetune and
 * reports/translation). Kiswahili both ways. null means not measured yet.
 */
export const MACHINE_TEST = {
  date: '21 November 2026',
  scores: {
    ki: { toSwahili: 66.1, fromSwahili: 63.6, sentences: 174 },
    luo: { toSwahili: 53.3, fromSwahili: 52.4, sentences: 281 },
    dav: { toSwahili: 48.1, fromSwahili: 46.5, sentences: 336 },
    kal: { toSwahili: 31.9, fromSwahili: 29.2, sentences: 386 },
    rag: { toSwahili: 35.3, fromSwahili: null, sentences: 181 },
    lri: { toSwahili: null, fromSwahili: null, sentences: 116 },
  } as Record<string, { toSwahili: number | null; fromSwahili: number | null; sentences: number }>,
}

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
  if (kind !== 'complete' || !data) {
    // An "error" event carries the reason, e.g. "ZeroGPU quota exceeded".
    throw new Error(`Space ${kind ?? 'gave no answer'}: ${String(data ?? '').slice(0, 300)}`)
  }
  const [translation] = JSON.parse(data) as [string]
  return String(translation ?? '').trim()
}
