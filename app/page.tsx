import type { Metadata } from 'next'
import Link from 'next/link'
import { CONTACT, CORPUS_LICENCE, SITE_DESCRIPTION, SITE_NAME, SITE_TITLE, SITE_URL } from '@/lib/constants/site'
import { getPlatformStatus } from '@/lib/platform-status'
import LanguagePicker from '@/components/home/LanguagePicker'
import LanguageMarquee from '@/components/home/LanguageMarquee'
import StatStrip from '@/components/status/StatStrip'
import Roadmap from '@/components/status/Roadmap'
import { LanguageTiles } from '@/components/status/LanguageProgress'
import { serializeJsonLd } from '@/lib/json-ld'
import SearchAutocomplete from '@/components/SearchAutocomplete'

// Searchers do not arrive here. They find a word through a web search and land
// on its entry page. The people who arrive at the homepage are speakers,
// heritage learners and funders, so the page answers their questions instead of
// offering a search box none of them came for. Since November 2026 the lead is
// sentence translation, because that is what brings speakers in.
//
// Every figure comes from lib/platform-status.ts, shared with About and Coverage.

export const revalidate = 300

// Set here, not in the layout: a layout canonical would be inherited by every
// page that lacks its own.
export const metadata: Metadata = {
  alternates: { canonical: '/' },
  openGraph: {
    type: 'website',
    url: '/',
    siteName: SITE_NAME,
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
    locale: 'en_KE',
  },
}

/** "Dholuo, Kikuyu, Kalenjin and 5 more" */
function nameList(names: string[], shown = 4) {
  if (names.length <= shown) return names.slice(0, -1).join(', ') + (names.length > 1 ? ' and ' : '') + names[names.length - 1]
  return `${names.slice(0, shown).join(', ')} and ${names.length - shown} more`
}

export default async function HomePage() {
  const { languages, totals } = await getPlatformStatus()
  const translating = languages.filter((l) => l.machine && l.machine !== 'bridge').map((l) => l.name)

  // The site as a whole for search engines: a searchable site, and an openly
  // licensed dataset (entries themselves are described as DefinedTerms).
  const jsonLd = [
    {
      '@context': 'https://schema.org',
      '@type': 'WebSite',
      name: SITE_NAME,
      url: SITE_URL,
      potentialAction: {
        '@type': 'SearchAction',
        target: { '@type': 'EntryPoint', urlTemplate: `${SITE_URL}/explore?q={search_term_string}` },
        'query-input': 'required name=search_term_string',
      },
    },
    {
      '@context': 'https://schema.org',
      '@type': 'Dataset',
      name: `${SITE_NAME}: an open corpus of Kenya's languages`,
      description: SITE_DESCRIPTION,
      url: SITE_URL,
      license: CORPUS_LICENCE.url,
      isAccessibleForFree: true,
      creator: { '@type': 'Organization', name: SITE_NAME, url: SITE_URL, email: CONTACT.info },
      inLanguage: languages.map((language) => language.code),
      keywords: ['Kenyan languages', 'dictionary', 'translation', 'Kiswahili', 'language corpus'],
    },
  ]

  return (
    <div className="min-h-screen bg-paper">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: serializeJsonLd(jsonLd) }} />
      {/* ---------------------------------------------------------- hero */}
      <section className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-5xl px-4 py-16 sm:px-6 md:py-24">
          <p className="mark label mb-6 text-signal-300">Free to use, open data</p>
          <h1 className="display reveal-wipe max-w-4xl text-5xl sm:text-6xl md:text-7xl lg:text-8xl">
            Kenya&apos;s languages,
            <br />
            <span className="text-signal-300">translated</span> and kept
          </h1>
          <p className="definition mt-8 max-w-xl text-ink-300">
            Write a whole sentence in {nameList(translating)} and read it in Kiswahili or
            English. Speakers correct the translator as they use it, and the words and sentences
            behind it are open for anyone to build on.
          </p>
          <div className="mt-8 flex flex-wrap gap-3">
            <Link href="/translate" className="btn-on-dark">
              Translate a Sentence
            </Link>
          </div>

          <div className="mt-12 border-t border-ink-700 pt-10">
            <LanguagePicker languages={languages} />
          </div>
        </div>
      </section>

      <LanguageMarquee languages={languages} />

      {/* ------------------------------------------------------- the state */}
      <section aria-labelledby="state-heading" className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-12 sm:px-6">
          <h2 id="state-heading" className="mark label mb-8 text-signal-500">
            Where it stands today
          </h2>
          <StatStrip totals={totals} />
          <p className="mt-10 max-w-2xl text-ink-700">
            The last figure is the one most projects would leave out. We show it, because a
            dataset that only shows its good numbers is not one you should build on.{' '}
            <Link href="/guidelines" className="font-semibold text-signal-500 underline underline-offset-2">
              How we decide what counts
            </Link>
            .
          </p>
        </div>
      </section>

      {/* ------------------------------------------------- every language */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="display reveal mb-3 text-2xl md:text-3xl">Where each language is</h2>
          <p className="mb-8 max-w-2xl text-ink-700">
            Every language moves through the same four stages. Words, then real sentences with
            their translations, then a translator trained on those sentences, then recorded
            voices. A filled square is done, a half-filled one is started.
          </p>
          <LanguageTiles languages={languages} />
          <div className="mt-8 flex flex-wrap gap-3">
            <Link href="/trending" className="btn-secondary">
              See the Full Coverage
            </Link>
          </div>
        </div>
      </section>

      {/* ------------------------------------------------------ the roadmap */}
      <section className="border-b border-ink-200">
        <div className="mx-auto max-w-5xl px-4 py-14 sm:px-6">
          <h2 className="display reveal mb-3 text-2xl md:text-3xl">Where this is going</h2>
          <p className="mb-10 max-w-2xl text-ink-700">
            Translation first, because that is what brings speakers in, and every correction they
            make teaches the translator. Words and voice grow alongside.
          </p>
          <Roadmap compact />
          <div className="mt-10">
            <Link href="/about" className="font-semibold text-signal-500 underline underline-offset-2">
              The whole plan, and why
            </Link>
          </div>
        </div>
      </section>

      {/* ------------------------------------------------------ what it is */}
      <section className="border-b border-ink-200">
        <div className="mx-auto grid max-w-5xl gap-10 px-4 py-14 sm:px-6 md:grid-cols-2 md:gap-16">
          <div>
            <h2 className="display reveal mb-4 text-2xl md:text-3xl">What this is</h2>
            <p className="mb-4 text-ink-700">
              A free translator and dictionary for Kenyan languages, and the open data behind
              them. Words, sentences and recordings, contributed by speakers and checked by
              reviewers who speak that language.
            </p>
            <p className="mb-4 text-ink-700">
              The goal is language data good enough to build on, so that translation, speech
              recognition and the devices that use them work in Dholuo and Kalenjin and Taita, not
              only in English.
            </p>
            <p className="text-ink-700">
              The words, sentences and recordings are licensed CC BY 4.0, so anyone can build with
              them as long as they credit the people they came from. Machine translations are
              labelled as such and are never added to that data.
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
              <Link href="/translate" className="font-semibold text-signal-500 underline underline-offset-2">
                translate a whole sentence
              </Link>
              .
            </p>
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
            Every correction to a translation, every word added and every voice recorded is one
            more piece of evidence that these languages can be worked with. That is what makes
            them worth supporting in the tools people actually use.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/translate" className="btn-primary">
              Check a Translation
            </Link>
            <Link href="/contribute/gaps" className="btn-secondary">
              Add a Word
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
