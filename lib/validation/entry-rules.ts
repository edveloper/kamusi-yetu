type EntryRuleInput = {
  languageCode?: string | null
  headword: string
  primaryDefinition: string
  partOfSpeech?: string | null
  englishTranslation?: string | null
  swahiliTranslation?: string | null
  usageExample?: string | null
}

function clean(value: unknown) {
  const text = String(value ?? '').trim()
  return text.length > 0 ? text : ''
}

function normalize(value: string) {
  return clean(value).replace(/\s+/g, ' ').toLowerCase()
}

export function validateEntryRules(input: EntryRuleInput) {
  const languageCode = clean(input.languageCode).toLowerCase()
  const headword = clean(input.headword)
  const primaryDefinition = clean(input.primaryDefinition)
  const partOfSpeech = clean(input.partOfSpeech).toLowerCase()
  const englishTranslation = clean(input.englishTranslation)
  const swahiliTranslation = clean(input.swahiliTranslation)
  const usageExample = clean(input.usageExample)

  if (!englishTranslation && !swahiliTranslation) {
    throw new Error('At least one bridge translation is required: English or Swahili.')
  }

  if (languageCode === 'en' && !swahiliTranslation) {
    throw new Error('English entries must include a Swahili translation.')
  }

  if (languageCode === 'sw' && !englishTranslation) {
    throw new Error('Swahili entries must include an English translation.')
  }

  if (partOfSpeech === 'phrase') {
    const normalizedDefinition = normalize(primaryDefinition)
    const normalizedEnglish = normalize(englishTranslation)
    const normalizedSwahili = normalize(swahiliTranslation)

    if (primaryDefinition.length < 8) {
      throw new Error('Phrase entries need an explanatory definition, not a minimal gloss.')
    }

    if (
      normalizedDefinition !== '' &&
      (normalizedDefinition === normalizedEnglish || normalizedDefinition === normalizedSwahili)
    ) {
      throw new Error('Phrase entries need an explanatory definition, not just the bridge translation.')
    }
  }

  if (usageExample && normalize(usageExample) === normalize(headword)) {
    throw new Error('Usage examples must show the term in context, not repeat the headword by itself.')
  }
}

