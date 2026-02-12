import { supabase } from '@/lib/supabase'

type ModerationPayload =
  | { action: 'approve_entry'; itemId: string }
  | { action: 'reject_entry'; itemId: string }
  | { action: 'flag_entry'; itemId: string }
  | { action: 'review_suggestion'; itemId: string; suggestionAction: 'accept' | 'reject'; note?: string }
  | { action: 'apply_suggestion'; itemId: string; note?: string }

export async function runModerationAction(payload: ModerationPayload) {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to perform moderation actions.')

  const res = await fetch('/api/moderation/action', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Moderation request failed.')
  }

  return json
}
