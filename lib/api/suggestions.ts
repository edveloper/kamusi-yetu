// lib/api/suggestions.ts
import { supabase } from '@/lib/supabase'

export type SuggestionPayload = {
  entry_id: string
  user_id: string
  type: 'edit' | 'report'
  headword?: string
  primary_definition?: string
  reason: string
  details?: string
  source_type?: string
  source_reference?: string
  confidence?: string
}

export type SuggestionRow = {
  id: string
  entry_id?: string | null
  user_id?: string | null
  type?: string | null
  headword?: string | null
  primary_definition?: string | null
  reason?: string | null
  details?: string | null
  source_type?: string | null
  source_reference?: string | null
  confidence?: string | null
  status?: string | null
  moderator_notes?: string | null
  created_at?: string | null
  // optional joined fields
  contributor?: { id?: string; display_name?: string | null; avatar_url?: string | null } | null
  language?: { id?: string; name?: string } | null
}

/**
 * Submit a suggestion (existing behavior)
 */
export async function submitSuggestion(payload: SuggestionPayload) {
  const { data, error } = await supabase
    .from('entry_suggestions')
    .insert([{
      entry_id: payload.entry_id,
      user_id: payload.user_id,
      type: payload.type,
      headword: payload.headword || null,
      primary_definition: payload.primary_definition || null,
      reason: payload.reason,
      details: payload.details || null,
      source_type: payload.source_type || null,
      source_reference: payload.source_reference || null,
      confidence: payload.confidence || null
    }])
    .select()
    .single()

  if (error) throw error
  return data as SuggestionRow
}

// robust two-step getPendingSuggestions (replace existing function)
export async function getPendingSuggestions(limit = 20, before?: string) {
  try {
    // 1) fetch suggestion rows (simple select of all columns)
    let q = supabase
      .from('entry_suggestions')
      .select('*')
      .eq('status', 'pending')
      .order('created_at', { ascending: false })
      .limit(limit)

    if (before) q = q.lt('created_at', before)

    const { data: suggestions, error: suggestionsErr } = await q
    if (suggestionsErr) throw suggestionsErr
    if (!suggestions || suggestions.length === 0) return []

    // 2) detect contributor and entry id column names
    const sample = suggestions[0] || {}
    // common names to check
    const possibleUserCols = ['user_id', 'created_by', 'contributor_id', 'author_id']
    const possibleEntryCols = ['entry_id', 'entry', 'entry_ref', 'entryid']
    const userCol = possibleUserCols.find(c => Object.prototype.hasOwnProperty.call(sample, c))
    const entryCol = possibleEntryCols.find(c => Object.prototype.hasOwnProperty.call(sample, c))

    // 3) collect unique ids
    const userIds = userCol ? Array.from(new Set(suggestions.map((s: any) => s[userCol]).filter(Boolean))) : []
    const entryIds = entryCol ? Array.from(new Set(suggestions.map((s: any) => s[entryCol]).filter(Boolean))) : []

    // 4) fetch contributors if we found a user column
    let contributors: any[] = []
    if (userIds.length > 0) {
      const { data: contribData, error: contribErr } = await supabase
        .from('user_profiles')
        .select('id, display_name, avatar_url')
        .in('id', userIds)
      if (contribErr) throw contribErr
      contributors = contribData || []
    }

    // 5) fetch entries if we found an entry column
    let entries: any[] = []
    if (entryIds.length > 0) {
      const { data: entryData, error: entryErr } = await supabase
        .from('entries')
        .select('id, language_id, part_of_speech, dialect_variant')
        .in('id', entryIds)
      if (entryErr) throw entryErr
      entries = entryData || []
    }

    // 6) normalize and merge
    const normalized = (suggestions || []).map((s: any) => {
      const userIdVal = userCol ? s[userCol] : undefined
      const entryIdVal = entryCol ? s[entryCol] : undefined

      const contributor = userIdVal ? contributors.find((c: any) => c.id === userIdVal) : null
      const entry = entryIdVal ? entries.find((e: any) => e.id === entryIdVal) : null

      return {
        // keep original suggestion fields but normalize null -> undefined
        id: s.id,
        // canonicalize entry_id/user_id names for the UI
        entry_id: entryIdVal ?? undefined,
        user_id: userIdVal ?? undefined,
        type: s.type ?? undefined,
        headword: s.headword ?? undefined,
        primary_definition: s.primary_definition ?? undefined,
        reason: s.reason ?? undefined,
        details: s.details ?? undefined,
        source_type: s.source_type ?? undefined,
        source_reference: s.source_reference ?? undefined,
        confidence: s.confidence ?? undefined,
        status: s.status ?? undefined,
        moderator_notes: s.moderator_notes ?? undefined,
        created_at: s.created_at ?? undefined,
        contributor: contributor ? { display_name: contributor.display_name ?? undefined, avatar_url: contributor.avatar_url ?? undefined } : undefined,
        language: entry ? { id: entry.language_id ?? undefined, name: entry.language_id ?? undefined } : undefined,
        part_of_speech: entry?.part_of_speech ?? undefined,
        dialect_variant: entry?.dialect_variant ?? undefined
      }
    })

    return normalized
  } catch (err) {
    console.error('getPendingSuggestions failed:', {
      message: (err as any)?.message ?? String(err),
      details: (err as any)?.details ?? null,
      hint: (err as any)?.hint ?? null,
      raw: err
    })
    throw err
  }
}


