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

type LanguageMetricLite = {
  id: string
  code: string
  name: string
  totalEntries: number
  phraseEntries: number
  /** 'indigenous', 'bridge' or 'both', straight from languages.role. */
  role: string
  /** Share of core meanings covered. The only figure here that actually varies. */
  coveragePct: number
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
  coveragePct: number
  /** True when the shade comes from a lingua franca rather than a local language. */
  shadedByBridge: boolean
  mappedLanguages: Array<{
    code: string
    name: string
    totalEntries: number
    phraseEntries: number
    coveragePct: number
    isBridge: boolean
  }>
}

const COVERAGE_BUCKETS = [
  { min: 70, fill: 'fill-petrol-600', label: '70% and above' },
  { min: 50, fill: 'fill-petrol-400', label: '50 to 70%' },
  { min: 30, fill: 'fill-petrol-200', label: '30 to 50%' },
  { min: 1, fill: 'fill-petrol-50', label: 'Under 30%' },
  { min: 0, fill: 'fill-paper-warm', label: 'Nothing yet' },
] as const

function bucketFor(pct: number) {
  return COVERAGE_BUCKETS.find((bucket) => pct >= bucket.min) ?? COVERAGE_BUCKETS[4]
}

const MARKER_CLASSES = 'fill-paper stroke-ink-700 text-ink-900'

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
          coveragePct: language!.coveragePct,
          isBridge: language!.role !== 'indigenous',
        }))

      const coveredLanguageCount = mappedLanguages.filter((language) => language.totalEntries > 0).length

      // Shade by the best-covered LOCAL language, not simply the best-covered
      // one. Swahili is mapped to 39 of the 47 counties as a lingua franca, and
      // because it has the largest corpus here it was winning the max in every
      // one of them. The map therefore painted 83% of Kenya a single shade that
      // meant "Swahili is spoken here", which is true everywhere and so tells
      // you nothing, while hiding the thing the page exists to show.
      //
      // Averaging is still wrong for the same reason it always was: it would
      // punish a county for each extra language mapped to it. So it stays a
      // max, taken over the local languages.
      const local = mappedLanguages.filter((language) => !language.isBridge)
      const shading = local.length > 0 ? local : mappedLanguages

      const coveragePct = shading.reduce(
        (best, language) => Math.max(best, language.coveragePct),
        0
      )

      return {
        ...county,
        coveredLanguageCount,
        coveragePct,
        shadedByBridge: local.length === 0,
        mappedLanguages,
      }
    })
  }, [languageMetrics])

  const coverageByCounty = useMemo(
    () => new Map(countyCoverage.map((county) => [county.countyCode, county])),
    [countyCoverage]
  )

  // Apostrophes, hyphens and spacing differ between the presence list and the
  // path data, so neither file has to be edited to keep them in step.
  const countyKey = (name: string) =>
    name.toLowerCase().replace(/[^a-z]/g, '')

  const countyPathMap = useMemo(
    () => new Map(KENYA_COUNTY_SVG_PATHS.map((county) => [countyKey(county.countyName), county])),
    []
  )

  const selectedCounty =
    coverageByCounty.get(activeCountyCode) ||
    countyCoverage.find((county) => county.coveredLanguageCount > 0) ||
    countyCoverage[0]

  const covered = countyCoverage.filter((county) => county.coveredLanguageCount > 0).length

  // Point people at the thinnest LOCAL language. Sending someone to add a word
  // to Swahili, which is the best resourced language on the site, is the one
  // suggestion this map should never make.
  const weakest = selectedCounty
    ? [...selectedCounty.mappedLanguages]
        .filter((language) => !language.isBridge)
        .sort((a, b) => a.totalEntries - b.totalEntries)[0] ?? null
    : null

  return (
    <section aria-label="Coverage by county">
      {/* Legend first. The map is unreadable without it, and putting it below
        * means people scroll past the thing that decodes what they are seeing. */}
      <div className="mb-5 flex flex-wrap items-center gap-x-5 gap-y-2 border-y border-ink-200 py-3">
        <span className="label text-ink-600">Core meanings covered</span>
        {COVERAGE_BUCKETS.slice().reverse().map((bucket) => (
          <span key={bucket.label} className="flex items-center gap-2">
            <span className={`h-2.5 w-2.5 border border-ink-300 ${bucket.fill.replace('fill-', 'bg-')}`} />
            <span className="label text-ink-600">{bucket.label}</span>
          </span>
        ))}
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
            {countyCoverage.map((county, index) => {
              const countyPath = countyPathMap.get(countyKey(county.countyName))
              if (!countyPath) return null

              const isActive = county.countyCode === selectedCounty?.countyCode

              return (
                <g
                  key={county.countyCode}
                  style={{ '--i': index } as React.CSSProperties}
                  onMouseEnter={() => setActiveCountyCode(county.countyCode)}
                  onFocus={() => setActiveCountyCode(county.countyCode)}
                  onClick={() => setActiveCountyCode(county.countyCode)}
                  tabIndex={0}
                  role="button"
                  aria-label={`${county.countyName}, ${county.coveredLanguageCount} languages with entries`}
                  className="county cursor-pointer focus:outline-none"
                >
                  <path
                    d={countyPath.d}
                    className={`${bucketFor(county.coveragePct).fill} transition-all ${
                      isActive
                        ? 'stroke-signal-500 stroke-[3.5px]'
                        : 'stroke-ink-300 stroke-[1px]'
                    }`}
                  />
                  {county.coveredLanguageCount > 0 ? (
                    <g
                      transform={`translate(${countyPath.center[0]} ${countyPath.center[1]})`}
                      className="county-pin"
                      style={{ '--i': index } as React.CSSProperties}
                    >
                      <circle
                        r={isActive ? 13 : 10}
                        className={`${MARKER_CLASSES} ${
                          isActive ? 'stroke-[2.4px]' : 'stroke-[1.4px]'
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
            Shaded by the best covered local language. Swahili and English are listed where they
            are spoken but do not set the shade, or every county would look the same.
          </p>
        </div>

        <div className="lg:sticky lg:top-24">
          {selectedCounty ? (
            <>
              <div className="border-t-2 border-ink-900 pt-4">
                <h3 className="display text-3xl text-ink-900">{selectedCounty.countyName}</h3>
                <p className="label mt-1.5 text-ink-500">
                  {selectedCounty.region.replace('-', ' ')}
                  {' · '}
                  {selectedCounty.coveragePct > 0
                    ? `${selectedCounty.coveragePct}% of core meanings`
                    : 'No core meanings yet'}
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
                          <span className="label text-ink-500">
                            {language.isBridge
                              ? 'Lingua franca'
                              : `${language.coveragePct}% covered`}
                          </span>
                        </div>
                        <p className="tabular mt-1 font-mono text-xs text-ink-600">
                          {language.totalEntries === 0
                            ? 'Nothing recorded yet'
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
