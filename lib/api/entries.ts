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
            created_by: data.created_by
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
        query = query.or(`headword.ilike.%${filters.search}%,primary_definition.ilike.%${filters.search}%`)
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
        .eq('validation_status', 'verified') // Only search verified
        .order('headword', { ascending: true })
        .limit(100)

    if (query && query.trim() !== '') {
        searchQuery = searchQuery.or(`headword.ilike.%${query}%,primary_definition.ilike.%${query}%`)
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
    const { data: existing } = await supabase
        .from('saved_words')
        .select()
        .eq('user_id', userId)
        .eq('entry_id', entryId)
        .single()

    if (existing) {
        await supabase.from('saved_words').delete().eq('id', existing.id)
        return false
    } else {
        await supabase.from('saved_words').insert([{ user_id: userId, entry_id: entryId }])
        return true
    }
}