/**
 * Review a suggestion (moderator action)
 * - suggestionId: id of suggestion
 * - moderatorId: id of moderator performing the action
 * - action: 'accept' | 'reject'
 * - moderatorNotes: optional notes
 *
 * This function attempts to update status and moderator_notes.
 * It will also try to set reviewed_by and reviewed_at if those columns exist; if they don't, it retries without them.
 */
export async function reviewSuggestion(suggestionId: string, moderatorId: string, action: 'accept' | 'reject', moderatorNotes?: string) {
  const newStatus = action === 'accept' ? 'accepted' : 'rejected'
  // First attempt: include audit columns (if present)
  const attemptPayload: any = {
    status: newStatus,
    moderator_notes: moderatorNotes ?? null,
    reviewed_by: moderatorId,
    reviewed_at: new Date().toISOString()
  }

  try {
    const { data, error } = await supabase
      .from('entry_suggestions')
      .update(attemptPayload)
      .eq('id', suggestionId)
      .select()
      .single()

    if (error) {
      // If error is due to unknown column(s), retry without audit fields
      const msg = String(error.message || error)
      if (msg.includes('column') && (msg.includes('reviewed_by') || msg.includes('reviewed_at'))) {
        const fallbackPayload = {
          status: newStatus,
          moderator_notes: moderatorNotes ?? null
        }
        const { data: d2, error: e2 } = await supabase
          .from('entry_suggestions')
          .update(fallbackPayload)
          .eq('id', suggestionId)
          .select()
          .single()
        if (e2) throw e2
        return d2 as SuggestionRow
      }
      throw error
    }

    return data as SuggestionRow
  } catch (err) {
    throw err
  }
}

/**
 * Apply an accepted suggestion to the entries table.
 * - Fetches the suggestion, builds an updates object from allowed fields, updates the entry,
 *   then marks the suggestion accepted (and records moderator note).
 *
 * This is explicit: moderators call this to apply changes to the live entry.
 */
export async function applySuggestionToEntry(suggestionId: string, moderatorId: string) {
  try {
    // 1) fetch suggestion
    const { data: suggestion, error: fetchErr } = await supabase
      .from('entry_suggestions')
      .select('id, entry_id, headword, primary_definition, details')
      .eq('id', suggestionId)
      .single()

    if (fetchErr) throw fetchErr
    if (!suggestion) throw new Error('Suggestion not found')

    if (!suggestion.entry_id) throw new Error('Suggestion does not reference an entry')

    // 2) build updates (only allow specific fields to be applied)
    const updates: any = {}
    if (suggestion.headword) updates.headword = suggestion.headword
    if (suggestion.primary_definition) updates.primary_definition = suggestion.primary_definition
    // If you want to apply details or other fields, add them here explicitly

    if (Object.keys(updates).length === 0) {
      throw new Error('No updatable fields found on suggestion')
    }

    // 3) update entry
    const { data: updatedEntry, error: updateErr } = await supabase
      .from('entries')
      .update(updates)
      .eq('id', suggestion.entry_id)
      .select()
      .single()

    if (updateErr) throw updateErr

    // 4) mark suggestion accepted (use reviewSuggestion to handle audit fallback)
    try {
      await reviewSuggestion(suggestionId, moderatorId, 'accept', `Applied by ${moderatorId}`)
    } catch (e) {
      // If marking accepted fails, log but still return updated entry
      console.warn('Failed to mark suggestion accepted after applying to entry:', e)
    }

    return updatedEntry
  } catch (err) {
    throw err
  }
}
