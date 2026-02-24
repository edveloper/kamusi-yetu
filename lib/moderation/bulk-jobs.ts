type EntryRow = {
  id: string
  language_id: string
  headword: string
  english_translation: string | null
  swahili_translation: string | null
}

type BridgeMatch = { term: string; score: number; ambiguous: boolean }

export function normalize(value: unknown) {
  return String(value ?? '')
    .trim()
    .replace(/\s+/g, ' ')
    .toLowerCase()
}

export function clean(value: unknown) {
  const s = String(value ?? '').trim()
  return s.length > 0 ? s : null
}

export function nextApplyStatus(failedCount: number) {
  return failedCount > 0 ? 'failed' : 'completed'
}

export function nextRollbackStatus(failedCount: number) {
  return failedCount > 0 ? 'failed' : 'rolled_back'
}

export function deriveBridgeUpdate(
  entry: EntryRow,
  languageCode: string,
  enToSw: Map<string, BridgeMatch>,
  swToEn: Map<string, BridgeMatch>
) {
  const code = String(languageCode || '').toLowerCase()
  const currentEnglish = clean(entry.english_translation)
  const currentSwahili = clean(entry.swahili_translation)
  const updates: Record<string, string> = {}

  if (code === 'en' && !currentSwahili) {
    const match = enToSw.get(normalize(entry.headword))
    if (match && !match.ambiguous) updates.swahili_translation = match.term
    return updates
  }

  if (code === 'sw' && !currentEnglish) {
    const match = swToEn.get(normalize(entry.headword))
    if (match && !match.ambiguous) updates.english_translation = match.term
    return updates
  }

  if (!currentEnglish && currentSwahili) {
    const match = swToEn.get(normalize(currentSwahili))
    if (match && !match.ambiguous) updates.english_translation = match.term
  }
  if (!currentSwahili && currentEnglish) {
    const match = enToSw.get(normalize(currentEnglish))
    if (match && !match.ambiguous) updates.swahili_translation = match.term
  }

  return updates
}
