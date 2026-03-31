import { supabase } from '@/lib/supabase'

export type TranslationCandidate = {
  translation: string
  confidence: number
  path_type: 'direct_bridge' | 'direct_edge' | 'pivot_sw' | 'pivot_en' | 'pivot_sw_en' | 'pivot_en_sw'
  match_kind?: 'word' | 'phrase'
  source_entry_id: string
  target_entry_id?: string
  via?: 'swahili' | 'english'
}

export async function translateText(payload: {
  text: string
  sourceLanguageId: string
  targetLanguageId: string
  limit?: number
}) {
  const res = await fetch('/api/translate', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Translation request failed.')
  }

  return (json?.result || []) as TranslationCandidate[]
}

export type TranslationFeedbackVerdict = 'correct' | 'partially_correct' | 'incorrect'

export async function submitTranslationFeedback(payload: {
  sourceEntryId: string
  targetEntryId: string
  sourceLanguageId: string
  targetLanguageId: string
  pathType: TranslationCandidate['path_type']
  confidence: number
  verdict: TranslationFeedbackVerdict
  note?: string
}) {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to submit feedback.')

  const res = await fetch('/api/translate/feedback', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Feedback request failed.')
  }

  return json as { ok: true; result: { translation_id: string; feedback_id: string } }
}
