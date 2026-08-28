import type { Metadata } from 'next'
import Link from 'next/link'
import { CORPUS_LICENCE, SITE_NAME, SITE_URL } from '@/lib/constants/site'
import { getCorpusHeadline } from '@/lib/public-site'

// Standards and Method, on one page. A researcher deciding whether to trust this
// and a contributor deciding what belongs are asking the same question from two
// directions, and answering it twice in two places invites the answers to drift.

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Standards and method',
  description:
    'How a word gets into LughaKonnect, what each status means, who is allowed to verify what, and how to cite or reuse the data.',
  alternates: { canonical: `${SITE_URL}/guidelines` },
}

const STAGES = [
  {
    n: '01',
    name: 'Contributed',
    body: 'Someone who speaks the language supplies a word. Either by filling a gap we asked for, or by adding one we did not know to ask about. Nothing is machine-generated in an indigenous language, ever.',
  },
  {
    n: '02',
    name: 'Bridged',
    body: 'Every entry carries at least one bridge translation, English or Kiswahili. This is enforced by the database, not by a form. It is what makes the corpus a connected graph rather than 37 separate word lists.',
  },
  {
    n: '03',
    name: 'Attested',
    body: 'Reviewers with rights in that specific language vouch for it, or dispute it. Two affirmations, at least one from a verified first-language speaker, with no outstanding dispute, meets the bar for publication.',
  },
  {
    n: '04',
    name: 'Voiced',
    body: 'Speakers record it. We keep many recordings per word rather than one, because a speech model learns from variation across age, region and device. One perfect recording teaches it nothing.',
  },
]

const STATUSES = [
  {
    label: 'Verified',
    tone: 'border-l-petrol-500',
    body: 'Publicly visible and counted. Reviewed, bridged, and not flagged for spelling.',
  },
  {
    label: 'Pending',
    tone: 'border-l-ink-400',
    body: 'A person submitted it and it is waiting for review. Not public.',
  },
  {
    label: 'Seeded',
    tone: 'border-l-sand-500',
    body: 'Imported in bulk from published sources, with a placeholder definition. Not public, not counted, waiting for a human. Roughly 1,200 entries are in this state and we would rather say so than pretend otherwise.',
  },
  {
    label: 'Needs orthography review',
    tone: 'border-l-signal-500',
    body: 'An old import damaged the spelling. Held back until a speaker of that language confirms the correct form, because guessing at orthography is the one thing this project must not do.',
  },
]

const CREDENTIALS: Array<[string, string]> = [
  ['Native speaker', 'Grew up speaking the language. The strongest single voucher.'],
  ['Heritage speaker', 'Family language, not spoken daily. Weighted below first-language.'],
  ['Linguist', 'Academic or professional training, verified against an affiliation.'],
  ['Student', 'Studying the language. Contributions welcome, weighted lowest.'],
  ['Institution', 'A university, archive or language body.'],
]

