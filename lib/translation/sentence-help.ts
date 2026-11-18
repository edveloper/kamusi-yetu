// What the Translate page offers when a sentence has no recorded translation
// as a whole: each word on its own, and real sentence pairs that are close.
// Server only (uses the engine's service client).

import { getClient, runTranslation } from '@/lib/translation/engine'
import { words } from '@/lib/translation/evaluation'

export const MAX_BREAKDOWN_WORDS = 12
/** Below this, a "similar" pair mostly shares common words like na and ya. */
export const SIMILAR_MIN_SCORE = 0.35

export type WordHelp = {
  word: string
  translation: string | null
  entryId: string | null
}

/**
 * Each word's best answer, in the order typed. A word with none is still
 * listed, and its miss is logged as a gap: that is a precise request for the
 * one word a real sentence needed.
 */
export async function wordByWord(text: string, sourceLanguageId: string, targetLanguageId: string): Promise<WordHelp[]> {
  const list = words(text).slice(0, MAX_BREAKDOWN_WORDS)
  const answers = new Map<string, Promise<WordHelp>>()
  for (const word of list) {
    const key = word.toLowerCase()
    if (answers.has(key)) continue
    answers.set(
      key,
      runTranslation({ text: word, sourceLanguageId, targetLanguageId, limit: 1 }).then((outcome) => {
        const best = outcome.ok ? outcome.result[0] : undefined
        return { word, translation: best?.translation ?? null, entryId: best?.target_entry_id ?? null }
      })
    )
  }
  const settled = new Map<string, WordHelp>()
  await Promise.all([...answers.entries()].map(async ([key, p]) => settled.set(key, await p)))
  return list.map((word) => ({ ...settled.get(word.toLowerCase())!, word }))
}

export type SimilarPair = {
  id: string
  /** The sentence in the language that was typed. */
  from: string
  /** The same sentence in the language asked for. */
  to: string
  source: string
  sourceOrigin: string | null
  sourceUrl: string | null
  licence: string
  score: number
}

type Row = {
  id: string
  text: string
  translation_en: string | null
  translation_sw: string | null
  source: string
  source_origin: string | null
  source_url: string | null
  licence: string
  score: number
}

const BRIDGES = new Set(['en', 'sw'])

/**
 * Real sentence pairs close to what was typed (sql/123). Only where pairs
 * exist: between a language with source sentences and English or Kiswahili.
 */
export async function similarSentences(
  text: string,
  from: { id: string; code: string },
  to: { id: string; code: string },
  limit = 3
): Promise<SimilarPair[]> {
  const supabase = getClient()
  if (!supabase || words(text).length < 2) return []

  // Typed in Dholuo for Kiswahili: search the Dholuo sentences themselves.
  // Typed in Kiswahili for Dholuo: search the Dholuo sentences' translations.
  let call: { p_language: string; p_side: 'text' | 'translation'; p_bridge: string } | null = null
  if (!BRIDGES.has(from.code) && BRIDGES.has(to.code)) call = { p_language: from.id, p_side: 'text', p_bridge: to.code }
  if (BRIDGES.has(from.code) && !BRIDGES.has(to.code)) call = { p_language: to.id, p_side: 'translation', p_bridge: from.code }
  if (!call) return []

  const { data, error } = await supabase.rpc('similar_sentences', { ...call, p_text: text, p_limit: limit })
  if (error) return []

  return ((data ?? []) as Row[])
    .filter((row) => row.score >= SIMILAR_MIN_SCORE)
    .map((row) => {
      const bridgeText = (call.p_bridge === 'en' ? row.translation_en : row.translation_sw) ?? ''
      return {
        id: row.id,
        from: call.p_side === 'text' ? row.text : bridgeText,
        to: call.p_side === 'text' ? bridgeText : row.text,
        source: row.source,
        sourceOrigin: row.source_origin,
        sourceUrl: row.source_url,
        licence: row.licence,
        score: row.score,
      }
    })
}
