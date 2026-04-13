'use client'

import { useMemo, useState } from 'react'
import Link from 'next/link'
import {
  COUNTY_LANGUAGE_PRESENCE,
  type CountyLanguagePresence,
} from '@/lib/constants/languageCountyPresence'
import {
  KENYA_COUNTY_SVG_PATHS,
  KENYA_COUNTY_SVG_VIEWBOX,
} from '@/lib/constants/kenyaCountySvgPaths'
import {
  getLanguageMaturityDefinition,
  type LanguageMaturity,
} from '@/lib/constants/languageMaturity'

type LanguageMetricLite = {
  id: string
  code: string
  name: string
  totalEntries: number
  phraseEntries: number
  maturity: LanguageMaturity
}

type CountyCoverageMapProps = {
  languageMetrics: LanguageMetricLite[]
}

type CountyCoverageView = CountyLanguagePresence & {
  coveredLanguageCount: number
  maturity: LanguageMaturity
  mappedLanguages: Array<{
    code: string
    name: string
    totalEntries: number
    phraseEntries: number
    maturity: LanguageMaturity
  }>
}

const MAP_PATH_CLASSES: Record<LanguageMaturity, string> = {
  phrase_ready: 'fill-emerald-700 stroke-emerald-900',
  growing: 'fill-emerald-300 stroke-emerald-500',
  starter: 'fill-lime-100 stroke-lime-300',
  review_heavy: 'fill-amber-100 stroke-amber-300',
  not_yet_covered: 'fill-stone-100 stroke-stone-300',
}

const MAP_MARKER_CLASSES: Record<LanguageMaturity, string> = {
  phrase_ready: 'fill-white stroke-emerald-900 text-emerald-950',
  growing: 'fill-white stroke-emerald-500 text-emerald-950',
  starter: 'fill-white stroke-lime-400 text-lime-950',
  review_heavy: 'fill-white stroke-amber-400 text-amber-950',
  not_yet_covered: 'fill-stone-50 stroke-stone-300 text-stone-500',
}

function strongestMaturity(maturities: LanguageMaturity[]) {
  const order: LanguageMaturity[] = [
    'phrase_ready',
    'growing',
    'starter',
    'review_heavy',
    'not_yet_covered',
  ]

  for (const key of order) {
    if (maturities.includes(key)) return key
  }

  return 'not_yet_covered'
}