export default async function GuidelinesPage() {
  const headline = await getCorpusHeadline()

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Standards</p>
          <h1 className="display max-w-3xl text-4xl sm:text-5xl md:text-6xl">
            How a word gets in, and how you know it is right
          </h1>
          <p className="definition mt-7 max-w-2xl text-ink-300">
            What we collect, who may verify it, what our numbers do and do not mean, and how to
            reuse the data.
          </p>
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-14 sm:px-6">
        <section className="mb-16">
          <h2 className="label text-ink-600 mb-3">The one rule</h2>
          <p className="definition border-l-2 border-signal-500 pl-5 text-ink-900">
            Only contribute in a language you actually speak. If you are unsure of a word, leave
            it for someone who is not. An honest gap is more useful to us than a confident guess,
            because a guess is very hard to find again later.
          </p>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">How an entry is made</h2>
          <p className="mb-8 text-ink-700">Four stages. An entry can sit at any of them.</p>
          <ol className="border-t border-ink-200">
            {STAGES.map((stage) => (
              <li
                key={stage.n}
                className="grid gap-x-6 border-b border-ink-200 py-6 sm:grid-cols-[3rem_1fr]"
              >
                <span className="label text-signal-500">{stage.n}</span>
                <div>
                  <h3 className="text-lg font-bold text-ink-900">{stage.name}</h3>
                  <p className="mt-1.5 text-ink-700">{stage.body}</p>
                </div>
              </li>
            ))}
          </ol>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">What the statuses mean</h2>
          <p className="mb-8 text-ink-700">
            Our public figures count only the first of these. An entry nobody has checked is not
            a verified entry, however good it looks.
          </p>
          <ul className="space-y-4">
            {STATUSES.map((status) => (
              <li
                key={status.label}
                className={`border border-l-2 border-ink-200 bg-card px-5 py-4 ${status.tone}`}
              >
                <p className="label text-ink-600">{status.label}</p>
                <p className="mt-1.5 text-ink-700">{status.body}</p>
              </li>
            ))}
          </ul>

          {headline && (
            <dl className="mt-8 grid grid-cols-2 border-l border-t border-ink-200 sm:grid-cols-4">
              {[
                { label: 'Indigenous entries', value: headline.indigenous_entries },
                { label: 'Languages', value: headline.languages },
                { label: 'Awaiting curation', value: headline.awaiting_curation },
                { label: 'Awaiting spelling', value: headline.awaiting_orthography },
              ].map((cell) => (
                <div key={cell.label} className="border-b border-r border-ink-200 px-4 py-4">
                  <dd className="tabular font-mono text-2xl font-semibold text-ink-900">
                    {Number(cell.value ?? 0).toLocaleString()}
                  </dd>
                  <dt className="label text-ink-600 mt-1">{cell.label}</dt>
                </div>
              ))}
            </dl>
          )}
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">Who may verify what</h2>
          <p className="mb-6 text-ink-700">
            Authority is granted per language, not globally. A linguist working on Dholuo has no
            standing over Kipsigis, and a Kipsigis first-language speaker with no degree has the
            highest standing there is on Kipsigis.
          </p>
          <div className="border border-ink-200">
            {CREDENTIALS.map(([kind, detail]) => (
              <div
                key={kind}
                className="grid gap-x-6 border-b border-ink-200 px-5 py-3.5 last:border-b-0 sm:grid-cols-[10rem_1fr]"
              >
                <p className="font-semibold text-ink-900">{kind}</p>
                <p className="text-ink-700">{detail}</p>
              </div>
            ))}
          </div>
          <p className="mt-6 text-ink-700">
            A claim is not a credential until a moderator has checked it. Nobody can vouch for an
            entry they contributed themselves. That is enforced by the database, not by policy.
          </p>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">What belongs here</h2>
          <div className="grid gap-8 sm:grid-cols-2">
            <div>
              <p className="label mb-3 text-petrol-500">Yes</p>
              <ul className="space-y-2 text-ink-700">
                <li>Everyday words, as people actually say them</li>
                <li>Greetings, idioms, proverbs, set phrases</li>
                <li>Regional and dialect variants, saying which</li>
                <li>Farming, fishing, craft and ceremonial vocabulary</li>
                <li>Words falling out of use, marked as such</li>
              </ul>
            </div>
            <div>
              <p className="label mb-3 text-signal-500">No</p>
              <ul className="space-y-2 text-ink-700">
                <li>Words you are guessing at</li>
                <li>Invented or joke words</li>
                <li>Slurs and hate speech</li>
                <li>Promotional content</li>
                <li>Knowledge a community has asked not to publish</li>
              </ul>
            </div>
          </div>
          <p className="mt-6 text-ink-700">
            Some knowledge is not any individual&apos;s to publish. Where an entry carries
            ceremonial or otherwise restricted meaning, a community can ask for it to be limited or
            removed, and that request is honoured regardless of the licence.
          </p>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">Recordings and consent</h2>
          <p className="mb-4 text-ink-700">
            Your voice is personal data. We record only with explicit consent, stored against the
            exact wording you agreed to, and you can withdraw at any time from your profile. That
            removes your recordings from the corpus and deletes the audio.
          </p>
          <p className="mb-4 text-ink-700">
            Consent is split into separate permissions rather than one blanket agreement. You choose publishing
            on the site, training speech models, and redistribution under the corpus licence separately. Being
            credited by name is optional and separate. You must be 18 or over.
          </p>
          <p className="text-ink-700">
            We ask where you learned the language, your age band and your voice. Not out of
            curiosity. A speech model trained mostly on one kind of voice from one region works
            badly for everyone else.
          </p>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-2 text-2xl">Using the data</h2>
          <p className="mb-4 text-ink-700">
            The corpus is licensed{' '}
            <a
              href={CORPUS_LICENCE.url}
              target="_blank"
              rel="license noopener noreferrer"
              className="font-semibold text-signal-500 underline underline-offset-2"
            >
              {CORPUS_LICENCE.fullName} ({CORPUS_LICENCE.name})
            </a>
            . Use it for anything, including commercially, as long as you credit the contributors
            and their communities.
          </p>
          <p className="mb-6 text-ink-700">
            We chose attribution over ShareAlike deliberately. Kenyan languages are missing from
            most commercial language technology, and the point of this project is for them to appear
            in it. A ShareAlike clause would oblige every such system to adopt our licence, which in
            practice means most would carry on without these languages.
          </p>
          <div className="border border-ink-200 bg-paper-warm px-5 py-4">
            <p className="label text-ink-600 mb-2">Cite it as</p>
            <p className="font-mono text-sm text-ink-800">
              {SITE_NAME}. {new Date().getFullYear()}. An open corpus of Kenyan languages.{' '}
              {SITE_URL}. Licensed {CORPUS_LICENCE.name}.
            </p>
          </div>
          <p className="mt-6 text-ink-700">
            Every entry records where it came from, so a claim in this corpus can be traced.
            Material under a ShareAlike licence is never merged into the corpus, precisely so the
            licence above stays true.
          </p>
        </section>

        <section className="border-t border-ink-900 pt-10">
          <h2 className="display mb-3 text-2xl">Ready?</h2>
          <p className="mb-6 max-w-xl text-ink-700">
            The fastest way to help is to fill a gap. We will show you meanings your language does
            not have yet, one at a time.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contribute/gaps" className="btn-primary">
              Fill a gap
            </Link>
            <Link href="/explore" className="btn-secondary">
              Browse the corpus
            </Link>
          </div>
        </section>
      </main>
    </div>
  )
}
