import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'
import { getLanguageCoverage } from '@/lib/public-site'
import { getPlatformStatus, MACHINE_LEVEL_TEXT } from '@/lib/platform-status'
import { MACHINE_TEST } from '@/lib/translation/machine'
import { COUNTY_LANGUAGE_PRESENCE } from '@/lib/constants/languageCountyPresence'
import KenyaCountyCoverageMap from '@/components/trending/KenyaCountyCoverageMap'
import StatStrip from '@/components/status/StatStrip'
import MachineTag from '@/components/status/MachineTag'
import { LanguageTable, StageLegend } from '@/components/status/LanguageProgress'

// Coverage, not Trending. The old name implied popularity, which is not what
// this measures and not what anyone comes here for. Funders, researchers and
// speakers all arrive asking the same question, which is how far each language
// has come, and the honest answer includes the empty columns.
//
// Every figure comes from lib/platform-status.ts, the same place as the home
// page and About, so the three always agree.

export const revalidate = 300

export const metadata: Metadata = {
  title: 'Coverage',
  description:
    'How far each Kenyan language has come, from dictionary words to sentence pairs, machine translation and recorded voices.',
  alternates: { canonical: `${SITE_URL}/trending` },
}

export default async function CoveragePage() {
  const [status, coverage] = await Promise.all([getPlatformStatus(), getLanguageCoverage()])
  const { languages, totals } = status

  // Open the map on a county that has something in it.
  const topCodes = new Set([...languages].sort((a, b) => b.entries - a.entries).slice(0, 6).map((l) => l.code))
  const bestCounty =
    COUNTY_LANGUAGE_PRESENCE.map((county) => ({
      code: county.countyCode,
      hits: county.languageCodes.filter((code) => topCodes.has(code)).length,
    })).sort((a, b) => b.hits - a.hits)[0]?.code ?? 'ksm'

  const phrasesById = new Map(coverage.map((c) => [c.language_id, c.phrase_entries]))
  const thinnest = languages.filter((l) => l.entries > 0).sort((a, b) => a.percentCovered - b.percentCovered)
  const tested = languages
    .filter((l) => l.machine && MACHINE_TEST.scores[l.code])
    .map((l) => ({ ...l, score: MACHINE_TEST.scores[l.code] }))
  const untested = languages.filter((l) => l.machine && !MACHINE_TEST.scores[l.code] && l.code !== 'sw')

  return (
    <div className="min-h-screen bg-paper">
      {/* ------------------------------------------------------------ head */}
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-6xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Coverage</p>
          <h1 className="display max-w-3xl text-4xl sm:text-5xl md:text-6xl">
            How far each language has come
          </h1>
          <p className="definition mt-7 max-w-2xl text-ink-300">
            Every language moves through the same four stages. Words for the dictionary, real
            sentences with their translations, a machine translator trained on those sentences,
            and recorded voices. Here is where each one stands, empty columns included.
          </p>
        </div>
      </header>

      {/* ---------------------------------------------------------- totals */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <StatStrip totals={totals} />
        </div>
      </section>

      {/* --------------------------------------------------- the four stages */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">From words to voice</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            Machine translation comes first for now, because translating a whole sentence in your
            own language is what brings speakers in, and every correction they make teaches the
            translator. Words and voice grow alongside.
          </p>
          <StageLegend />
          <div className="mt-10">
            <LanguageTable languages={languages} />
          </div>
        </div>
      </section>

      {/* ------------------------------------------------ how good it is */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">How good the translation is</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            We test the translator on real sentences it never saw while learning, and compare
            what it writes with a speaker&apos;s own translation. A score of 100 means the same
            letters in the same order. Above 60 is usually close enough to follow, and below 35
            often gets the gist wrong. Tested {MACHINE_TEST.date}, to and from Kiswahili.
          </p>

          <ul className="reveal-rows border-t border-ink-200">
            {tested.map((l) => (
              <li key={l.id} className="grid gap-x-8 gap-y-3 border-b border-ink-200 py-5 md:grid-cols-[14rem_1fr]">
                <div className="flex items-center justify-between gap-3 md:block">
                  <p className="font-semibold text-ink-900">{l.name}</p>
                  <div className="md:mt-2"><MachineTag level={l.machine} /></div>
                </div>
                <div className="space-y-2.5">
                  {[
                    { label: `${l.name} to Kiswahili`, value: l.score.toSwahili },
                    { label: `Kiswahili to ${l.name}`, value: l.score.fromSwahili },
                  ].map((bar) => (
                    <div key={bar.label} className="grid grid-cols-[1fr_3rem] items-center gap-3 sm:grid-cols-[13rem_1fr_3rem]">
                      <p className="col-span-2 text-sm text-ink-600 sm:col-span-1">{bar.label}</p>
                      <div className="h-2 bg-ink-100" role="img" aria-label={bar.value === null ? 'Not tested yet' : `Scored ${bar.value} out of 100`}>
                        {bar.value !== null && (
                          <div
                            className={`bar-fill h-full ${l.machine === 'trained' ? 'bg-petrol-500' : 'bg-signal-500'}`}
                            style={{ width: `${bar.value}%` }}
                          />
                        )}
                      </div>
                      <p className="tabular text-right font-mono text-sm text-ink-900">
                        {bar.value === null ? 'Soon' : Math.round(bar.value)}
                      </p>
                    </div>
                  ))}
                  <p className="text-xs text-ink-500">{l.score.sentences} test sentences</p>
                </div>
              </li>
            ))}
          </ul>
          {untested.length > 0 && (
            <p className="mt-6 max-w-2xl text-sm text-ink-700">
              {untested.map((l) => l.name).join(' and ')}{' '}
              {untested.length === 1 ? 'uses' : 'use'} Meta&apos;s translation model as it comes, so{' '}
              {untested.length === 1 ? 'it is' : 'they are'} labelled{' '}
              {MACHINE_LEVEL_TEXT.base.label}. We do not have checked sentence pairs to score{' '}
              {untested.length === 1 ? 'it' : 'them'} with yet.
            </p>
          )}
          <div className="mt-8 flex flex-wrap gap-3">
            <Link href="/translate" className="btn-primary">
              Try the Translator
            </Link>
          </div>
        </div>
      </section>

      {/* ------------------------------------------------------------- map */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">Where the languages are</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            County by county, which language communities are mapped there and how many dictionary
            words each one has so far. Hover or tap a county to inspect it.
          </p>
          <KenyaCountyCoverageMap
            initialCountyCode={bestCounty}
            languageMetrics={languages.map((language) => ({
              id: language.id,
              code: language.code,
              name: language.name,
              totalEntries: language.entries,
              phraseEntries: phrasesById.get(language.id) ?? 0,
              coveragePct: language.percentCovered,
              role: language.code === 'sw' ? 'both' : 'indigenous',
            }))}
          />
        </div>
      </section>

      {/* ------------------------------------------------- where to help */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
          <h2 className="mark display mb-2 text-2xl md:text-3xl">Thinnest dictionaries first</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            The languages furthest from covering the 225 core meanings. If you speak one of these,
            an hour here moves it further than an hour anywhere else.
          </p>
          <ul className="reveal-rows border-t border-ink-200">
            {thinnest.slice(0, 8).map((language) => (
              <li key={language.id} className="border-b border-ink-200">
                <Link
                  href={`/contribute/gaps?lang=${language.code}`}
                  className="grid grid-cols-[1fr_auto] items-center gap-4 py-4 transition-colors hover:bg-paper-warm sm:grid-cols-[1fr_10rem_auto]"
                >
                  <div>
                    <p className="font-semibold text-ink-900">{language.name}</p>
                    {language.nativeName && language.nativeName !== language.name && (
                      <p className="text-sm text-ink-600">{language.nativeName}</p>
                    )}
                  </div>
                  <p className="tabular hidden font-mono text-sm text-ink-600 sm:block">
                    {language.conceptsTotal - language.conceptsCovered} meanings missing
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
            {totals.languagesWithVoice === 0
              ? 'Not one of these languages can be heard yet'
              : `Only ${totals.languagesWithVoice} of ${totals.languages} can be heard`}
          </h2>
          <p className="mb-7 max-w-2xl text-ink-700">
            Voice is the last stage and the one that cannot wait forever. Speech recognition and
            reading aloud need recorded speakers, and those cannot be collected later from people
            who are no longer here.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Add a Word
            </Link>
            <Link href="/guidelines" className="btn-secondary">
              How These Numbers Are Made
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
