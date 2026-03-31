export type EntryValidationStatus = 'pending' | 'verified' | 'disputed' | 'flagged'

export interface CreateEntryData {
  language_id: string
  headword: string
  primary_definition: string
  category?: string
  part_of_speech?: string
  dialect_variant?: string
  register?: string
  pronunciation_ipa?: string
  etymology?: string
  audio_url?: string
  created_by: string
  usage_example?: string
  english_translation?: string
  swahili_translation?: string
}

export interface Entry {
  id: string
  language_id: string
  headword: string
  pronunciation_ipa: string | null
  audio_url: string | null
  part_of_speech: string | null
  dialect_variant: string | null
  register: string | null
  primary_definition: string
  etymology: string | null
  category: string | null
  validation_status: EntryValidationStatus
  trust_score: number
  created_by: string | null
  created_at: string
  updated_at: string
}

export interface Language {
  id: string
  code: string
  name: string
  native_name: string | null
  is_active: boolean
  language_group_key?: string | null
  language_group_label?: string | null
  created_at: string
}
