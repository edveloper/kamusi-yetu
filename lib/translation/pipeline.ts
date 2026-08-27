export type TranslationPath =
  | 'direct_bridge'
  | 'direct_edge'
  | 'pivot_sw'
  | 'pivot_en'
  | 'pivot_sw_en'
  | 'pivot_en_sw'

export type TranslationCandidate = {
  translation: string
  confidence: number
  path_type: TranslationPath
  match_kind?: 'word' | 'phrase'
  source_entry_id: string
  target_entry_id?: string
  via?: 'swahili' | 'english'
  /**
   * Every distinct path that independently produced this same translation,
   * strongest first. Reaching one word by several routes is corroboration,
   * so it is surfaced on a single row rather than as repeated results.
   */
  via_paths?: TranslationPath[]
}

/**
 * Collapse candidates to one row per distinct translation.
 *
 * Previously the dedupe key included path_type and the entry ids, so a word
 * reachable by direct bridge, Swahili pivot and mixed pivot came back three
 * times at three different confidences — which reads to a user as the system
 * disagreeing with itself. Case and surrounding whitespace were not folded
 * either, so "Habari yako?" and "habari yako?" both appeared.
 *
 * The strongest candidate for a translation wins and carries the other paths
 * along with it.
 */
export function rankCandidates(candidates: TranslationCandidate[], limit: number) {
  const byTranslation = new Map<string, TranslationCandidate>()

  for (const candidate of candidates) {
    const key = candidate.translation.trim().toLowerCase()
    if (!key) continue

    const existing = byTranslation.get(key)

    if (!existing) {
      byTranslation.set(key, { ...candidate, via_paths: [candidate.path_type] })
      continue
    }

    // Record the corroborating path regardless of which candidate wins.
    const paths = existing.via_paths ?? [existing.path_type]
    if (!paths.includes(candidate.path_type)) paths.push(candidate.path_type)

    if (candidate.confidence > existing.confidence) {
      byTranslation.set(key, { ...candidate, via_paths: paths })
    } else {
      existing.via_paths = paths
    }
  }

  return Array.from(byTranslation.values())
    .map((candidate) => ({
      ...candidate,
      via_paths: orderPaths(candidate.via_paths ?? [candidate.path_type], candidate.path_type),
    }))
    .sort((a, b) => b.confidence - a.confidence)
    .slice(0, Math.max(0, limit))
}

/** Winning path first, remaining corroborating paths in a stable order. */
function orderPaths(paths: TranslationPath[], winner: TranslationPath) {
  const rest = paths.filter((path) => path !== winner)
  rest.sort()
  return [winner, ...rest]
}
