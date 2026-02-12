import { createClient } from '@supabase/supabase-js'
import type { Entry, Language } from '@/lib/types/database'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

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

export type { Entry, Language }
