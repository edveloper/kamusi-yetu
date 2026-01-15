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
}

export interface CreateTranslationData {
    entry_id: string
    language: string
    translation: string
}

/**
 * 1. Create a new entry
 */
export async function createEntry(data: CreateEntryData) {
    const { data: entry, error } = await supabase
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
            created_by: data.created_by
        })
        .select()
        .single()

    if (error) throw error
    return entry
}

/**
 * 2. Get all entries
 * Used for admin lists or general browsing.
 * Defaulted to alphabetical order by headword.
 */
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
      language:languages(*)
    `)
    .order('headword', { ascending: true })

    if (filters?.language_id) {
        query = query.eq('language_id', filters.language_id)
    }

    if (filters?.category) {
        query = query.eq('category', filters.category)
    }

    if (filters?.validation_status) {
        query = query.eq('validation_status', filters.validation_status)
    }

    if (filters?.letter && filters.letter !== 'all') {
        query = query.ilike('headword', `${filters.letter}%`)
    }

    if (filters?.search) {
        query = query.or(`headword.ilike.%${filters.search}%,primary_definition.ilike.%${filters.search}%`)
    }

    const { data, error } = await query

    if (error) throw error
    return data
}

/**
 * 3. Get single entry by ID
 */
export async function getEntryById(id: string) {
    const { data, error } = await supabase
        .from('entries')
        .select(`
      *,
      language:languages(*),
      usage_contexts(*),
      source_translations:translations!translations_source_entry_id_fkey(*),
      target_translations:translations!translations_target_entry_id_fkey(*)
    `)
        .eq('id', id)
        .single()

    if (error) {
        console.error('Entry fetch error:', error)
        throw error
    }

    return data
}

/**
 * 4. Update entry validation status
 */
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

    const { error: validationError } = await supabase
        .from('validations')
        .insert({
            entry_id: entryId,
            validator_id: validatorId,
            action: status === 'verified' ? 'approve' : status === 'flagged' ? 'flag' : 'reject'
        })

    if (validationError) throw validationError
}

/**
 * 5. Search entries
 * Main function for the Search UI with A-Z sorting and letter filtering.
 */
export async function searchEntries(
    query: string, 
    languageId?: string, 
    categoryId?: string, 
    letter?: string
) {
    let searchQuery = supabase
        .from('entries')
        .select(`
      *,
      language:languages(*)
    `)
    .order('headword', { ascending: true }) 
    .limit(100) 

    if (query && query.trim() !== '') {
        searchQuery = searchQuery.or(`headword.ilike.%${query}%,primary_definition.ilike.%${query}%`)
    }

    if (languageId && languageId !== 'all') {
        searchQuery = searchQuery.eq('language_id', languageId)
    }

    if (categoryId && categoryId !== 'all') {
        searchQuery = searchQuery.eq('category', categoryId)
    }

    if (letter && letter !== 'all') {
        searchQuery = searchQuery.ilike('headword', `${letter}%`)
    }

    const { data, error } = await searchQuery

    if (error) {
        console.error('Search error:', error)
        throw error
    }

    return data
}

/**
 * 6. Get the 3 most recently added entries
 * Used for the "Latest Additions" section on the Home Page.
 */
export async function getLatestEntries() {
    const { data, error } = await supabase
        .from('entries')
        .select(`
            *,
            language:languages(*)
        `)
        .order('created_at', { ascending: false })
        .limit(3)

    if (error) throw error
    return data
}

/**
 * 7. Get a "Word of the Day"
 * Uses a deterministic seed based on the date so every user sees the same word daily.
 */
export async function getWordOfTheDay() {
    // Get IDs of all verified (or all) entries to pick from
    const { data: allIds, error } = await supabase
        .from('entries')
        .select('id')
    
    if (error || !allIds || allIds.length === 0) return null

    // Create a seed based on the year, month, and day
    const today = new Date()
    const seed = today.getFullYear() + today.getMonth() + today.getDate()
    
    // Pick an index based on the seed
    const index = seed % allIds.length
    const selectedId = allIds[index].id

    // Return the full entry data
    return await getEntryById(selectedId)
}