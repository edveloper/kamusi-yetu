// lib/api/entries.ts
import { supabase } from '@/lib/supabase'
import type { CreateEntryData } from '@/lib/types/database'
import { validateEntryRules } from '@/lib/validation/entry-rules'

const AUDIO_BUCKET = process.env.NEXT_PUBLIC_SUPABASE_AUDIO_BUCKET || 'entry-audio'

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

type LanguageCodeRow = {
  code: string | null
}

async function validateBridgeRequirements(data: CreateEntryData) {
  const { data: language, error: languageErr } = await supabase
    .from('languages')
    .select('code')
    .eq('id', data.language_id)
    .single()

  if (languageErr || !language) {
    throw new Error('Could not validate language bridge requirements.')
  }

  const code = String((language as LanguageCodeRow).code || '').toLowerCase()
  validateEntryRules({
    languageCode: code,
    headword: data.headword,
    primaryDefinition: data.primary_definition,
    partOfSpeech: data.part_of_speech,
    englishTranslation: data.english_translation,
    swahiliTranslation: data.swahili_translation,
    usageExample: data.usage_example
  })
}

export async function createEntry(data: CreateEntryData) {
  await validateBridgeRequirements(data)

  const english = String(data.english_translation || '').trim()
  const swahili = String(data.swahili_translation || '').trim()

  const { data: entry, error: entryError } = await supabase
    .from('entries')
    .insert({
      language_id: data.language_id,
      headword: data.headword,
      primary_definition: data.primary_definition,
      category: data.category || null,
      part_of_speech: data.part_of_speech || null,
      dialect_variant: data.dialect_variant || null,
      pronunciation_ipa: data.pronunciation_ipa || null,
      etymology: data.etymology || null,
      audio_url: data.audio_url || null,
      register: data.register || 'both',
      validation_status: 'pending',
      trust_score: 0,
      created_by: data.created_by,
      normalized_headword: normalizeText(data.headword),
      english_translation: english || null,
      swahili_translation: swahili || null
    })
    .select()
    .single()

  if (entryError) throw entryError

  if (data.usage_example && data.usage_example.trim() !== '') {
    const examplePayload = {
      entry_id: entry.id,
      example_text: data.usage_example,
      english_translation: english || null,
      swahili_translation: swahili || null,
      register: data.register || 'both',
      validation_status: 'pending',
      created_by: data.created_by
    }

    const { error: exampleError } = await supabase
      .from('entry_usage_examples')
      .insert(examplePayload)

    if (exampleError) {
      console.warn('Structured usage example save failed:', exampleError)
    }

    const { error: contextError } = await supabase
      .from('usage_contexts')
      .insert({
        entry_id: entry.id,
        usage_text: data.usage_example,
        example_sentence: null,
        created_by: data.created_by
      })
    if (contextError) {
      const isMissingUsageText =
        contextError.code === 'PGRST204' &&
        String(contextError.message || '').includes('usage_text')

      if (isMissingUsageText) {
        const fallbackPayload: Record<string, string> = {
          entry_id: entry.id,
          context_text: data.usage_example,
          created_by: data.created_by
        }
        const { error: fallbackContextError } = await supabase
          .from('usage_contexts')
          .insert(fallbackPayload)

        if (fallbackContextError) console.warn('Context save failed:', fallbackContextError)
      } else {
        console.warn('Context save failed:', contextError)
      }
    }
  }
  return entry
}

export async function uploadEntryAudio(userId: string, file: File) {
  if (!file.type.startsWith('audio/')) {
    throw new Error('Please select a valid audio file.')
  }

  const maxBytes = 15 * 1024 * 1024 // 15MB
  if (file.size > maxBytes) {
    throw new Error('Audio file is too large. Maximum allowed size is 15MB.')
  }

  const ext = file.name.split('.').pop() || 'mp3'
  const safeExt = ext.replace(/[^a-zA-Z0-9]/g, '').toLowerCase() || 'mp3'
  const path = `${userId}/${Date.now()}-${Math.random().toString(36).slice(2, 10)}.${safeExt}`

  const { error: uploadError } = await supabase.storage
    .from(AUDIO_BUCKET)
    .upload(path, file, { upsert: false })

  if (uploadError) throw uploadError

  const { data } = supabase.storage
    .from(AUDIO_BUCKET)
    .getPublicUrl(path)

  return data.publicUrl
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

  let structuredExamples: any[] = []
  try {
    const { data: exampleRows, error: exampleError } = await supabase
      .from('entry_usage_examples')
      .select('*')
      .eq('entry_id', id)
      .order('created_at', { ascending: true })

    if (!exampleError) {
      structuredExamples = exampleRows || []
    }
  } catch (exampleFetchError) {
    console.warn('Structured usage example fetch failed:', exampleFetchError)
  }

  const mergedExamples = [
    ...structuredExamples.map((ex) => ({
      id: ex.id,
      context_text: ex.example_text,
      english_translation: ex.english_translation,
      swahili_translation: ex.swahili_translation,
      register: ex.register,
      validation_status: ex.validation_status,
      source: 'entry_usage_examples'
    })),
    ...((data.usage_contexts || []) as any[]).map((ex) => ({
      ...ex,
      context_text: ex.context_text || ex.usage_text || ex.example_sentence || '',
      source: 'usage_contexts'
    }))
  ].filter((ex, index, arr) => {
    const text = String(ex.context_text || '').trim().toLowerCase()
    return text && arr.findIndex((candidate) => String(candidate.context_text || '').trim().toLowerCase() === text) === index
  })

  return {
    ...data,
    contributor_name: data.contributor?.display_name || 'Anonymous Contributor',
    contributor_avatar: data.contributor?.avatar_url || null,
    usage_examples: mergedExamples
  }
}

