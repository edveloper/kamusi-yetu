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

export type BridgeHealthResponse = {
  summary: {
    total: number
    with_bridge: number
    missing_both: number
    english_without_swahili: number
    swahili_without_english: number
  }
  by_language: Array<{
    language_id: string
    language_name: string
    language_code: string
    total: number
    with_bridge: number
    missing_both: number
    english_without_swahili: number
    swahili_without_english: number
  }>
}

export async function getBridgeHealth() {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to view bridge health.')

  const res = await fetch('/api/moderation/bridge-health', {
    method: 'GET',
    headers: {
      Authorization: `Bearer ${token}`
    }
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Bridge health request failed.')
  }
  return json as { ok: true } & BridgeHealthResponse
}

type BulkJobPayload =
  | { action: 'dry_run_backfill_bridge'; languageId?: string; limit?: number }
  | { action: 'apply_job'; jobId: string }
  | { action: 'rollback_job'; jobId: string }

export async function runBulkJobAction(payload: BulkJobPayload) {
  const { data, error } = await supabase.auth.getSession()
  if (error) throw error
  const token = data.session?.access_token
  if (!token) throw new Error('You must be signed in to perform bulk actions.')

  const res = await fetch('/api/moderation/bulk-jobs', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`
    },
    body: JSON.stringify(payload)
  })

  const json = await res.json().catch(() => ({}))
  if (!res.ok) {
    throw new Error(json?.error || 'Bulk action request failed.')
  }
  return json
}
