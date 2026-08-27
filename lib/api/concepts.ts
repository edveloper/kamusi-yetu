import { supabase } from '@/lib/supabase'

export type ConceptGap = {
  concept_id: string
  concept_key: string
  gloss_en: string | null
  gloss_sw: string | null
  domain: string | null
  priority_rank: number
}

export type LanguageConceptCoverage = {
  language_id: string
  language_code: string
  language_name: string
  concepts_total: number
  concepts_covered: number
  percent_covered: number
}

/**
 * Concepts this language does not have yet, most widely attested first.
 *
 * This is the contribution queue. Asking someone "which concept is missing from
 * your language" is how field linguists actually elicit vocabulary, and it
 * converts far better than a blank thirteen-field form — the contributor is
 * shown a specific gap they can fill in seconds.
 */
export async function getConceptGaps(languageId: string, limit = 20): Promise<ConceptGap[]> {
  if (!languageId) return []

  const { data, error } = await supabase
    .from('concept_gaps')
    .select('concept_id, concept_key, gloss_en, gloss_sw, domain, priority_rank')
    .eq('language_id', languageId)
    .order('priority_rank', { ascending: true })
    .limit(limit)

  if (error) throw error
  return (data ?? []) as ConceptGap[]
}

export async function getLanguageCoverage(): Promise<LanguageConceptCoverage[]> {
  const { data, error } = await supabase
    .from('language_concept_coverage')
    .select('*')
    .order('percent_covered', { ascending: false })

  if (error) throw error
  return (data ?? []) as LanguageConceptCoverage[]
}

export async function getCoverageForLanguage(languageId: string) {
  const { data, error } = await supabase
    .from('language_concept_coverage')
    .select('*')
    .eq('language_id', languageId)
    .maybeSingle()

  if (error) throw error
  return (data as LanguageConceptCoverage | null) ?? null
}

/**
 * Fill one gap. Deliberately narrower than createEntry: a concept already
 * supplies the meaning and both bridge glosses, so the contributor only has to
 * give the word itself — which is the whole point of eliciting this way.
 */
export async function submitConceptEntry(params: {
  conceptId: string
  languageId: string
  headword: string
  userId: string
  glossEn: string | null
  glossSw: string | null
  domain: string | null
  note?: string
}) {
  const headword = params.headword.trim()
  if (!headword) throw new Error('Please enter the word in your language.')

  const english = (params.glossEn ?? '').trim()
  const swahili = (params.glossSw ?? '').trim()
  if (!english && !swahili) {
    throw new Error('This concept has no bridge translation, so it cannot be filled yet.')
  }

  const { data, error } = await supabase
    .from('entries')
    .insert({
      language_id: params.languageId,
      concept_id: params.conceptId,
      headword,
      primary_definition: params.note?.trim() || english || swahili,
      english_translation: english || null,
      swahili_translation: swahili || null,
      category: params.domain,
      validation_status: 'pending',
      trust_score: 0,
      created_by: params.userId,
      source_type: 'elicited',
    })
    .select('id, headword')
    .single()

  if (error) {
    if (error.code === '23505') {
      throw new Error('That word is already recorded for this language.')
    }
    throw error
  }

  return data as { id: string; headword: string }
}

/** Most-requested missing translations, for moderators deciding what to seed. */
export async function getTopTranslationGaps(limit = 25) {
  const { data, error } = await supabase
    .from('translation_gaps')
    .select('id, query_text, hit_count, last_seen_at, source_language_id, target_language_id')
    .is('resolved_entry_id', null)
    .order('hit_count', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data ?? []
}
