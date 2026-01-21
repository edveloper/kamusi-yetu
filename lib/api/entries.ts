// lib/api/entries.ts
import { supabase } from '@/lib/supabase'

export interface CreateEntryData {
  language_id: string
  headword: string
  primary_definition: string
  category?: string
  part_of_speech?: string
  dialect_variant?: string
  register?: string
  created_by: string
  usage_example?: string
  english_translation?: string
  swahili_translation?: string
}

/**
 * Normalize text for consistent matching and indexing.
 * Strips diacritics, lowercases, and trims whitespace.
 */
function normalizeText(s: string) {
  if (!s) return s
  return s
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '') // strip diacritics
    .toLowerCase()
    .trim()
}

export async function createEntry(data: CreateEntryData) {
  const { data: entry, error: entryError } = await supabase
    .from('entries')
    .insert({
      language_id: data.language_id,
      headword: data.headword,
      primary_definition: data.primary_definition,
      category: data.category || null,
      part_of_speech: data.part_of_speech || null,
      dialect_variant: data.dialect_variant || null,
      register: data.register || 'both',
      validation_status: 'pending',
      trust_score: 0,
      created_by: data.created_by,
      normalized_headword: normalizeText(data.headword),
      english_translation: data.english_translation || null,
      swahili_translation: data.swahili_translation || null
    })
    .select()
    .single()

  if (entryError) throw entryError

  if (data.usage_example && data.usage_example.trim() !== '') {
    const { error: contextError } = await supabase
      .from('usage_contexts')
      .insert({
        entry_id: entry.id,
        context_text: data.usage_example,
        is_verified: false,
        created_by: data.created_by
      })
    if (contextError) console.error('Context save failed:', contextError)
  }
  return entry
}

export async function getEntry(id: string) {
  if (!id) throw new Error("ID is required");

  const { data, error } = await supabase
    .from('entries')
    .select(`
      *,
      language:languages(*),
      usage_contexts(*),
      contributor:user_profiles!created_by (
        display_name,
        avatar_url
      )
    `)
    .eq('id', id)
    .single()

  if (error) throw error

  return {
    ...data,
    contributor_name: data.contributor?.display_name || 'Anonymous Contributor',
    contributor_avatar: data.contributor?.avatar_url || null,
    usage_examples: data.usage_contexts || []
  }
}

export async function getEntries(filters?: {
  language_id?: string
  validation_status?: string
  category?: string
  search?: string
  letter?: string
}) {
  let query = supabase
    .from('entries')
    .select(`
      *, 
      language:languages(*),
      contributor:user_profiles!created_by(display_name)
    `)
    .order('created_at', { ascending: false })

  if (filters?.language_id && filters.language_id !== 'all') query = query.eq('language_id', filters.language_id)
  if (filters?.category) query = query.eq('category', filters.category)
  if (filters?.validation_status) query = query.eq('validation_status', filters.validation_status)
  if (filters?.letter && filters.letter !== 'all') query = query.ilike('headword', `${filters.letter}%`)
  if (filters?.search) {
    try {
      query = query.textSearch('search_tsv', filters.search, { config: 'simple' })
    } catch (e) {
      query = query.or(`headword.ilike.%${filters.search}%,primary_definition.ilike.%${filters.search}%`)
    }
  }

  const { data, error } = await query
  if (error) throw error
  return data
}

export async function updateEntryStatus(
  entryId: string,
  status: 'pending' | 'verified' | 'disputed' | 'flagged',
  validatorId: string
) {
  const { error: entryError } = await supabase
    .from('entries')
    .update({
      validation_status: status,
      updated_at: new Date().toISOString()
    })
    .eq('id', entryId)

  if (entryError) throw entryError

  const actionMap = {
    'verified': 'approve',
    'flagged': 'flag',
    'disputed': 'reject',
    'pending': 'reset'
  }

  const { error: validationError } = await supabase
    .from('validations')
    .insert({
      entry_id: entryId,
      validator_id: validatorId,
      action: actionMap[status] || 'reject'
    })

  if (validationError) console.error('Log failed:', validationError)
}

