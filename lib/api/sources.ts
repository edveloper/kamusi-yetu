// Real sentences and missing words from the licensed source datasets (sql/121).
// Signed-in users only: the sentences are working material for contributors,
// not something the site publishes as a list.

import { supabase } from '@/lib/supabase'

export type SourceSentence = {
  id: string
  text: string
  translation_en: string | null
  translation_sw: string | null
  source: string
  source_url: string | null
  source_origin: string | null
  licence: string
  kind: 'read' | 'spontaneous' | 'parallel'
}

export type MissingWord = {
  id: string
  word: string
  frequency: number
  rank: number
}

/** Short sentences first: they show a word's meaning most plainly. */
export async function sentencesWithWord(languageId: string, word: string, limit = 5): Promise<SourceSentence[]> {
  const w = word.trim()
  if (!languageId || w.length < 2) return []
  const { data, error } = await supabase.rpc('sentences_with_word', {
    p_language: languageId,
    p_word: w,
    p_limit: limit,
  })
  if (error) return []
  return (data ?? []) as SourceSentence[]
}

/** The most frequent words the dictionary does not have yet, in order. */
export async function getMissingWords(languageId: string, limit = 30, after = 0): Promise<MissingWord[]> {
  if (!languageId) return []
  const { data, error } = await supabase
    .from('headword_candidates')
    .select('id, word, frequency, rank')
    .eq('language_id', languageId)
    .eq('status', 'open')
    .gt('rank', after)
    .order('rank', { ascending: true })
    .limit(limit)
  if (error) throw error
  return (data ?? []) as MissingWord[]
}

/** Reviewers only: a name, an English loan or a typo, not a dictionary word. */
export async function markNotAWord(id: string) {
  const { error } = await supabase
    .from('headword_candidates')
    .update({ status: 'not_a_word', updated_at: new Date().toISOString() })
    .eq('id', id)
  if (error) throw error
}

/** How to credit a sentence when it becomes an example. */
export function creditFor(sentence: SourceSentence) {
  return `${sentence.source}${sentence.source_origin ? `, ${sentence.source_origin}` : ''}`
}
