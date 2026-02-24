export type FeedbackVerdict = 'correct' | 'partially_correct' | 'incorrect'
export type FeedbackPath = 'direct_bridge' | 'direct_edge' | 'pivot_sw' | 'pivot_en' | 'pivot_sw_en' | 'pivot_en_sw'

export type FeedbackInput = {
  sourceEntryId?: string
  targetEntryId?: string
  sourceLanguageId?: string
  targetLanguageId?: string
  pathType?: FeedbackPath
  confidence?: number
  verdict?: FeedbackVerdict
  note?: string
}

export function methodFromPath(pathType: FeedbackPath) {
  if (pathType === 'direct_edge' || pathType === 'direct_bridge') return 'manual'
  if (pathType === 'pivot_sw') return 'pivot_sw'
  if (pathType === 'pivot_en') return 'pivot_en'
  return 'ml'
}

export function cleanText(value: unknown) {
  const s = String(value ?? '').trim()
  return s.length > 0 ? s : ''
}

export function validateFeedbackInput(input: FeedbackInput) {
  const sourceEntryId = cleanText(input.sourceEntryId)
  const targetEntryId = cleanText(input.targetEntryId)
  const sourceLanguageId = cleanText(input.sourceLanguageId)
  const targetLanguageId = cleanText(input.targetLanguageId)
  const note = cleanText(input.note)
  const verdict = input.verdict
  const pathType = input.pathType
  const confidence = Math.max(0, Math.min(1, Number(input.confidence ?? 0.5)))

  if (!sourceEntryId || !targetEntryId || !sourceLanguageId || !targetLanguageId || !verdict || !pathType) {
    return { ok: false as const, error: 'Missing required fields.' }
  }

  if (!['correct', 'partially_correct', 'incorrect'].includes(verdict)) {
    return { ok: false as const, error: 'Invalid verdict.' }
  }

  return {
    ok: true as const,
    value: {
      sourceEntryId,
      targetEntryId,
      sourceLanguageId,
      targetLanguageId,
      verdict,
      pathType,
      note,
      confidence
    }
  }
}
