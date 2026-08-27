import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'

// Who lands here: someone with a specific reason, and there are only four of
// them. The old page had a heading, a subheading in two languages, and one
// email address, which left the visitor to compose the whole message from
// scratch. Naming the reasons and prefilling the subject does most of that work.

export const metadata: Metadata = {
  title: 'Contact',
  description: 'Ask to review a language, report a problem, work together, or ask about the data.',
  alternates: { canonical: `${SITE_URL}/contact` },
}

const EMAIL = 'ed.veloper10@gmail.com'

const REASONS = [
  {
    title: 'Ask to review a language',
    body: 'Tell us which language and how you know it. Growing up with it is a complete answer.',
    subject: 'Reviewing a language on LughaKonnect',
    prompt: 'Which language, and how you know it.',
  },
  {
    title: 'Something here is wrong',
    body: 'A wrong meaning, a misspelling, or a word that is not really used. Entry pages have a report link, but this works too.',
    subject: 'A correction for LughaKonnect',
    prompt: 'Which entry, and what is wrong with it.',
  },
  {
    title: 'Work together',
    body: 'Universities, archives, language associations, and anyone holding material already collected. Also engineers and researchers.',
    subject: 'Working together on LughaKonnect',
    prompt: 'Who you are and what you have in mind.',
  },
  {
    title: 'Using the data',
    body: 'The corpus is CC BY 4.0, so you do not need permission. Get in touch if you want a bulk export or a format that does not exist yet.',
    subject: 'Using the LughaKonnect corpus',
    prompt: 'What you are building and what format would help.',
  },
]

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Contact</p>
          <h1 className="display text-4xl sm:text-5xl md:text-6xl">Get in touch</h1>
          <p className="definition mt-7 max-w-xl text-ink-300">
            One person reads these, so a short message with the specifics in it gets a faster
            answer than a long one.
          </p>
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
        <ul className="reveal-rows border-t border-ink-200">
          {REASONS.map((reason) => (
            <li key={reason.title} className="border-b border-ink-200">
              <a
                href={`mailto:${EMAIL}?subject=${encodeURIComponent(reason.subject)}`}
                className="group grid gap-x-8 gap-y-2 py-6 transition-colors hover:bg-paper-warm md:grid-cols-[1fr_1.3fr]"
              >
                <div>
                  <h2 className="text-lg font-semibold text-ink-900 group-hover:text-signal-600">
                    {reason.title}
                  </h2>
                  <p className="label mt-1 text-ink-500">{reason.prompt}</p>
                </div>
                <p className="text-ink-700">{reason.body}</p>
              </a>
            </li>
          ))}
        </ul>

        <div className="mt-12 border border-ink-200 bg-paper-warm px-6 py-5">
          <p className="label mb-2 text-ink-600">Or write directly</p>
          <a
            href={`mailto:${EMAIL}`}
            className="font-mono text-lg text-ink-900 underline underline-offset-4 hover:text-signal-600"
          >
            {EMAIL}
          </a>
        </div>

        <section className="mt-14 border-t border-ink-200 pt-8">
          <h2 className="mark label mb-4 text-ink-600">You may not need to write at all</h2>
          <ul className="space-y-3">
            {[
              ['How entries get verified and what the statuses mean', '/guidelines'],
              ['What reviewing involves and how rights are granted', '/moderators'],
              ['How much each language has so far', '/trending'],
              ['Add a word or a recording right now', '/contribute/gaps'],
            ].map(([label, href]) => (
              <li key={href}>
                <Link
                  href={href}
                  className="text-[0.9375rem] text-signal-600 underline underline-offset-4 hover:text-signal-700"
                >
                  {label}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      </main>
    </div>
  )
}
