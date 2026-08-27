import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'
import { getCorpusHeadline, getLanguageCoverage } from '@/lib/public-site'
import CountUp from '@/components/ui/CountUp'

// Funders, journalists and prospective collaborators land here. The job is to
// establish that this is serious and that the person behind it knows why, in
// about thirty seconds of reading.
//
// It absorbs the old Team page. Two pages said overlapping things in two
// different voices, and the weaker voice was on the more-visited one.

export const revalidate = 300

export const metadata: Metadata = {
  title: 'About',
  description:
    'Why LughaKonnect exists, what it has so far, and what it is trying to become. Written by the person building it.',
  alternates: { canonical: `${SITE_URL}/about` },
}

export default async function AboutPage() {
  const [headline, coverage] = await Promise.all([getCorpusHeadline(), getLanguageCoverage()])
  const recordings = coverage.reduce((sum, l) => sum + l.verified_recordings, 0)

  return (
    <div className="min-h-screen bg-paper">
      {/* Scroll progress. No listener, no state, just a scroll timeline. */}
      <div
        aria-hidden="true"
        className="read-progress fixed inset-x-0 top-0 z-[60] h-[3px] origin-left bg-signal-500"
      />

      {/* ------------------------------------------------------------ open */}
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-16 sm:px-6 md:py-24">
          <p className="mark label mb-6 text-signal-300">About</p>
          <h1 className="display reveal-wipe text-4xl sm:text-5xl md:text-6xl">
            Why this exists
          </h1>
          <p className="definition mt-8 max-w-xl text-ink-300">
            Kenyan languages are documented in dictionaries, academic work and community
            projects going back decades. Very little of it sits in one place, in a format
            software can read, under a licence that lets anyone build on it. That is the gap
            this is trying to close.
          </p>
        </div>
      </header>

      {/* -------------------------------------------------------- the person */}
      <section className="border-b border-ink-200">
        <div className="mx-auto grid max-w-5xl gap-10 px-4 py-14 sm:px-6 md:grid-cols-[1fr_1.6fr] md:gap-16">
          <div className="md:sticky md:top-24 md:self-start">
            <h2 className="mark label mb-3 text-ink-600">Who is doing this</h2>
            <p className="display text-2xl text-ink-900">Eddie Ezekiel Ochieng</p>
            <p className="mt-1.5 text-sm text-ink-600">
              Founder and engineer
            </p>
            <a
              href="https://www.eddie-ezekiel.com"
              target="_blank"
              rel="noopener noreferrer"
              className="mt-4 inline-block text-sm font-semibold text-signal-600 underline underline-offset-4"
            >
              eddie-ezekiel.com
            </a>
          </div>

          <div className="reveal">
            <p className="definition mb-5 text-ink-800">
              I started this because too many Kenyan languages are digitally invisible at exactly
              the moment language technology is moving fastest. If a language is missing from
              dictionaries, phrase banks and machine-readable datasets today, it does not simply
              stay where it is. It falls further behind, and the people who speak it lose access
              to tools everyone else gets by default.
            </p>
            <p className="mb-5 text-ink-700">
              My role here is not only technical. I am deciding the data model, the moderation
              rules, what counts as verified and what does not, and how the translation layer
              should work as it grows past single words. Those choices matter more than the code.
            </p>
            <p className="text-ink-700">
              I also build{' '}
              <a
                href="https://www.usalama-voice.com"
                target="_blank"
                rel="noopener noreferrer"
                className="font-semibold text-signal-600 underline underline-offset-2"
              >
                Usalama Voice
              </a>
              , an anti-GBV platform for emergency response and survivor support in Kenya. The
              two are connected. In a crisis, a person needs to understand instructions and
              describe what happened in the language they trust most, and that only works if
              the language exists in the system.
            </p>
          </div>
        </div>
      </section>

      {/* --------------------------------------------------------- the quote */}
      <section className="border-b border-ink-200 bg-ink-900 text-paper">
        <div className="mx-auto max-w-4xl px-4 py-16 sm:px-6 md:py-20">
          <blockquote className="reveal">
            <p className="display text-3xl leading-tight sm:text-4xl md:text-5xl">
              If our languages are absent from the systems shaping the future, our communities
              are absent from that future too
            </p>
          </blockquote>
        </div>
      </section>

      {/* -------------------------------------------------------- the numbers */}
      {headline && (
        <section className="border-b border-ink-200">
          <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
            <h2 className="mark label mb-8 text-ink-600">Where it stands</h2>
            <dl className="reveal-rows grid grid-cols-2 gap-x-8 gap-y-10 md:grid-cols-4">
              {[
                { value: headline.indigenous_entries, label: 'Words a person has checked' },
                { value: headline.languages, label: 'Languages' },
                { value: recordings, label: 'Recordings' },
                { value: headline.awaiting_curation + headline.awaiting_orthography, label: 'Entries held back for review' },
              ].map((stat) => (
                <div key={stat.label}>
                  <dd className="headword tabular text-5xl text-ink-900 md:text-6xl">
                    <CountUp value={stat.value} />
                  </dd>
                  <dt className="mt-2 text-sm font-semibold text-ink-700">{stat.label}</dt>
                </div>
              ))}
            </dl>

            <div className="mt-12 grid gap-8 md:grid-cols-2 md:gap-14">
              <p className="text-ink-700">
                The corpus was seeded from published sources and is now being checked by
                speakers. {headline.awaiting_curation.toLocaleString()} entries are held back
                until someone writes a real definition, and{' '}
                {headline.awaiting_orthography.toLocaleString()} until a speaker confirms the
                spelling, because an old import damaged it. Held-back entries are excluded from
                every public count. We would rather publish a smaller number that is true.
              </p>
              <p className="text-ink-700">
                {recordings === 0
                  ? 'Audio collection is just beginning. It is the priority, because recordings are the one part that cannot be gathered later from speakers who are no longer here.'
                  : `${recordings.toLocaleString()} recordings so far. Audio is the priority, because it is the one part that cannot be gathered later from speakers who are no longer here.`}{' '}
                <Link
                  href="/guidelines"
                  className="font-semibold text-signal-600 underline underline-offset-2"
                >
                  How we decide what counts
                </Link>
                .
              </p>
            </div>
          </div>
        </section>
      )}

      {/* ------------------------------------------------------ what it is for */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="mark display mb-8 text-2xl md:text-3xl">What it is for</h2>
          <ul className="reveal-rows border-t border-ink-200">
            {[
              {
                title: 'A dictionary that works on a phone',
                body: 'Search any Kenyan language, in English, Kiswahili, or the language itself, and hear how a word is actually said.',
              },
              {
                title: 'Translation between Kenyan languages',
                body: 'Not only to and from English. Two languages that record a word for the same meaning can reach each other directly.',
              },
              {
                title: 'Training data anyone can use',
                body: 'Licensed CC BY 4.0 so a keyboard maker, a researcher or a speech company can build on it, provided they credit the people it came from.',
              },
              {
                title: 'A record that outlasts its speakers',
                body: 'Some of these languages have few fluent speakers left. Written entries with recorded audio are what survive them.',
              },
            ].map((item) => (
              <li
                key={item.title}
                className="grid gap-x-10 gap-y-2 border-b border-ink-200 py-6 md:grid-cols-[1fr_1.4fr]"
              >
                <h3 className="text-lg font-semibold text-ink-900">{item.title}</h3>
                <p className="text-ink-700">{item.body}</p>
              </li>
            ))}
          </ul>
        </div>
      </section>

      {/* ---------------------------------------------------------- who helps */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="mark display mb-4 text-2xl md:text-3xl">Who should be doing this with me</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            It started as a community project and it still is, but the more I look at what
            it has to become, the clearer it is that community contribution alone will not get
            there. Reviewing rights are granted per language, so a speaker of one language never
            has authority over another.
          </p>
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {[
              ['First-language speakers', 'The final authority on their language. No degree required, and none implied.'],
              ['Linguists and students', 'Structure, orthography, and the judgement calls that need training.'],
              ['Institutions', 'Universities, archives and language bodies with material already collected.'],
              ['Engineers', 'The speech layer, the export formats, and everything after the dictionary.'],
            ].map(([title, body]) => (
              <div key={title} className="border-t-2 border-ink-900 pt-4">
                <h3 className="font-semibold text-ink-900">{title}</h3>
                <p className="mt-2 text-sm text-ink-700">{body}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ------------------------------------------------------------- close */}
      <section className="bg-paper-warm">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="display mb-4 max-w-2xl text-2xl md:text-3xl">
            If you speak one of these languages, you already have what this needs
          </h2>
          <p className="mb-7 max-w-2xl text-ink-700">
            A word takes about a minute. A recording takes ten seconds. If you work in language,
            research or education and want to do something larger, get in touch.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Add a word
            </Link>
            <Link href="/contact" className="btn-secondary">
              Get in touch
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