export async function getEntries(filters?: {
  language_id?: string
  validation_status?: string
  category?: string
  search?: string
  letter?: string
  entry_kind?: 'all' | 'word' | 'phrase'
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
  if (filters?.entry_kind === 'phrase') query = query.eq('part_of_speech', 'phrase')
  if (filters?.entry_kind === 'word') query = query.or('part_of_speech.is.null,part_of_speech.neq.phrase')
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

export async function getRecentEntriesByUser(userId: string, limit = 5) {
  const { data, error } = await supabase
    .from('entries')
    .select('id, headword, language_id, validation_status, created_at')
    .eq('created_by', userId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw error
  return data || []
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
  letter?: string,
  sort: 'headword_asc' | 'newest' | 'trust_desc' = 'headword_asc',
  entryKind: 'all' | 'word' | 'phrase' = 'all'
) {
  let searchQuery = supabase
    .from('entries')
    .select(`*, language:languages(*)`, { count: 'exact' })
    .eq('validation_status', 'verified')
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
  if (entryKind === 'phrase') searchQuery = searchQuery.eq('part_of_speech', 'phrase')
  if (entryKind === 'word') searchQuery = searchQuery.or('part_of_speech.is.null,part_of_speech.neq.phrase')

  if (sort === 'newest') {
    searchQuery = searchQuery.order('created_at', { ascending: false })
  } else if (sort === 'trust_desc') {
    searchQuery = searchQuery.order('trust_score', { ascending: false })
  } else {
    searchQuery = searchQuery.order('headword', { ascending: true })
  }

  const { data, error, count } = await searchQuery
  if (error) throw error
  return {
    rows: data || [],
    total: count || 0
  }
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

  // 1) Try nested select with contributor join
  try {
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
          created_by,
          contributor:user_profiles!created_by (
            display_name,
            avatar_url
          )
        )
      `)
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .range(start, end)

    if (opts?.language) {
      try {
        query = query.eq('entry.language_id', opts.language)
      } catch (e) {
        // ignore nested filter failure; fallback will handle filtering client-side
      }
    }

    const { data, error } = await query
    if (error) throw error

    // If nested entries are present, return them
    const hasEntries = (data || []).some((r: any) => r.entry && r.entry.id)
    if (hasEntries) return data || []
    // otherwise fall through to fallback
  } catch (err) {
    console.warn('Nested getSavedWords with contributor failed, falling back:', err)
  }

  // 2) Fallback: two-step fetch + contributor fetch
  try {
    const { data: savedRows, error: savedErr } = await supabase
      .from('saved_words')
      .select('id, created_at, entry_id')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .range(start, end)

    if (savedErr) throw savedErr
    if (!savedRows || savedRows.length === 0) return []

    const entryIds = savedRows.map((r: any) => r.entry_id)

    // fetch entries (no contributor join)
    const { data: entries, error: entriesErr } = await supabase
      .from('entries')
      .select('id, headword, language_id, part_of_speech, validation_status, created_by')
      .in('id', entryIds)

    if (entriesErr) throw entriesErr

    // fetch contributors by created_by (unique list)
    const creatorIds = Array.from(new Set(entries.map((e: any) => e.created_by).filter(Boolean)))
    let contributors: any[] = []
    if (creatorIds.length > 0) {
      const { data: contribData, error: contribErr } = await supabase
        .from('user_profiles')
        .select('id, display_name, avatar_url')
        .in('id', creatorIds)
      if (contribErr) throw contribErr
      contributors = contribData || []
    }

    // Map savedRows -> { id, created_at, entry: {..., contributor: {...}} }
    const mapped = savedRows.map((r: any) => {
      const entry = entries.find((e: any) => e.id === r.entry_id) || null
      if (entry) {
        const contributor = contributors.find((c: any) => c.id === entry.created_by) || null
        return {
          id: r.id,
          created_at: r.created_at,
          entry: {
            ...entry,
            contributor: contributor ? { display_name: contributor.display_name, avatar_url: contributor.avatar_url } : null
          },
          entry_id: r.entry_id
        }
      }
      return { id: r.id, created_at: r.created_at, entry: null, entry_id: r.entry_id }
    })

    // client-side language filter if requested
    if (opts?.language) {
      return mapped.filter((m: any) => m.entry && m.entry.language_id === opts.language)
    }

    return mapped
  } catch (fallbackErr) {
    throw { message: 'getSavedWords fallback failed', original: fallbackErr }
  }
}


/**
 * Fetch saved words using cursor pagination.
 *
 * - `userId`: id of the current user
 * - `opts.limit`: number of items to return (default 12)
 * - `opts.before`: ISO timestamp string; returns rows with created_at < before (descending order)
 * - `opts.language`: optional language id to filter entries client-side if nested filter unsupported
 *
 * Returns: Array of saved rows with shape:
 * { id, created_at, entry: { id, headword, language_id, part_of_speech, validation_status, created_by, contributor?: { display_name, avatar_url } } | null, entry_id }
 */
export async function getSavedWordsCursor(
  userId: string,
  opts?: { limit?: number; before?: string; language?: string }
) {
  const limit = opts?.limit ?? 12
  const before = opts?.before // ISO timestamp string or null

  // Attempt nested select with contributor join (best-case single request)
  try {
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
          created_by,
          contributor:user_profiles!created_by (
            display_name,
            avatar_url
          )
        )
      `)
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .limit(limit)

    if (before) query = query.lt('created_at', before)

    // best-effort nested filter (may throw in some setups)
    if (opts?.language) {
      try {
        query = query.eq('entry.language_id', opts.language)
      } catch (e) {
        // ignore nested filter failure; fallback will handle filtering client-side
      }
    }

    const { data, error } = await query
    if (error) throw error

    // If nested entries are present, return them
    const hasEntries = (data || []).some((r: any) => r.entry && r.entry.id)
    if (hasEntries) {
      // Ensure each row includes entry_id for compatibility
      return (data || []).map((r: any) => ({ ...r, entry_id: r.entry?.id ?? null }))
    }
    // otherwise fall through to fallback
  } catch (err) {
    console.warn('Nested getSavedWordsCursor failed, falling back:', err)
  }

  // Fallback: two-step fetch (robust)
  try {
    // 1) fetch saved rows (no nested select)
    let savedQuery = supabase
      .from('saved_words')
      .select('id, created_at, entry_id')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .limit(limit)

    if (before) savedQuery = savedQuery.lt('created_at', before)

    const { data: savedRows, error: savedErr } = await savedQuery
    if (savedErr) throw savedErr
    if (!savedRows || savedRows.length === 0) return []

    const entryIds = savedRows.map((r: any) => r.entry_id)

    // 2) fetch entries (only real columns)
    const { data: entries, error: entriesErr } = await supabase
      .from('entries')
      .select('id, headword, language_id, part_of_speech, validation_status, created_by')
      .in('id', entryIds)

    if (entriesErr) throw entriesErr

    // 3) fetch contributors for those entries (unique created_by)
    const creatorIds = Array.from(new Set(entries.map((e: any) => e.created_by).filter(Boolean)))
    let contributors: any[] = []
    if (creatorIds.length > 0) {
      const { data: contribData, error: contribErr } = await supabase
        .from('user_profiles')
        .select('id, display_name, avatar_url')
        .in('id', creatorIds)
      if (contribErr) throw contribErr
      contributors = contribData || []
    }

    // Map savedRows -> { id, created_at, entry: {..., contributor: {...}}, entry_id }
    const mapped = savedRows.map((r: any) => {
      const entry = entries.find((e: any) => e.id === r.entry_id) || null
      if (entry) {
        const contributor = contributors.find((c: any) => c.id === entry.created_by) || null
        return {
          id: r.id,
          created_at: r.created_at,
          entry: {
            ...entry,
            contributor: contributor ? { display_name: contributor.display_name, avatar_url: contributor.avatar_url } : null
          },
          entry_id: r.entry_id
        }
      }
      return { id: r.id, created_at: r.created_at, entry: null, entry_id: r.entry_id }
    })

    // client-side language filter if requested
    if (opts?.language) {
      return mapped.filter((m: any) => m.entry && m.entry.language_id === opts.language)
    }

    return mapped
  } catch (fallbackErr) {
    // Provide context for caller to log/handle
    throw { message: 'getSavedWordsCursor fallback failed', original: fallbackErr }
  }
}


export async function removeSavedWord(userId: string, entryId: string) {
  const { error } = await supabase
    .from('saved_words')
    .delete()
    .match({ user_id: userId, entry_id: entryId })

  if (error) throw error
  return true
}
