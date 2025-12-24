import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Types for our database
export type Language = {
  id: string
  code: string
  name: string
  native_name: string | null
  is_active: boolean
  created_at: string
}

export type Entry = {
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
  validation_status: 'pending' | 'verified' | 'disputed' | 'flagged'
  trust_score: number
  created_by: string | null
  created_at: string
  updated_at: string
}

export type UsageContext = {
  id: string
  entry_id: string
  context_type: string | null
  usage_text: string
  example_sentence: string | null
  upvotes: number
  downvotes: number
  created_by: string | null
  created_at: string
}