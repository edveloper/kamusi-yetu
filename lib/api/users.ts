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