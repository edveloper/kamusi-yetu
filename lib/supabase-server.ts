import { createClient } from '@supabase/supabase-js'

export function createServerSupabaseClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY

  if (!url || !anon) {
    throw new Error('Missing Supabase environment variables.')
  }

  return createClient(url, serviceRole || anon, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  })
}
