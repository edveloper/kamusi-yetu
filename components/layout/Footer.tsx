import Link from 'next/link'
import { CORPUS_LICENCE } from '@/lib/constants/site'

const COLUMNS = [
  {
    heading: 'Use It',
    links: [
      { name: 'Browse', href: '/explore' },
      { name: 'Translate', href: '/translate' },
      { name: 'Coverage', href: '/trending' },
    ],
  },
  {
    heading: 'Build It',
    links: [
      { name: 'Fill A Gap', href: '/contribute/gaps' },
      { name: 'Add A Word', href: '/contribute' },
      { name: 'Standards', href: '/guidelines' },
      { name: 'Reviewers', href: '/moderators' },
    ],
  },
  {
    heading: 'About',
    links: [
      { name: 'The Project', href: '/about' },
      { name: 'Contact', href: '/contact' },
    ],
  },
]

export function Footer() {
  return (
    <footer className="border-t border-ink-800 bg-ink-900 text-ink-300">
      <div className="mx-auto max-w-6xl px-4 py-14 sm:px-6">
        <div className="grid gap-10 md:grid-cols-[1.4fr_repeat(3,1fr)]">
          <div>
            <Link href="/" className="font-logo text-2xl leading-none">
              <span className="text-paper">Lugha</span>
              <span className="text-signal-300">Konnect</span>
            </Link>
            <p className="mt-4 max-w-xs text-[0.9375rem] leading-relaxed text-ink-300">
              An open corpus of Kenya&apos;s languages, documented by the people who speak
              them &mdash; so they are usable by the technology being built now.
            </p>
          </div>

          {COLUMNS.map((column) => (
            <nav key={column.heading} aria-labelledby={`footer-${column.heading}`}>
              <h2 id={`footer-${column.heading}`} className="label text-sand-300">
                {column.heading}
              </h2>
              <ul className="mt-4 space-y-2.5">
                {column.links.map((link) => (
                  <li key={link.href}>
                    <Link
                      href={link.href}
                      className="text-[0.9375rem] text-ink-300 transition-colors hover:text-paper"
                    >
                      {link.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </nav>
          ))}
        </div>

        <div className="mt-12 flex flex-col gap-3 border-t border-ink-800 pt-6 text-[0.8125rem] text-ink-400 sm:flex-row sm:items-center sm:justify-between">
          <p>
            Corpus data licensed{' '}
            <a
              href={CORPUS_LICENCE.url}
              target="_blank"
              rel="license noopener noreferrer"
              className="font-semibold text-ink-300 underline underline-offset-2 hover:text-paper"
            >
              {CORPUS_LICENCE.name}
            </a>
            . Credit contributors and their communities.
          </p>
          <p>
            Built in Kenya by{' '}
            <a
              href="https://www.eddie-ezekiel.com"
              target="_blank"
              rel="noopener noreferrer"
              className="font-semibold text-ink-300 underline underline-offset-2 hover:text-paper"
            >
              Eddie Ezekiel
            </a>
          </p>
        </div>
      </div>
    </footer>
  )
}