export default function KenyaCountyCoverageMap({ languageMetrics }: CountyCoverageMapProps) {
  const [activeCountyCode, setActiveCountyCode] = useState<string>('nbr')

  const countyCoverage = useMemo<CountyCoverageView[]>(() => {
    const metricsByCode = new Map(
      languageMetrics.map((language) => [language.code.toLowerCase(), language] as const)
    )

    return COUNTY_LANGUAGE_PRESENCE.map((county) => {
      const mappedLanguages = county.languageCodes
        .map((code) => metricsByCode.get(code.toLowerCase()))
        .filter(Boolean)
        .map((language) => ({
          code: language!.code,
          name: language!.name,
          totalEntries: language!.totalEntries,
          phraseEntries: language!.phraseEntries,
          maturity: language!.maturity,
        }))

      const coveredLanguageCount = mappedLanguages.filter((language) => language.totalEntries > 0).length
      const maturity = strongestMaturity(
        mappedLanguages
          .filter((language) => language.totalEntries > 0 || language.maturity === 'review_heavy')
          .map((language) => language.maturity)
      )

      return {
        ...county,
        coveredLanguageCount,
        maturity,
        mappedLanguages,
      }
    })
  }, [languageMetrics])

  const coverageByCounty = useMemo(
    () => new Map(countyCoverage.map((county) => [county.countyCode, county])),
    [countyCoverage]
  )

  const countyPathMap = useMemo(
    () => new Map(KENYA_COUNTY_SVG_PATHS.map((county) => [county.countyName, county])),
    []
  )

  const selectedCounty =
    coverageByCounty.get(activeCountyCode) ||
    countyCoverage.find((county) => county.coveredLanguageCount > 0) ||
    countyCoverage[0]

  const selectedCountyMaturity = selectedCounty
    ? getLanguageMaturityDefinition(selectedCounty.maturity)
    : null

  const countyMissions = selectedCounty
    ? selectedCounty.mappedLanguages
        .map((language) => {
          if (language.totalEntries === 0) {
            return {
              code: language.code,
              label: `Start ${language.name}`,
              detail: 'This county-linked language still needs its first visible word and phrase base.',
            }
          }

          if (language.phraseEntries === 0) {
            return {
              code: language.code,
              label: `Add phrase coverage in ${language.name}`,
              detail: 'The language is live, but phrase coverage is still missing.',
            }
          }

          if (language.maturity === 'review_heavy' || language.phraseEntries < 5) {
            return {
              code: language.code,
              label: `Strengthen ${language.name}`,
              detail: 'More verified phrases and better bridge coverage would improve translation quality quickly.',
            }
          }

          return {
            code: language.code,
            label: `Add examples in ${language.name}`,
            detail: 'This language is growing; usage examples will make phrase and sentence work much stronger.',
          }
        })
        .slice(0, 2)
    : []

  return (
    <section className="mb-10 rounded-[2rem] border border-emerald-200 bg-gradient-to-br from-white via-emerald-50/70 to-lime-50/60 p-4 sm:p-6 lg:p-8 shadow-sm">
      <div className="mb-6 flex flex-col gap-4 xl:flex-row xl:items-end xl:justify-between">
        <div className="max-w-3xl">
          <p className="text-[10px] font-black uppercase tracking-[0.25em] text-emerald-700 mb-2">Kenya Coverage Map</p>
          <h2 className="text-2xl sm:text-3xl font-black font-logo text-stone-900">Community presence by county</h2>
          <p className="text-sm text-stone-600 font-medium mt-3 leading-relaxed">
            A county-by-county view of where language communities are strongly associated, what Kamusi Yetu already covers, and where the next contributions can make the biggest difference.
          </p>
        </div>

        <div className="rounded-2xl border border-emerald-100 bg-white/85 backdrop-blur px-4 py-3">
          <p className="text-[10px] font-black uppercase tracking-[0.22em] text-stone-500 mb-2">Selected County</p>
          {selectedCounty ? (
            <div className="flex flex-wrap items-center gap-3">
              <div>
                <p className="font-black text-stone-900">{selectedCounty.countyName}</p>
                <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">
                  {selectedCounty.region.replace('-', ' ')}
                </p>
              </div>
              {selectedCountyMaturity ? (
                <span className={`px-2.5 py-1.5 rounded-lg text-[10px] font-black uppercase tracking-widest ${selectedCountyMaturity.badgeClassName}`}>
                  {selectedCountyMaturity.shortLabel}
                </span>
              ) : null}
            </div>
          ) : null}
        </div>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        {(['phrase_ready', 'growing', 'starter', 'review_heavy', 'not_yet_covered'] as LanguageMaturity[]).map((key) => {
          const definition = getLanguageMaturityDefinition(key)
          return (
            <div key={key} className="flex items-center gap-2 rounded-full border border-stone-200 bg-white/85 px-3 py-2 backdrop-blur">
              <span className={`h-3 w-3 rounded-full ${definition.badgeClassName.split(' ')[0].replace('bg-', 'bg-')}`}></span>
              <span className="text-[10px] font-black uppercase tracking-[0.18em] text-stone-600">{definition.shortLabel}</span>
            </div>
          )
        })}
      </div>

      <div className="grid gap-6 xl:grid-cols-[minmax(0,1.35fr)_minmax(320px,0.8fr)] xl:items-start">
        <div className="rounded-[1.75rem] border border-emerald-100 bg-white/90 backdrop-blur p-4 sm:p-5 lg:p-6">
          <div className="mb-4 flex flex-wrap items-center justify-between gap-3">
            <div>
              <p className="text-[10px] font-black uppercase tracking-[0.22em] text-stone-500 mb-2">Map View</p>
              <p className="text-sm text-stone-600 font-medium">
                Hover or tap a county to inspect the languages mapped there and see where coverage is strong or still growing.
              </p>
            </div>
            <div className="rounded-xl border border-stone-200 bg-stone-50 px-3 py-2 text-[10px] font-black uppercase tracking-widest text-stone-500">
              47 counties
            </div>
          </div>

          <div className="rounded-[1.5rem] border border-stone-100 bg-[radial-gradient(circle_at_top,#ffffff_0%,#ecfdf5_42%,#f5f5f4_100%)] p-3 sm:p-4">
            <svg
              viewBox={`0 0 ${KENYA_COUNTY_SVG_VIEWBOX.width} ${KENYA_COUNTY_SVG_VIEWBOX.height}`}
              className="w-full h-auto max-h-[78vh]"
              role="img"
              aria-label="Kenya county language coverage map"
            >
              <g className="drop-shadow-[0_24px_36px_rgba(18,36,24,0.14)]">
                {countyCoverage.map((county) => {
                  const countyPath = countyPathMap.get(county.countyName)
                  if (!countyPath) return null

                  const isActive = county.countyCode === selectedCounty?.countyCode
                  const markerClasses = MAP_MARKER_CLASSES[county.maturity]

                  return (
                    <g
                      key={county.countyCode}
                      onMouseEnter={() => setActiveCountyCode(county.countyCode)}
                      onClick={() => setActiveCountyCode(county.countyCode)}
                      className="cursor-pointer"
                    >
                      <path
                        d={countyPath.d}
                        className={`${MAP_PATH_CLASSES[county.maturity]} transition-all ${isActive ? 'stroke-[3px]' : 'stroke-[1.6px]'}`}
                      />

                      {county.coveredLanguageCount > 0 ? (
                        <g transform={`translate(${countyPath.center[0]} ${countyPath.center[1]})`}>
                          <circle
                            r={isActive ? 13 : 11}
                            className={`${markerClasses} ${isActive ? 'stroke-[2.6px]' : 'stroke-[1.8px]'}`}
                          />
                          <text
                            textAnchor="middle"
                            dominantBaseline="central"
                            className="text-[10px] font-black"
                          >
                            {county.coveredLanguageCount}
                          </text>
                        </g>
                      ) : null}
                    </g>
                  )
                })}
              </g>
            </svg>
          </div>
        </div>

        <div className="rounded-[1.75rem] border border-stone-200 bg-white p-6 sm:p-8 shadow-sm xl:sticky xl:top-24">
          {selectedCounty ? (
            <>
              <div className="flex items-start justify-between gap-4 mb-6">
                <div>
                  <p className="text-[10px] font-black uppercase tracking-[0.25em] text-emerald-700 mb-2">County Detail</p>
                  <h2 className="text-2xl font-black font-logo text-stone-900">{selectedCounty.countyName}</h2>
                  <p className="text-[10px] font-black uppercase tracking-widest text-stone-500 mt-2">
                    {selectedCounty.region.replace('-', ' ')}
                  </p>
                </div>
                {selectedCountyMaturity ? (
                  <span className={`px-3 py-2 rounded-xl text-[10px] font-black uppercase tracking-[0.18em] ${selectedCountyMaturity.badgeClassName}`}>
                    {selectedCountyMaturity.shortLabel}
                  </span>
                ) : null}
              </div>

              <p className="text-sm text-stone-600 font-medium leading-relaxed mb-6">
                {selectedCounty.note}
              </p>

              <div className="grid grid-cols-2 gap-4 mb-6">
                <div className="rounded-2xl border border-stone-100 bg-stone-50 p-4">
                  <p className="text-[10px] font-black uppercase tracking-[0.18em] text-stone-400 mb-2">Mapped Languages</p>
                  <p className="text-2xl font-black text-stone-900 font-logo">{selectedCounty.mappedLanguages.length}</p>
                </div>
                <div className="rounded-2xl border border-stone-100 bg-stone-50 p-4">
                  <p className="text-[10px] font-black uppercase tracking-[0.18em] text-stone-400 mb-2">Live In Kamusi Yetu</p>
                  <p className="text-2xl font-black text-stone-900 font-logo">{selectedCounty.coveredLanguageCount}</p>
                </div>
              </div>

              <div className="space-y-3 mb-6">
                {selectedCounty.mappedLanguages.map((language) => {
                  const maturity = getLanguageMaturityDefinition(language.maturity)
                  return (
                    <div key={`${selectedCounty.countyCode}-${language.code}`} className="rounded-2xl border border-stone-100 bg-stone-50 p-4">
                      <div className="flex items-start justify-between gap-3 mb-2">
                        <div>
                          <p className="font-black text-stone-900">{language.name}</p>
                          <p className="text-[10px] font-black uppercase tracking-widest text-stone-500">{language.code}</p>
                        </div>
                        <span className={`px-2 py-1 rounded-lg text-[10px] font-black uppercase tracking-widest ${maturity.badgeClassName}`}>
                          {maturity.shortLabel}
                        </span>
                      </div>
                      <div className="flex items-center justify-between text-[10px] font-black uppercase tracking-widest text-stone-500">
                        <span>{language.totalEntries} entries</span>
                        <span>{language.phraseEntries} phrases</span>
                      </div>
                    </div>
                  )
                })}
              </div>

              {countyMissions.length > 0 ? (
                <div className="mb-6 rounded-2xl border border-emerald-100 bg-emerald-50 p-4">
                  <p className="text-[10px] font-black uppercase tracking-[0.22em] text-emerald-700 mb-3">Contribution Missions</p>
                  <div className="space-y-3">
                    {countyMissions.map((mission) => (
                      <div key={`${selectedCounty.countyCode}-${mission.code}`} className="rounded-xl border border-white/80 bg-white/80 p-3">
                        <p className="text-sm font-black text-stone-900">{mission.label}</p>
                        <p className="mt-1 text-sm text-stone-600 font-medium">{mission.detail}</p>
                      </div>
                    ))}
                  </div>
                </div>
              ) : null}

              <div className="flex flex-wrap gap-2">
                <Link
                  href={`/explore?county=${encodeURIComponent(selectedCounty.countyCode)}`}
                  className="px-3 py-2 rounded-xl border border-stone-200 bg-white text-[10px] font-black uppercase tracking-widest text-stone-700 hover:border-emerald-200 hover:text-emerald-700"
                >
                  Explore {selectedCounty.countyName}
                </Link>
                {selectedCounty.mappedLanguages.slice(0, 2).map((language) => (
                  <Link
                    key={`contribute-${selectedCounty.countyCode}-${language.code}`}
                    href={`/contribute?lang=${encodeURIComponent(language.code)}`}
                    className="px-3 py-2 rounded-xl bg-emerald-600 text-white text-[10px] font-black uppercase tracking-widest hover:bg-emerald-500"
                  >
                    Add in {language.code}
                  </Link>
                ))}
              </div>
            </>
          ) : null}
        </div>
      </div>
    </section>
  )
}
