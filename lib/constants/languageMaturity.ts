export type LanguageMaturity =
  | 'phrase_ready'
  | 'growing'
  | 'starter'
  | 'review_heavy'
  | 'not_yet_covered'

export type LanguageMaturityMetricInput = {
  totalEntries: number
  bridgeCoveragePct: number
  phraseEntries: number
  phraseMissingExamples: number
}

export type LanguageMaturityDefinition = {
  key: LanguageMaturity
  label: string
  shortLabel: string
  description: string
  badgeClassName: string
}

export const LANGUAGE_MATURITY_DEFINITIONS: Record<LanguageMaturity, LanguageMaturityDefinition> = {
  phrase_ready: {
    key: 'phrase_ready',
    label: 'Phrase-Ready',
    shortLabel: 'Phrase-Ready',
    description: 'This language has enough entry depth and phrase context to support stronger phrase-level discovery and translation.',
    badgeClassName: 'bg-emerald-700 text-white border border-emerald-800',
  },
  growing: {
    key: 'growing',
    label: 'Growing',
    shortLabel: 'Growing',
    description: 'This language has meaningful starter depth and is expanding beyond basic lookup coverage.',
    badgeClassName: 'bg-emerald-100 text-emerald-800 border border-emerald-200',
  },
  starter: {
    key: 'starter',
    label: 'Starter',
    shortLabel: 'Starter',
    description: 'This language is live with initial coverage, but still needs more words, phrases, and review.',
    badgeClassName: 'bg-lime-50 text-lime-800 border border-lime-200',
  },
  review_heavy: {
    key: 'review_heavy',
    label: 'Review-Heavy',
    shortLabel: 'Review-Heavy',
    description: 'This language is visible, but quality gaps or example gaps still need closer moderator and community attention.',
    badgeClassName: 'bg-amber-50 text-amber-800 border border-amber-200',
  },
  not_yet_covered: {
    key: 'not_yet_covered',
    label: 'Not Yet Covered',
    shortLabel: 'Not Covered',
    description: 'This language is registered or relevant to the map, but it does not yet have live entry coverage.',
    badgeClassName: 'bg-stone-100 text-stone-600 border border-stone-200',
  },
}

export function computeLanguageMaturity(input: LanguageMaturityMetricInput): LanguageMaturity {
  const {
    totalEntries,
    bridgeCoveragePct,
    phraseEntries,
    phraseMissingExamples,
  } = input

  if (totalEntries <= 0) return 'not_yet_covered'

  const phraseExampleGapRatio =
    phraseEntries > 0 ? phraseMissingExamples / phraseEntries : 0

  if (
    totalEntries >= 30 &&
    phraseEntries >= 10 &&
    bridgeCoveragePct >= 90 &&
    phraseExampleGapRatio <= 0.5
  ) {
    return 'phrase_ready'
  }

  if (
    bridgeCoveragePct < 70 ||
    (phraseEntries >= 5 && phraseExampleGapRatio > 0.7)
  ) {
    return 'review_heavy'
  }

  if (totalEntries >= 15 && phraseEntries >= 3) {
    return 'growing'
  }

  return 'starter'
}

export function getLanguageMaturityDefinition(maturity: LanguageMaturity) {
  return LANGUAGE_MATURITY_DEFINITIONS[maturity]
}
