import { getCountyLanguagePresence } from '@/lib/constants/languageCountyPresence'
import { groupLanguages } from '@/lib/constants/languageGroups'
import { getExplorePageData } from '@/lib/public-site'
import ExplorePageContent from '@/components/explore/ExplorePageContent'

type ExplorePageProps = {
  searchParams?: Promise<{
    county?: string
  }>
}

export default async function ExplorePage({ searchParams }: ExplorePageProps) {
  const [{ languages, languageCounts, categoryCounts }, resolvedSearchParams] = await Promise.all([
    getExplorePageData(),
    searchParams || Promise.resolve({}),
  ])

  const groupedLanguages = groupLanguages(languages)
  const selectedCountyCode = String(resolvedSearchParams?.county || '').toLowerCase()
  const selectedCounty = selectedCountyCode ? getCountyLanguagePresence(selectedCountyCode) : undefined

  const languageByCode = new Map(
    languages.map((language) => [String(language.code || '').toLowerCase(), language] as const)
  )

  const countyLanguageCards = selectedCounty
    ? selectedCounty.languageCodes
        .map((code) => languageByCode.get(code.toLowerCase()))
        .filter(Boolean)
        .map((lang) => ({ ...lang!, count: languageCounts[lang!.id] || 0 }))
        .sort((a, b) => b.count - a.count)
    : []

  return (
    <ExplorePageContent
      languages={languages}
      groupedLanguages={groupedLanguages}
      languageCounts={languageCounts}
      categoryCounts={categoryCounts}
      selectedCounty={selectedCounty ? { countyName: selectedCounty.countyName, note: selectedCounty.note } : undefined}
      countyLanguageCards={countyLanguageCards}
    />
  )
}
