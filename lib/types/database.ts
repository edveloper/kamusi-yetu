// @/lib/types/database.ts

export interface CreateEntryData {
  language_id: string
  headword: string
  primary_definition: string
  category?: string
  part_of_speech?: string
  dialect_variant?: string
  register?: string
  created_by: string
  // Added specific fields for translation logic if needed
  englishTranslation?: string 
  swahiliTranslation?: string
}

export interface Entry {
  id: string
  language_id: string
  headword: string
  primary_definition: string
  category?: string
  created_at: string
  validation_status: 'pending' | 'verified' | 'rejected'
  // ... other fields from your DB
}

export interface Language {
  id: string
  name: string
  native_name?: string
  iso_code?: string
}