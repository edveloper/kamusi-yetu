export type TranslationCandidate = {
  translation: string
  confidence: number
  path_type: 'direct_bridge' | 'direct_edge' | 'pivot_sw' | 'pivot_en' | 'pivot_sw_en' | 'pivot_en_sw'
  match_kind?: 'word' | 'phrase'
  source_entry_id: string
  target_entry_id?: string
  via?: 'swahili' | 'english'
}

export function rankCandidates(candidates: TranslationCandidate[], limit: number) {
  const sorted = [...candidates].sort((a, b) => b.confidence - a.confidence)
  const seen = new Set<string>()
  const out: TranslationCandidate[] = []

  for (const c of sorted) {
    const key = `${c.translation.toLowerCase()}|${c.path_type}|${c.source_entry_id}|${c.target_entry_id || ''}`
    if (!seen.has(key)) {
      seen.add(key)
      out.push(c)
    }
    if (out.length >= limit) break
  }

  return out
}
