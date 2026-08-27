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
  /** Which county to open on. Defaults to the best-covered one rather than a
   *  hardcoded Nairobi, which reported "Not Covered, 0, 0" as the first thing
   *  a visitor saw on a page meant to show the work is real. */
  initialCountyCode?: string
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
  phrase_ready: 'fill-ink-900 stroke-ink-950',
  growing: 'fill-petrol-400 stroke-petrol-600',
  starter: 'fill-sand-200 stroke-sand-400',
  review_heavy: 'fill-signal-100 stroke-signal-300',
  not_yet_covered: 'fill-paper-warm stroke-ink-200',
}

const MAP_MARKER_CLASSES: Record<LanguageMaturity, string> = {
  phrase_ready: 'fill-paper stroke-ink-900 text-ink-900',
  growing: 'fill-paper stroke-petrol-500 text-petrol-600',
  starter: 'fill-paper stroke-sand-500 text-sand-700',
  review_heavy: 'fill-paper stroke-signal-400 text-signal-600',
  not_yet_covered: 'fill-paper stroke-ink-300 text-ink-500',
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

export default function KenyaCountyCoverageMap({ languageMetrics, initialCountyCode }: CountyCoverageMapProps) {
  const [activeCountyCode, setActiveCountyCode] = useState<string>(initialCountyCode ?? 'nbr')

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


  const covered = countyCoverage.filter((county) => county.coveredLanguageCount > 0).length

  const weakest = selectedCounty
    ? [...selectedCounty.mappedLanguages].sort((a, b) => a.totalEntries - b.totalEntries)[0]
    : null

  return (
    <section aria-label="Coverage by county">
      {/* Legend first. The map is unreadable without it, and putting it below
        * means people scroll past the thing that decodes what they are seeing. */}
      <div className="mb-5 flex flex-wrap items-center gap-x-5 gap-y-2 border-y border-ink-200 py-3">
        {(
          ['phrase_ready', 'growing', 'starter', 'review_heavy', 'not_yet_covered'] as LanguageMaturity[]
        ).map((key) => {
          const definition = getLanguageMaturityDefinition(key)
          const swatch = definition.badgeClassName.split(' ')[0]
          return (
            <span key={key} className="flex items-center gap-2">
              <span className={`h-2.5 w-2.5 border border-ink-300 ${swatch}`} />
              <span className="label text-ink-600">{definition.shortLabel}</span>
            </span>
          )
        })}
        <span className="label ml-auto text-ink-500">
          {covered} of 47 counties have a language with entries
        </span>
      </div>

      <div className="grid gap-8 lg:grid-cols-[minmax(0,1.4fr)_minmax(300px,1fr)] lg:items-start">
        <div>
          <svg
            viewBox={`0 0 ${KENYA_COUNTY_SVG_VIEWBOX.width} ${KENYA_COUNTY_SVG_VIEWBOX.height}`}
            className="h-auto w-full"
            role="img"
            aria-label="Kenya county language coverage map"
          >
            {countyCoverage.map((county) => {
              const countyPath = countyPathMap.get(county.countyName)
              if (!countyPath) return null

              const isActive = county.countyCode === selectedCounty?.countyCode

              return (
                <g
                  key={county.countyCode}
                  onMouseEnter={() => setActiveCountyCode(county.countyCode)}
                  onFocus={() => setActiveCountyCode(county.countyCode)}
                  onClick={() => setActiveCountyCode(county.countyCode)}
                  tabIndex={0}
                  role="button"
                  aria-label={`${county.countyName}, ${county.coveredLanguageCount} languages with entries`}
                  className="cursor-pointer focus:outline-none"
                >
                  <path
                    d={countyPath.d}
                    className={`${MAP_PATH_CLASSES[county.maturity]} transition-[stroke-width] ${
                      isActive ? 'stroke-[3.5px]' : 'stroke-[1.2px]'
                    }`}
                  />
                  {county.coveredLanguageCount > 0 ? (
                    <g transform={`translate(${countyPath.center[0]} ${countyPath.center[1]})`}>
                      <circle
                        r={isActive ? 13 : 10}
                        className={`${MAP_MARKER_CLASSES[county.maturity]} ${
                          isActive ? 'stroke-[2.6px]' : 'stroke-[1.6px]'
                        }`}
                      />
                      <text
                        textAnchor="middle"
                        dominantBaseline="central"
                        className="font-mono text-[10px] font-semibold"
                      >
                        {county.coveredLanguageCount}
                      </text>
                    </g>
                  ) : null}
                </g>
              )
            })}
          </svg>
          <p className="label mt-3 text-ink-500">
            Hover or tap a county. The number is how many of its languages have entries.
          </p>
        </div>

        <div className="lg:sticky lg:top-24">
          {selectedCounty ? (
            <>
              <div className="border-t-2 border-ink-900 pt-4">
                <h3 className="display text-3xl text-ink-900">{selectedCounty.countyName}</h3>
                <p className="label mt-1.5 text-ink-500">
                  {selectedCounty.region.replace('-', ' ')}
                  {selectedCountyMaturity ? ` · ${selectedCountyMaturity.shortLabel}` : ''}
                </p>
              </div>

              <p className="mt-4 text-[0.9375rem] leading-relaxed text-ink-700">
                {selectedCounty.note}
              </p>

              {selectedCounty.mappedLanguages.length === 0 ? (
                <p className="mt-6 border-l-2 border-signal-500 py-1 pl-4 text-[0.9375rem] text-ink-700">
                  No language is mapped to this county yet. If you know which are spoken here,
                  saying so is itself a contribution.
                </p>
              ) : (
                <ul className="mt-6 border-t border-ink-200">
                  {selectedCounty.mappedLanguages.map((language) => {
                    const maturity = getLanguageMaturityDefinition(language.maturity)
                    return (
                      <li
                        key={`${selectedCounty.countyCode}-${language.code}`}
                        className="border-b border-ink-200 py-3"
                      >
                        <div className="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
                          <Link
                            href={`/contribute/gaps?lang=${encodeURIComponent(language.code)}`}
                            className="font-semibold text-ink-900 hover:text-signal-600"
                          >
                            {language.name}
                          </Link>
                          <span className="label text-ink-500">{maturity.shortLabel}</span>
                        </div>
                        <p className="tabular mt-1 font-mono text-xs text-ink-600">
                          {language.totalEntries === 0
                            ? 'nothing recorded yet'
                            : `${language.totalEntries} words, ${language.phraseEntries} phrases`}
                        </p>
                      </li>
                    )
                  })}
                </ul>
              )}

              {weakest ? (
                <div className="mt-6">
                  <Link
                    href={`/contribute/gaps?lang=${encodeURIComponent(weakest.code)}`}
                    className="btn-primary"
                  >
                    {weakest.totalEntries === 0 ? `Start ${weakest.name}` : `Add to ${weakest.name}`}
                  </Link>
                  <p className="mt-2.5 text-sm text-ink-600">
                    {weakest.totalEntries === 0
                      ? 'It has no entries at all.'
                      : `The thinnest language mapped here, with ${weakest.totalEntries} words.`}
                  </p>
                </div>
              ) : null}
            </>
          ) : null}
        </div>
      </div>
    </section>
  )
}
