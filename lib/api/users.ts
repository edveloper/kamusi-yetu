import { supabase } from '@/lib/supabase'

export async function getUserProfile(userId: string) {
  const { data, error } = await supabase
    .from('user_profiles')
    .select('*')
    .eq('id', userId)
    .single()

  if (error) {
    // Profile doesn't exist, create it
    const { data: newProfile, error: createError } = await supabase
      .from('user_profiles')
      .insert({
        id: userId,
        reputation: 0,
        role: 'user'
      })
      .select()
      .single()

    if (createError) throw createError
    return newProfile
  }

  return data
}

export async function updateUserProfile(userId: string, updates: {
  username?: string
  display_name?: string
  languages?: string[]
}) {
  const { data, error } = await supabase
    .from('user_profiles')
    .update(updates)
    .eq('id', userId)
    .select()
    .single()

  if (error) throw error
  return data
}

// Add a language to user's language list
export async function addUserLanguage(userId: string, languageId: string) {
  // Get current profile
  const profile = await getUserProfile(userId)
  const currentLanguages = profile.languages || []
  
  // Add language if not already present
  if (!currentLanguages.includes(languageId)) {
    const updatedLanguages = [...currentLanguages, languageId]
    return await updateUserProfile(userId, { languages: updatedLanguages })
  }
  
  return profile
}

// Remove a language from user's language list
export async function removeUserLanguage(userId: string, languageId: string) {
  const profile = await getUserProfile(userId)
  const currentLanguages = profile.languages || []
  
  const updatedLanguages = currentLanguages.filter((id: string) => id !== languageId)
  return await updateUserProfile(userId, { languages: updatedLanguages })
}

export async function getUserStats(userId: string) {
  // Get entries created by user
  const { count: wordsAdded } = await supabase
    .from('entries')
    .select('*', { count: 'exact', head: true })
    .eq('created_by', userId)

  // Get validations by user
  const { count: validated } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)

  // Get usage contexts by user
  const { count: usageExamples } = await supabase
    .from('usage_contexts')
    .select('*', { count: 'exact', head: true })
    .eq('created_by', userId)

  return {
    wordsAdded: wordsAdded || 0,
    validated: validated || 0,
    usageExamples: usageExamples || 0
  }
}

// Check if user has moderator or admin role
export async function isModerator(userId: string): Promise<boolean> {
  try {
    // First try to get the profile
    const { data, error } = await supabase
      .from('user_profiles')
      .select('role')
      .eq('id', userId)
      .limit(1)

    if (error) {
      console.error('isModerator error:', error)
      // If profile doesn't exist, create it
      const { data: newProfile, error: createError } = await supabase
        .from('user_profiles')
        .insert({ id: userId, reputation: 0, role: 'user' })
        .select('role')
        .single()
      
      if (createError) {
        console.error('Failed to create profile:', createError)
        return false
      }
      
      return newProfile?.role === 'moderator' || newProfile?.role === 'admin'
    }
    
    if (!data || data.length === 0) return false
    
    return data[0].role === 'moderator' || data[0].role === 'admin'
  } catch (err) {
    console.error('isModerator exception:', err)
    return false
  }
}

// Get moderator stats
export async function getModeratorStats(userId: string) {
  // Get validations this week
  const oneWeekAgo = new Date()
  oneWeekAgo.setDate(oneWeekAgo.getDate() - 7)

  const { count: thisWeek } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)
    .gte('created_at', oneWeekAgo.toISOString())

  // Get total validations (moderator score)
  const { count: totalValidations } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)

  return {
    thisWeek: thisWeek || 0,
    score: totalValidations || 0
  }
}

// ==================== USAGE CONTEXTS ====================

export interface CreateUsageContextData {
  entry_id: string
  context_type?: string
  usage_text: string
  example_sentence?: string
  created_by: string
}

// Create a new usage context
export async function createUsageContext(data: CreateUsageContextData) {
  const { data: context, error } = await supabase
    .from('usage_contexts')
    .insert({
      entry_id: data.entry_id,
      context_type: data.context_type || null,
      usage_text: data.usage_text,
      example_sentence: data.example_sentence || null,
      upvotes: 0,
      downvotes: 0,
      created_by: data.created_by
    })
    .select()
    .single()

  if (error) throw error
  return context
}

// Vote on a usage context
export async function voteOnContext(contextId: string, voteType: 'upvote' | 'downvote') {
  // Get current votes
  const { data: context, error: fetchError } = await supabase
    .from('usage_contexts')
    .select('upvotes, downvotes')
    .eq('id', contextId)
    .single()

  if (fetchError) throw fetchError

  // Update votes
  const updates = voteType === 'upvote'
    ? { upvotes: (context.upvotes || 0) + 1 }
    : { downvotes: (context.downvotes || 0) + 1 }

  const { error: updateError } = await supabase
    .from('usage_contexts')
    .update(updates)
    .eq('id', contextId)

  if (updateError) throw updateError
}