export async function searchEntries(
  query: string,
  languageId?: string,
  categoryId?: string,
  letter?: string
) {
  let searchQuery = supabase
    .from('entries')
    .select(`*, language:languages(*)`)
    .eq('validation_status', 'verified')
    .order('headword', { ascending: true })
    .limit(100)

  if (query && query.trim() !== '') {
    try {
      searchQuery = searchQuery.textSearch('search_tsv', query, { config: 'simple' })
    } catch (e) {
      searchQuery = searchQuery.or(`headword.ilike.%${query}%,primary_definition.ilike.%${query}%`)
    }
  }
  if (languageId && languageId !== 'all') searchQuery = searchQuery.eq('language_id', languageId)
  if (categoryId && categoryId !== 'all') searchQuery = searchQuery.eq('category', categoryId)
  if (letter && letter !== 'all') searchQuery = searchQuery.ilike('headword', `${letter}%`)

  const { data, error } = await searchQuery
  if (error) throw error
  return data
}

export async function getLatestEntries() {
  const { data, error } = await supabase
    .from('entries')
    .select(`*, language:languages(*)`)
    .eq('validation_status', 'verified')
    .order('created_at', { ascending: false })
    .limit(3)

  if (error) throw error
  return data
}

export async function getWordOfTheDay() {
  try {
    const { data: allIds, error } = await supabase
      .from('entries')
      .select('id')
      .eq('validation_status', 'verified')

    if (error || !allIds || allIds.length === 0) return null

    const today = new Date()
    const seed = today.getFullYear() + today.getMonth() + today.getDate()
    const index = seed % allIds.length
        
    return await getEntry(allIds[index].id)
  } catch (err) {
    return null
  }
}

export async function getRelatedEntries(categoryId: string, currentEntryId: string) {
  const { data, error } = await supabase
    .from('entries')
    .select(`id, headword, primary_definition, language:languages(name)`)
    .eq('category', categoryId)
    .eq('validation_status', 'verified')
    .neq('id', currentEntryId)
    .limit(3)

  if (error) throw error
  return data
}

export async function submitEditSuggestion(suggestion: {
  entry_id: string;
  suggested_by: string;
  headword: string;
  primary_definition: string;
  reason_for_change: string;
}) {
  const { data, error } = await supabase
    .from('entry_suggestions')
    .insert([suggestion])
    .select()

  if (error) throw error
  return data
}

export async function reportEntry(report: {
  entry_id: string;
  reported_by: string;
  reason: string;
  details: string;
}) {
  const { data, error } = await supabase
    .from('reports')
    .insert([report])
    .select()

  if (error) throw error
  return data
}

export async function toggleSaveWord(userId: string, entryId: string) {
  // Check if already saved
  const { data: existing, error: fetchErr } = await supabase
    .from('saved_words')
    .select('id')
    .match({ user_id: userId, entry_id: entryId })
    .single()

  // If fetchErr is present and it's not "no rows", rethrow
  if (fetchErr && fetchErr.code && fetchErr.code !== 'PGRST116') {
    // Some Supabase clients return different error codes; if unsure, log and continue
    console.error('toggleSaveWord fetch error:', fetchErr)
  }

  if (existing && existing.id) {
    // already saved -> remove
    const { error } = await supabase
      .from('saved_words')
      .delete()
      .eq('id', existing.id)
    if (error) throw error
    return false
  } else {
    const { error } = await supabase
      .from('saved_words')
      .insert([{ user_id: userId, entry_id: entryId }])
    if (error) throw error
    return true
  }
}

export async function toggleLike(entryId: string, userId: string) {
  const { data: existing } = await supabase
    .from('entry_likes')
    .select()
    .eq('entry_id', entryId)
    .eq('user_id', userId)
    .single()

  if (existing) {
    await supabase.from('entry_likes').delete().eq('id', existing.id)
    return false
  } else {
    await supabase.from('entry_likes').insert([{ entry_id: entryId, user_id: userId }])
    return true
  }
}

export async function getLikes(entryId: string) {
  const { count } = await supabase
    .from('entry_likes')
    .select('*', { count: 'exact', head: true })
    .eq('entry_id', entryId)
  return count || 0
}

