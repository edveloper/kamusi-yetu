import { supabase } from '@/lib/supabase'

export async function getUserProfile(userId: string) {
  const { data, error } = await supabase
    .from('user_profiles')
    .select('*')
    .eq('id', userId)
    .single()

  if (error) {
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

export async function updateUserProfile(
  userId: string,
  updates: {
    username?: string
    display_name?: string
    languages?: string[]
    bio?: string
    avatar_url?: string
  }
) {
  const { data, error } = await supabase
    .from('user_profiles')
    .update(updates)
    .eq('id', userId)
    .select()
    .single()

  if (error) throw error
  return data
}

export async function uploadAvatar(userId: string, file: File) {
  const fileExt = file.name.split('.').pop();
  // We put the userId FIRST so the policy can check it: folder/filename
  const filePath = `${userId}/${Math.random()}.${fileExt}`;

  const { error: uploadError } = await supabase.storage
    .from('avatars')
    .upload(filePath, file);

  if (uploadError) throw uploadError;

  const { data } = supabase.storage
    .from('avatars')
    .getPublicUrl(filePath);

  return data.publicUrl;
}

export async function addUserLanguage(userId: string, languageId: string) {
  const profile = await getUserProfile(userId)
  const currentLanguages = profile.languages || []

  if (!currentLanguages.includes(languageId)) {
    const updatedLanguages = [...currentLanguages, languageId]
    return await updateUserProfile(userId, { languages: updatedLanguages })
  }
  return profile
}

export async function removeUserLanguage(userId: string, languageId: string) {
  const profile = await getUserProfile(userId)
  const currentLanguages = profile.languages || []
  const updatedLanguages = currentLanguages.filter((id: string) => id !== languageId)
  return await updateUserProfile(userId, { languages: updatedLanguages })
}

export async function getUserStats(userId: string) {
  const { count: wordsAdded } = await supabase
    .from('entries')
    .select('*', { count: 'exact', head: true })
    .eq('created_by', userId)

  const { count: validated } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)

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

/**
 * Enhanced Moderator Check
 */
export async function isModerator(userId: string): Promise<boolean> {
  try {
    const { data, error } = await supabase
      .from('user_profiles')
      .select('role')
      .eq('id', userId)
      .single()

    if (error || !data) return false
    const role = data.role?.toLowerCase()
    return ['moderator', 'admin', 'guardian'].includes(role)
  } catch (err) {
    return false
  }
}

/**
 * Enhanced Moderator Stats
 */
export async function getModeratorStats(userId: string) {
  const oneWeekAgo = new Date()
  oneWeekAgo.setDate(oneWeekAgo.getDate() - 7)

  const { count: thisWeek } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)
    .gte('created_at', oneWeekAgo.toISOString())

  const { count: totalValidations } = await supabase
    .from('validations')
    .select('*', { count: 'exact', head: true })
    .eq('validator_id', userId)

  return {
    thisWeek: thisWeek || 0,
    score: (totalValidations || 0) * 10
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

export async function voteOnContext(contextId: string, voteType: 'upvote' | 'downvote') {
  const { data: context, error: fetchError } = await supabase
    .from('usage_contexts')
    .select('upvotes, downvotes')
    .eq('id', contextId)
    .single()

  if (fetchError) throw fetchError

  const updates = voteType === 'upvote'
    ? { upvotes: (context.upvotes || 0) + 1 }
    : { downvotes: (context.downvotes || 0) + 1 }

  const { error: updateError } = await supabase
    .from('usage_contexts')
    .update(updates)
    .eq('id', contextId)

  if (updateError) throw updateError
}

export async function deleteAvatar(path: string) {
  // Path usually looks like "userId/random-id.png"
  const { error } = await supabase.storage
    .from('avatars')
    .remove([path])

  if (error) throw error
}