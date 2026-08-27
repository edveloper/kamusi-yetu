/**
 * Voice consent text, versioned.
 *
 * Bump CONSENT_VERSION whenever the wording or the scope changes, and never
 * edit an existing version in place. What a speaker agreed to has to remain
 * reconstructible from the version string stored on their consent row.
 *
 * Written to be read aloud and understood, not to satisfy a lawyer. Consent is
 * only meaningful if the person giving it knows what they are agreeing to.
 */
export const CONSENT_VERSION = '2026-08-v1'

export type ConsentScope = {
  key: 'allow_publication' | 'allow_model_training' | 'allow_redistribution' | 'allow_attribution'
  label: string
  detail: string
  /** Required scopes gate the recorder; optional ones are a free choice. */
  required: boolean
}

export const CONSENT_SCOPES: ConsentScope[] = [
  {
    key: 'allow_publication',
    label: 'Publish my recording on LughaKonnect',
    detail:
      'Anyone visiting the site can listen to it on the entry page, next to your language.',
    required: true,
  },
  {
    key: 'allow_model_training',
    label: 'Use my recording to teach machines my language',
    detail:
      'This is how speech recognition and text-to-speech get built. It is the reason a phone or a wearable could one day understand your language.',
    required: true,
  },
  {
    key: 'allow_redistribution',
    label: 'Share it under the CC BY 4.0 licence',
    detail:
      'Others — researchers, app makers, translators — may reuse it, including commercially, as long as they credit LughaKonnect and the community it came from.',
    required: true,
  },
  {
    key: 'allow_attribution',
    label: 'Credit me by name as the speaker',
    detail: 'Optional. Leave this off to stay anonymous. You can change it later.',
    required: false,
  },
]

export const CONSENT_SUMMARY = [
  'Your voice is personal information. We only record it if you say yes, and you can change your mind at any time.',
  'If you withdraw, we stop using your recordings and delete the audio files.',
  'You must be 18 or over to record.',
] as const

export const AGE_BANDS = [
  { value: '18_24', label: '18–24' },
  { value: '25_34', label: '25–34' },
  { value: '35_49', label: '35–49' },
  { value: '50_64', label: '50–64' },
  { value: '65_plus', label: '65 or older' },
] as const

export const GENDER_OPTIONS = [
  { value: 'female', label: 'Female' },
  { value: 'male', label: 'Male' },
  { value: 'other', label: 'Other' },
  { value: 'prefer_not_to_say', label: 'Prefer not to say' },
] as const

export const SPEAKER_TYPES = [
  {
    value: 'native',
    label: 'First language',
    detail: 'I grew up speaking it.',
  },
  {
    value: 'heritage',
    label: 'Heritage speaker',
    detail: 'It is my family’s language, but I did not grow up speaking it daily.',
  },
  {
    value: 'learner',
    label: 'Learner',
    detail: 'I learned it later. Your recordings are kept separately from first-language ones.',
  },
] as const

/** Why we ask for demographics at all, in one honest sentence per field. */
export const WHY_WE_ASK: Record<string, string> = {
  county:
    'Dialects vary by region. Without knowing where a speaker learned the language, a model trained on this data may only work in one part of the country.',
  age_band:
    'Older and younger speakers sound different, and older speakers often hold vocabulary that is no longer in daily use.',
  gender:
    'Voice recognition that is trained mostly on one kind of voice works badly for everyone else.',
}
