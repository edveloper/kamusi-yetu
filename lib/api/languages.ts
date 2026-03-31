import { supabase } from '@/lib/supabase'
import { attachLanguageGroup } from '@/lib/constants/languageGroups'

export async function getLanguages() {
  const { data, error } = await supabase
    .from('languages')
    .select('*')
    .eq('is_active', true)
    .order('name')

  if (error) throw error
  return (data || []).map(attachLanguageGroup)
}

export async function getLanguageByCode(code: string) {
  const { data, error } = await supabase
    .from('languages')
    .select('*')
    .eq('code', code)
    .single()

  if (error) throw error
  return data ? attachLanguageGroup(data) : data
}
