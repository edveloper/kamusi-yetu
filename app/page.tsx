import Link from 'next/link'
import { getCorpusHeadline, getLanguageDirectory } from '@/lib/public-site'
import LanguagePicker from '@/components/home/LanguagePicker'
import LanguageMarquee from '@/components/home/LanguageMarquee'
import CountUp from '@/components/ui/CountUp'
import SearchAutocomplete from '@/components/SearchAutocomplete'

// Searchers do not arrive here. They find a word through a web search and land
// on its entry page. The people who arrive at the homepage are speakers,
// heritage learners and funders, so the page answers their questions instead of
// offering a search box none of them came for.

export const revalidate = 300

export default async function HomePage() {
  const [languages, headline] = await Promise.all([
    getLanguageDirectory(),
    getCorpusHeadline(),
  ])

  const withAudio = languages.filter((language) => language.recordings > 0).length
  const emptiest = [...languages]
    .filter((language) => language.entries > 0)
    .sort((a, b) => a.percentCovered - b.percentCovered)
    .slice(0, 6)

  return (
    <div className="min-h-screen bg-paper">
      {/* ---------------------------------------------------------- hero */}
      <section className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-5xl px-4 py-16 sm:px-6 md:py-24">
          <p className="label mb-6 text-signal-300">An open corpus of Kenyan languages</p>
          <h1 className="display reveal-wipe max-w-4xl text-5xl sm:text-6xl md:text-7xl lg:text-8xl">
            Kenya speaks over 40 languages.
            <br />
            <span className="text-signal-300">Your phone speaks two.</span>
          </h1>
          <p className="definition mt-8 max-w-xl text-ink-300">
            We are writing the rest of them into the systems being built right now. Word by
            word, voice by voice, by the people who actually speak them.
          </p>

          <div className="mt-12 border-t border-ink-700 pt-10">
            <LanguagePicker languages={languages} />
          </div>
        </div>
      </section>

      <LanguageMarquee languages={languages} />

      {/* ------------------------------------------------------- the state */}
      {headline && (
        <section aria-labelledby="state-heading" className="border-b border-ink-200">
          <div className="mx-auto max-w-5xl px-4 py-12 sm:px-6">
            <h2 id="state-heading" className="mark label mb-8 text-signal-500">
              Where it stands today
            </h2>
            <dl className="reveal-rows grid grid-cols-2 gap-x-8 gap-y-8 md:grid-cols-4">
              {[
                {
                  value: headline.indigenous_entries,
                  label: 'Words checked by a person',
                },
                {
                  value: headline.languages,
                  label: `Languages, ${withAudio} with a voice`,
                },
                {
                  value: headline.awaiting_curation,
                  label: 'Still need a definition',
                },
                {
                  value: headline.awaiting_orthography,
                  label: 'Still need a speaker',
                },
              ].map((stat) => (
                <div key={stat.label}>
                  <dd className="headword tabular text-5xl text-ink-900 md:text-6xl">
                    <CountUp value={stat.value} />
                  </dd>
                  <dt className="mt-2 text-sm font-semibold text-ink-700">{stat.label}</dt>
                </div>
              ))}
            </dl>
            <p className="mt-10 max-w-2xl text-ink-700">
              The last two numbers are the ones nobody publishes. We do, because a corpus that
              only shows its good figures is not one you should build on.{' '}
              <Link
                href="/guidelines"
                className="font-semibold text-signal-500 underline underline-offset-2"
              >
                How we decide what counts
              </Link>
              .
            </p>
          </div>
        </section>
      )}

      {/* ------------------------------------------------------ what it is */}
      <section className="border-b border-ink-200">
        <div className="mx-auto grid max-w-5xl gap-10 px-4 py-14 sm:px-6 md:grid-cols-2 md:gap-16">
          <div>
            <h2 className="display reveal mb-4 text-2xl md:text-3xl">What this is</h2>
            <p className="mb-4 text-ink-700">
              An open corpus of Kenyan languages. Words, phrases, usage and recordings,
              contributed by speakers and checked by reviewers with standing in that language.
            </p>
            <p className="mb-4 text-ink-700">
              It is not a museum piece. The goal is machine-readable language data good enough
              to build on, so that translation, speech recognition and the devices that use them
              work in Kipsigis and Dholuo and Rendille, not only in English.
            </p>
            <p className="text-ink-700">
              Everything here is licensed CC BY 4.0, so anyone can build with it as long as they
              credit the people it came from.
            </p>
          </div>

          <div>
            <h2 className="display mb-4 text-2xl md:text-3xl">Look something up</h2>
            <p className="mb-5 text-ink-700">
              Search across every language at once, in English, Kiswahili, or the language
              itself.
            </p>
            <form action="/search" className="relative">
              <SearchAutocomplete
                name="q"
                formMode
                placeholder="A word in any language"
                inputClassName="w-full border border-ink-300 bg-card px-4 py-3.5 pr-24 text-ink-900 outline-none placeholder:text-ink-400 focus:border-ink-900"
              />
              <button
                type="submit"
                className="btn-primary absolute right-1.5 top-1/2 -translate-y-1/2 px-4 py-2 text-sm"
              >
                Search
              </button>
            </form>
            <p className="mt-4 text-sm text-ink-600">
              Or{' '}
              <Link
                href="/translate"
                className="font-semibold text-signal-500 underline underline-offset-2"
              >
                move a word between two Kenyan languages
              </Link>
              .
            </p>
          </div>
        </div>
      </section>

      {/* --------------------------------------------------- where to help */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="display reveal mb-3 text-2xl md:text-3xl">These need the most work</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            Ranked by how much of the core vocabulary is still missing. If you speak one of
            these, an hour of your time goes further here than anywhere else on the site.
          </p>

          <ul className="reveal-rows border-t border-ink-200">
            {emptiest.map((language) => (
              <li key={language.id} className="border-b border-ink-200">
                <Link
                  href={`/contribute/gaps?lang=${language.code}`}
                  className="grid grid-cols-[1fr_auto] items-center gap-4 py-4 transition-colors hover:bg-paper-warm sm:grid-cols-[1fr_8rem_8rem_auto]"
                >
                  <div>
                    <p className="font-semibold text-ink-900">{language.name}</p>
                    {language.nativeName && (
                      <p className="text-sm text-ink-600">{language.nativeName}</p>
                    )}
                  </div>
                  <p className="tabular hidden font-mono text-sm text-ink-600 sm:block">
                    {language.entries.toLocaleString()} words
                  </p>
                  <p className="tabular hidden font-mono text-sm text-ink-600 sm:block">
                    {language.recordings} recordings
                  </p>
                  <div className="flex items-center gap-3">
                    <div className="hidden h-1.5 w-20 bg-ink-200 sm:block">
                      <div
                        className="h-full bg-signal-500"
                        style={{
                          width: `${Math.min(100, Math.max(2, language.percentCovered))}%`,
                        }}
                      />
                    </div>
                    <span className="tabular font-mono text-sm font-semibold text-ink-900">
                      {language.percentCovered}%
                    </span>
                  </div>
                </Link>
              </li>
            ))}
          </ul>

          <div className="mt-8 flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Fill a gap
            </Link>
            <Link href="/trending" className="btn-secondary">
              See every language
            </Link>
          </div>
        </div>
      </section>

      {/* --------------------------------------------------------- closing */}
      <section className="bg-paper-warm">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="display mb-4 max-w-2xl text-2xl md:text-3xl">
            If your language is not in a system, neither are you
          </h2>
          <p className="mb-6 max-w-2xl text-ink-700">
            Every word added and every voice recorded is one more piece of evidence that these
            languages can be worked with. That is what makes them worth supporting in the tools
            people actually use.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Add a word from your language
            </Link>
            <Link href="/about" className="btn-secondary">
              Why this exists
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
