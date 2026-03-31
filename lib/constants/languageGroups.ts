type LanguageGroupConfig = {
  key: string
  label: string
  codes: string[]
}

const LANGUAGE_GROUPS: LanguageGroupConfig[] = [
  {
    key: 'luhya',
    label: 'Luhya Cluster',
    codes: ['luy', 'bxk', 'ida', 'rag', 'lts', 'lkb', 'lks', 'lto', 'lwg', 'lrm', 'lsm', 'lko', 'lri', 'nyd', 'nle'],
  },
  {
    key: 'kalenjin',
    label: 'Kalenjin Cluster',
    codes: ['kal', 'sgc', 'niq', 'tuy', 'eyo', 'tec', 'enb', 'pko', 'spy', 'oki', 'omt'],
  },
]

export type LanguageWithGroup<T extends { code?: string | null; name: string }> = T & {
  language_group_key?: string | null
  language_group_label?: string | null
}

export function attachLanguageGroup<T extends { code?: string | null; name: string }>(language: T): LanguageWithGroup<T> {
  const code = String(language.code || '').toLowerCase()
  const group = LANGUAGE_GROUPS.find((item) => item.codes.includes(code))
  return {
    ...language,
    language_group_key: group?.key || null,
    language_group_label: group?.label || null,
  }
}

export function groupLanguages<T extends { name: string; language_group_key?: string | null; language_group_label?: string | null }>(languages: T[]) {
  const grouped = new Map<string, { key: string; label: string; languages: T[] }>()

  for (const language of languages) {
    const key = language.language_group_key || 'other'
    const label = language.language_group_label || 'Other Languages'
    if (!grouped.has(key)) {
      grouped.set(key, { key, label, languages: [] })
    }
    grouped.get(key)!.languages.push(language)
  }

  const order = ['other', 'luhya', 'kalenjin']

  return Array.from(grouped.values())
    .map((group) => ({
      ...group,
      languages: group.languages.slice().sort((a, b) => a.name.localeCompare(b.name)),
    }))
    .sort((a, b) => {
      const aIndex = order.indexOf(a.key)
      const bIndex = order.indexOf(b.key)
      const resolvedA = aIndex === -1 ? Number.MAX_SAFE_INTEGER : aIndex
      const resolvedB = bIndex === -1 ? Number.MAX_SAFE_INTEGER : bIndex
      if (resolvedA !== resolvedB) return resolvedA - resolvedB
      return a.label.localeCompare(b.label)
    })
}