export async function addComment(entryId: string, userId: string, content: string, parentId?: string) {
  const { data, error } = await supabase
    .from('entry_comments')
    .insert([{ entry_id: entryId, user_id: userId, content, parent_id: parentId || null }])
    .select()
    .single()
  if (error) throw error
  return data
}

export async function getComments(entryId: string) {
  const { data, error } = await supabase
    .from('entry_comments')
    .select('*, user:user_profiles(display_name, avatar_url)')
    .eq('entry_id', entryId)
    .order('created_at', { ascending: true })
  if (error) throw error
  return data
}

// Update a comment's content
export async function updateComment(commentId: string, newContent: string) {
  const { data, error } = await supabase
    .from('entry_comments')
    .update({ content: newContent })
    .eq('id', commentId)
    .select('*, user:user_profiles(display_name, avatar_url)')
    .single()

  if (error) throw error
  return data
}

// Delete a comment
export async function deleteComment(commentId: string) {
  const { error } = await supabase
    .from('entry_comments')
    .delete()
    .eq('id', commentId)

  if (error) throw error
  return true
}

// Toggle a vote (like/dislike) for a comment
export async function toggleCommentVote(commentId: string, userId: string, voteType: 'like' | 'dislike') {
  // Check if user already voted
  const { data: existing, error: fetchError } = await supabase
    .from('comment_votes')
    .select('*')
    .eq('comment_id', commentId)
    .eq('user_id', userId)
    .single()

  if (fetchError && fetchError.code !== 'PGRST116') throw fetchError // ignore "no rows found"

  if (existing) {
    if (existing.vote === voteType) {
      // Remove vote if clicking same again
      const { error } = await supabase
        .from('comment_votes')
        .delete()
        .eq('id', existing.id)
      if (error) throw error
      return null
    } else {
      // Update vote type
      const { data, error } = await supabase
        .from('comment_votes')
        .update({ vote: voteType })
        .eq('id', existing.id)
        .select()
        .single()
      if (error) throw error
      return data
    }
  } else {
    // Insert new vote
    const { data, error } = await supabase
      .from('comment_votes')
      .insert({ comment_id: commentId, user_id: userId, vote: voteType })
      .select()
      .single()
    if (error) throw error
    return data
  }
}

export async function getCommentVotes(commentId: string) {
  const { data, error } = await supabase
    .from('comment_votes')
    .select('vote')
    .eq('comment_id', commentId)

  if (error) throw error

  const likes = data.filter(v => v.vote === 'like').length
  const dislikes = data.filter(v => v.vote === 'dislike').length
  return { likes, dislikes }
}

/**
 * Saved words helpers
 *
 * getSavedWords: uses page-based pagination (page, limit) and .range for Supabase/PostgREST.
 * removeSavedWord: deletes a saved_words row for the given user and entry.
 *
 * Note: Some Supabase setups do not support filtering on nested selected fields (e.g., entry.language_id).
 * If your instance errors when using eq('entry.language_id', ...), remove that server-side filter and filter client-side.
 */
export async function getSavedWords(userId: string, opts?: { limit?: number; page?: number; language?: string }) {
  const limit = opts?.limit ?? 12
  const page = opts?.page ?? 0
  const start = page * limit
  const end = start + limit - 1

  let query = supabase
    .from('saved_words')
    .select(`
      id,
      created_at,
      entry:entries (
        id,
        headword,
        language_id,
        part_of_speech,
        validation_status,
        contributor_name,
        contributor_avatar
      )
    `)
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .range(start, end)

  // Attempt server-side nested filter; if unsupported in your setup, remove and filter client-side.
  if (opts?.language) {
    try {
      query = query.eq('entry.language_id', opts.language)
    } catch (e) {
      // If nested filtering fails, ignore here; caller can filter client-side.
      console.warn('Nested filter on entry.language_id not supported; filter client-side instead.')
    }
  }

  const { data, error } = await query
  if (error) throw error
  return data || []
}

export async function removeSavedWord(userId: string, entryId: string) {
  const { error } = await supabase
    .from('saved_words')
    .delete()
    .match({ user_id: userId, entry_id: entryId })

  if (error) throw error
  return true
}
