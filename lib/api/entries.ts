import { supabase } from '@/lib/supabase'

export interface CreateEntryData {
    language_id: string
    headword: string
    primary_definition: string
    category?: string // ADDED
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

// Create a new entry
export async function createEntry(data: CreateEntryData) {
    const { data: entry, error } = await supabase
        .from('entries')
        .insert({
            language_id: data.language_id,
            headword: data.headword,
            primary_definition: data.primary_definition,
            category: data.category || null, // ADDED
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

// Get all entries (used in admin or lists)
export async function getEntries(filters?: {
    language_id?: string
    validation_status?: string
    category?: string // ADDED
    search?: string
}) {
    let query = supabase
        .from('entries')
        .select(`
      *,
      language:languages(*)
    `)
        .order('created_at', { ascending: false })

    if (filters?.language_id) {
        query = query.eq('language_id', filters.language_id)
    }

    if (filters?.category) {
        query = query.eq('category', filters.category) // ADDED
    }

    if (filters?.validation_status) {
        query = query.eq('validation_status', filters.validation_status)
    }

    if (filters?.search) {
        query = query.or(`headword.ilike.%${filters.search}%,primary_definition.ilike.%${filters.search}%`)
    }

    const { data, error } = await query

    if (error) throw error
    return data
}

// Get single entry by ID - with explicit translation relationship
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

// Update entry validation status
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

// Search entries (The main function for your Search UI)
export async function searchEntries(query: string, languageId?: string, categoryId?: string) {
    let searchQuery = supabase
        .from('entries')
        .select(`
      *,
      language:languages(*)
    `)
        .limit(20)

    // Handle Text Filter
    if (query && query.trim() !== '') {
        searchQuery = searchQuery.or(`headword.ilike.%${query}%,primary_definition.ilike.%${query}%`)
    }

    // Handle Language Filter
    if (languageId && languageId !== 'all') {
        searchQuery = searchQuery.eq('language_id', languageId)
    }

    // Handle Category Filter (NEW)
    if (categoryId && categoryId !== 'all') {
        searchQuery = searchQuery.eq('category', categoryId)
    }

    const { data, error } = await searchQuery

    if (error) {
        console.error('Search error:', error)
        throw error
    }

    return data
}