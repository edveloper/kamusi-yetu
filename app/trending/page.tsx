import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'
import { getCorpusHeadline, getLanguageCoverage } from '@/lib/public-site'
import { COUNTY_LANGUAGE_PRESENCE } from '@/lib/constants/languageCountyPresence'
import KenyaCountyCoverageMap from '@/components/trending/KenyaCountyCoverageMap'
import CountUp from '@/components/ui/CountUp'

// Coverage, not Trending. The old name implied popularity, which is not what
// this measures and not what anyone comes here for. Funders, researchers and
// speakers all arrive asking the same question, which is how much of each
// language actually exists, and the honest answer includes the bad columns.

export const revalidate = 300

export const metadata: Metadata = {
  title: 'Coverage',
  description:
    "How much of each Kenyan language the corpus holds, how much can be heard, and how much is still missing.",
  alternates: { canonical: `${SITE_URL}/trending` },
}

export default async function CoveragePage() {
  const [coverage, headline] = await Promise.all([getLanguageCoverage(), getCorpusHeadline()])

  const withMaturity = coverage.map((language) => ({
    ...language,
    percentCovered:
      language.concepts_total > 0
        ? Math.round((language.concepts_covered / language.concepts_total) * 1000) / 10
        : 0,
  }))

  const strongest = [...withMaturity].sort((a, b) => b.public_entries - a.public_entries)
  const thinnest = [...withMaturity]
    .filter((l) => l.public_entries > 0)
    .sort((a, b) => a.percentCovered - b.percentCovered)

  // Open the map on a county that has something in it. Nairobi was hardcoded
  // and reports "Not Covered, 0, 0", which is the worst possible first cell.
  const topCodes = new Set(strongest.slice(0, 6).map((l) => l.language_code))
  const bestCounty =
    COUNTY_LANGUAGE_PRESENCE.map((county) => ({
      code: county.countyCode,
      hits: county.languageCodes.filter((code) => topCodes.has(code)).length,
    }))
      .sort((a, b) => b.hits - a.hits)[0]?.code ?? 'ksm'

  const totalRecordings = coverage.reduce((sum, l) => sum + l.verified_recordings, 0)
  const totalVoices = coverage.reduce((sum, l) => sum + l.distinct_speakers, 0)
  const languagesWithAudio = coverage.filter((l) => l.verified_recordings > 0).length
  const silent = coverage.filter((l) => l.verified_recordings === 0).length

  return (
    <div className="min-h-screen bg-paper">
      {/* ------------------------------------------------------------ head */}
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-6xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Coverage</p>
          <h1 className="display max-w-3xl text-4xl sm:text-5xl md:text-6xl">
            What each language has so far
          </h1>
          <p className="definition mt-7 max-w-2xl text-ink-300">
            Word counts, phrase counts, how much of the core vocabulary is covered, and how
            much of it can be heard. The gaps are listed alongside the totals.
          </p>
        </div>
      </header>

      {/* ---------------------------------------------------------- totals */}
      {headline && (
        <section className="border-b border-ink-200">
          <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
            <dl className="reveal-rows grid grid-cols-2 gap-x-8 gap-y-8 md:grid-cols-4">
              {[
                { value: headline.indigenous_entries, label: 'Words checked by a person' },
                { value: totalRecordings, label: `Recordings, from ${totalVoices} voices` },
                { value: headline.awaiting_curation, label: 'Still need a definition' },
                { value: headline.awaiting_orthography, label: 'Still need a speaker' },
              ].map((stat) => (
                <div key={stat.label}>
                  <dd className="headword tabular text-5xl text-ink-900 md:text-6xl">
                    <CountUp value={stat.value} />
                  </dd>
                  <dt className="mt-2 text-sm font-semibold text-ink-700">{stat.label}</dt>
                </div>
              ))}
            </dl>
          </div>
        </section>
      )}

      {/* ------------------------------------------------------------- map */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">Where the languages are</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            County by county, which language communities are mapped there and how much of each
            one exists so far. Hover or tap a county to inspect it.
          </p>
          <KenyaCountyCoverageMap
            initialCountyCode={bestCounty}
            languageMetrics={withMaturity.map((language) => ({
              id: language.language_id,
              code: language.language_code,
              name: language.language_name,
              totalEntries: language.public_entries,
              phraseEntries: language.phrase_entries,
              coveragePct: language.percentCovered,
              maturity: 'starter' as const,
            }))}
          />
        </div>
      </section>

      {/* ---------------------------------------------------- every language */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">Every language</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            Sorted by size. The last two columns are the ones that matter most, because a word
            nobody has said out loud cannot teach a machine anything.
          </p>

          <div className="overflow-x-auto">
            <table className="w-full min-w-[46rem] border-collapse text-sm">
              <thead>
                <tr className="border-y border-ink-900">
                  <th className="label py-3 pr-4 text-left text-ink-600">Language</th>
                  <th className="label py-3 pr-4 text-right text-ink-600">Words</th>
                  <th className="label py-3 pr-4 text-right text-ink-600">Phrases</th>
                  <th className="label py-3 pr-4 text-right text-ink-600">Core meanings</th>
                  <th className="label py-3 pr-4 text-right text-ink-600">Recordings</th>
                  <th className="label py-3 text-right text-ink-600">Voices</th>
                </tr>
              </thead>
              <tbody className="stagger">
                {strongest.map((language, index) => {
                  return (
                    <tr
                      key={language.language_id}
                      style={{ '--i': index } as React.CSSProperties}
                      className="border-b border-ink-200"
                    >
                      <td className="py-3 pr-4">
                        <Link
                          href={`/explore?language=${language.language_id}`}
                          className="font-semibold text-ink-900 hover:text-signal-600"
                        >
                          {language.language_name}
                        </Link>
                      </td>
                      <td className="tabular py-3 pr-4 text-right font-mono text-ink-800">
                        {language.public_entries.toLocaleString()}
                      </td>
                      <td className="tabular py-3 pr-4 text-right font-mono text-ink-600">
                        {language.phrase_entries.toLocaleString()}
                      </td>
                      <td className="py-3 pr-4">
                        <div className="flex items-center justify-end gap-3">
                          <div className="hidden h-1.5 w-20 shrink-0 bg-ink-200 sm:block">
                            <div
                              className="bar-fill h-full bg-petrol-500"
                              style={{ width: `${Math.min(100, Math.max(2, language.percentCovered))}%` }}
                            />
                          </div>
                          <span className="tabular w-14 shrink-0 text-right font-mono text-ink-800">
                            {language.percentCovered}%
                          </span>
                        </div>
                      </td>
                      <td
                        className={`tabular py-3 pr-4 text-right font-mono ${
                          language.verified_recordings === 0
                            ? 'text-signal-500'
                            : 'text-ink-800'
                        }`}
                      >
                        {language.verified_recordings === 0 ? 'None' : language.verified_recordings}
                      </td>
                      <td
                        className={`tabular py-3 text-right font-mono ${
                          language.distinct_speakers === 0 ? 'text-signal-500' : 'text-ink-800'
                        }`}
                      >
                        {language.distinct_speakers === 0 ? 'None' : language.distinct_speakers}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </div>
      </section>

      {/* ------------------------------------------------- where to help */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">Thinnest first</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            The languages furthest from covering the core vocabulary. An hour spent on one of
            these moves the corpus further than an hour spent anywhere else.
          </p>
          <ul className="reveal-rows border-t border-ink-200">
            {thinnest.slice(0, 8).map((language) => (
              <li key={language.language_id} className="border-b border-ink-200">
                <Link
                  href={`/contribute/gaps?lang=${language.language_code}`}
                  className="grid grid-cols-[1fr_auto] items-center gap-4 py-4 transition-colors hover:bg-paper-warm sm:grid-cols-[1fr_10rem_auto]"
                >
                  <div>
                    <p className="font-semibold text-ink-900">{language.language_name}</p>
                    {language.native_name && (
                      <p className="text-sm text-ink-600">{language.native_name}</p>
                    )}
                  </div>
                  <p className="tabular hidden font-mono text-sm text-ink-600 sm:block">
                    {language.concepts_total - language.concepts_covered} meanings missing
                  </p>
                  <span className="tabular font-mono text-sm font-semibold text-ink-900">
                    {language.percentCovered}%
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </div>
      </section>

      {/* --------------------------------------------------------- closing */}
      <section className="bg-paper-warm">
        <div className="mx-auto max-w-6xl px-4 py-14 sm:px-6">
          <h2 className="display mb-4 max-w-2xl text-2xl md:text-3xl">
            {languagesWithAudio === 0
              ? 'Not one of these languages can be heard yet'
              : `Only ${languagesWithAudio} of ${coverage.length} can be heard`}
          </h2>
          <p className="mb-7 max-w-2xl text-ink-700">
            Words on a page are half the work. Speech recognition, text to speech and every
            device built on them need recorded voices, and those cannot be collected later from
            speakers who are no longer here.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Record a word
            </Link>
            <Link href="/guidelines" className="btn-secondary">
              How these numbers are made
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
