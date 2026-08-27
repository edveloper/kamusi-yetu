'use client'

import Link from 'next/link'

export function Footer() {
  return (
    <footer className="bg-heritage-dark text-neutral-100 border-t border-heritage-darker/30 font-sans">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-10">
          <div className="space-y-5 md:col-span-1">
            <Link href="/" className="text-heritage-light font-black text-3xl leading-tight tracking-tight font-display">
              LughaKonnect
            </Link>
            <p className="text-neutral-200 font-medium leading-relaxed text-sm">
              An open corpus of Kenya&apos;s languages, documented by the people who speak them.
            </p>
            <p className="text-[11px] font-semibold uppercase tracking-[0.18em] text-neutral-300">
              Crafted by{' '}
              <a
                href="https://www.eddie-ezekiel.com"
                target="_blank"
                rel="noopener noreferrer"
                className="text-heritage-light hover:text-accent-500 transition-colors font-bold"
              >
                Eddie Ezekiel
              </a>
            </p>
            <p className="text-[11px] font-semibold uppercase tracking-[0.18em] text-neutral-300 hidden md:block">
              &copy; {new Date().getFullYear()} LughaKonnect. Built with pride in Kenya.
            </p>
            <p className="text-[11px] text-neutral-300 hidden md:block">
              Corpus data licensed{' '}
              <a
                href="https://creativecommons.org/licenses/by/4.0/"
                target="_blank"
                rel="license noopener noreferrer"
                className="text-heritage-light hover:text-accent-300 transition-colors font-bold"
              >
                CC BY 4.0
              </a>
            </p>
          </div>

          <div>
            <h4 className="text-heritage-light font-black text-sm uppercase tracking-[0.22em] mb-5 font-display">Explore</h4>
            <ul className="space-y-3 text-sm">
              <li>
                <Link href="/explore" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Explore
                </Link>
              </li>
              <li>
                <Link href="/translate" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Translate
                </Link>
              </li>
              <li>
                <Link href="/trending" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Trending
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h4 className="text-heritage-light font-black text-sm uppercase tracking-[0.22em] mb-5 font-display">Community</h4>
            <ul className="space-y-3 text-sm">
              <li>
                <Link href="/contribute" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Contribute
                </Link>
              </li>
              <li>
                <Link href="/guidelines" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Guidelines
                </Link>
              </li>
              <li>
                <Link href="/moderators" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Moderators
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h4 className="text-heritage-light font-black text-sm uppercase tracking-[0.22em] mb-5 font-display">Contact</h4>
            <ul className="space-y-3 text-sm">
              <li>
                <Link href="/about" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Our Mission
                </Link>
              </li>
              <li>
                <Link href="/team" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Team
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-neutral-200 font-semibold transition duration-200 ease-out transform hover:text-heritage-light hover:scale-105">
                  Contact
                </Link>
              </li>
            </ul>
          </div>
        </div>
        <div className="md:hidden pt-8 border-t border-heritage-darker/30 mt-8">
          <p className="text-[11px] font-semibold uppercase tracking-[0.18em] text-neutral-300">
            &copy; {new Date().getFullYear()} LughaKonnect. Built with pride in Kenya.
          </p>
        </div>
      </div>
    </footer>
  )
}
