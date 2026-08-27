import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'
import { getLanguageCoverage } from '@/lib/public-site'

// Who lands here: someone deciding whether to review, or a linguist working out
// whether their standing would be recognised. The job is to answer "what would
// I actually be responsible for, and who decides that", concretely.
//
// The old page listed four abstract duties (Entry Validation, Data Stewardship)
// and an empty "Active Teams" panel. It described a bureaucracy rather than a
// role, and none of it reflected how authority actually works now.

export const revalidate = 300

export const metadata: Metadata = {
  title: 'Reviewers',
  description:
    'How reviewing works on LughaKonnect, what a reviewer decides, and how rights are granted per language.',
  alternates: { canonical: `${SITE_URL}/moderators` },
}

const CREDENTIALS: Array<[string, string]> = [
  [
    'First-language speaker',
    'You grew up speaking it. This is the strongest standing there is here, and it needs no qualification of any kind.',
  ],
  [
    'Heritage speaker',
    'It is your family language but you did not grow up using it daily. Your judgement counts, weighted below a first-language speaker.',
  ],
  [
    'Linguist',
    'Academic or professional training, verified against an affiliation. Useful on orthography, structure and the calls that need method.',
  ],
  [
    'Student',
    'Studying the language formally. You can review, weighted lowest, and your work is visible to others.',
  ],
  [
    'Institution',
    'A university, archive or language body holding material already collected.',
  ],
]

const DECISIONS: Array<[string, string]> = [
  [
    'Approve an entry',
    'The word is real, the spelling is right, and the meaning is accurate. Two approvals from different people, at least one a verified speaker, publishes it.',
  ],
  [
    'Send it back',
    'Something is wrong. You have to say what, and the contributor is shown your reason. An unexplained rejection is how a first-time contributor becomes a former one.',
  ],
  [
    'Dispute it',
    'You believe the entry is wrong and want it held. One dispute is enough to stop publication until it is resolved.',
  ],
  [
    'Approve a recording',
    'The audio is audible, it is the right word, and it is the language it claims to be.',
  ],
  [
    'Repair spelling',
    'The 358 quarantined entries need a speaker to confirm the correct form. This is the queue where a first-language speaker is worth more than anyone else on the project.',
  ],
]

export default async function ReviewersPage() {
  const coverage = await getLanguageCoverage()
  const withSpeakers = coverage.filter((l) => l.verified_speakers > 0).length
  const withoutSpeakers = coverage.filter((l) => l.verified_speakers === 0)

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Reviewers</p>
          <h1 className="display text-4xl sm:text-5xl md:text-6xl">
            Nobody reviews a language they do not speak
          </h1>
          <p className="definition mt-7 max-w-xl text-ink-300">
            Reviewing rights are granted for one language at a time. A linguist working on
            Dholuo has no standing over Kipsigis, and a Kipsigis speaker with no formal training
            has the final word on Kipsigis.
          </p>
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
        <section className="mb-16">
          <h2 className="mark display mb-3 text-2xl">What a reviewer decides</h2>
          <p className="mb-8 text-ink-700">
            Five decisions, all of them recorded against your name and visible on the entry.
          </p>
          <ol className="reveal-rows border-t border-ink-200">
            {DECISIONS.map(([title, body], index) => (
              <li
                key={title}
                className="grid gap-x-6 border-b border-ink-200 py-5 sm:grid-cols-[2.5rem_1fr]"
              >
                <span className="label text-signal-500">
                  {String(index + 1).padStart(2, '0')}
                </span>
                <div>
                  <h3 className="font-semibold text-ink-900">{title}</h3>
                  <p className="mt-1.5 text-ink-700">{body}</p>
                </div>
              </li>
            ))}
          </ol>
        </section>

        <section className="mb-16">
          <h2 className="mark display mb-3 text-2xl">What counts as standing</h2>
          <p className="mb-8 text-ink-700">
            You claim a credential, a moderator checks it, and only then does it carry weight.
            A claim on its own does nothing.
          </p>
          <div className="border border-ink-200">
            {CREDENTIALS.map(([kind, detail]) => (
              <div
                key={kind}
                className="grid gap-x-6 border-b border-ink-200 px-5 py-4 last:border-b-0 sm:grid-cols-[11rem_1fr]"
              >
                <p className="font-semibold text-ink-900">{kind}</p>
                <p className="text-ink-700">{detail}</p>
              </div>
            ))}
          </div>
          <p className="mt-6 text-ink-700">
            You cannot vouch for an entry you contributed yourself. That is enforced by the
            database rather than by policy, so it cannot be forgotten.
          </p>
        </section>

        {/* The real reason to read this page: most languages have nobody. */}
        <section className="mb-16">
          <h2 className="mark display mb-3 text-2xl">Which languages have nobody</h2>
          <p className="mb-8 text-ink-700">
            {withSpeakers === 0
              ? 'No language has a verified reviewer yet. Every one of these is waiting for its first.'
              : `${withSpeakers} of ${coverage.length} languages have at least one verified reviewer. These do not.`}
          </p>
          <ul className="flex flex-wrap gap-2">
            {withoutSpeakers.slice(0, 40).map((language) => (
              <li key={language.language_id}>
                <Link
                  href={`/contact?language=${encodeURIComponent(language.language_code)}`}
                  className="inline-block border border-ink-200 px-3 py-1.5 text-sm text-ink-700 transition-colors hover:border-signal-500 hover:text-signal-600"
                >
                  {language.language_name}
                </Link>
              </li>
            ))}
          </ul>
        </section>

        <section className="border-t-2 border-ink-900 pt-10">
          <h2 className="display mb-3 text-2xl">Asking to review</h2>
          <p className="mb-7 max-w-xl text-ink-700">
            Tell us which language and how you know it. Growing up with it is a complete
            answer. If you have contributed entries already, say so, because it makes the
            decision straightforward.
          </p>
          <div className="flex flex-wrap gap-3">
            <Link href="/contact" className="btn-primary">
              Ask to review a language
            </Link>
            <Link href="/guidelines" className="btn-secondary">
              Read the standards first
            </Link>
          </div>
        </section>
      </main>
    </div>
  )
}
