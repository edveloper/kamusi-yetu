import Link from 'next/link'
import type { LanguageState } from '@/lib/public-site'

/**
 * A moving list of every language in the corpus.
 *
 * This earns its motion because it is showing something true. The breadth is
 * the argument, and a static grid of 36 names reads as a list while this reads
 * as a roll call. Names with no recording yet are marked, so the row is also a
 * status report rather than decoration.
 *
 * Two rows travelling in opposite directions at different speeds, because a
 * single band scrolling one way looks like a stock ticker.
 */
export default function LanguageMarquee({ languages }: { languages: LanguageState[] }) {
  if (languages.length === 0) return null

  const half = Math.ceil(languages.length / 2)
  const rows = [languages.slice(0, half), languages.slice(half)]

  return (
    <div
      className="marquee-host overflow-hidden border-y border-ink-800 bg-ink-900 py-5"
      aria-label={`${languages.length} languages in the corpus`}
    >
      {rows.map((row, index) => (
        <div
          key={index}
          className={`marquee ${index === 1 ? 'marquee-slow marquee-reverse mt-3' : ''}`}
          // The duplicate half is presentational; screen readers read the first.
          aria-hidden={index === 1 ? true : undefined}
        >
          {[0, 1].map((copy) => (
            <div key={copy} className="flex shrink-0 items-center" aria-hidden={copy === 1}>
              {row.map((language) => (
                <Link
                  key={`${copy}-${language.id}`}
                  href={`/explore?language=${language.id}`}
                  className="group flex shrink-0 items-center gap-3 px-5"
                >
                  <span className="display text-2xl text-paper transition-colors group-hover:text-signal-300 md:text-3xl">
                    {language.name}
                  </span>
                  {/* A recorded language gets a small waveform, an unrecorded one
                    * gets nothing. The absence carries the point without a label
                    * repeating "no voice" thirty times across the row. */}
                  {language.recordings > 0 && (
                    <span
                      aria-label={`${language.recordings} recordings`}
                      className="flex shrink-0 items-end gap-[2px]"
                    >
                      {[5, 9, 6, 11, 7].map((h, i) => (
                        <span
                          key={i}
                          className="block w-[2px] bg-signal-300"
                          style={{ height: `${h}px` }}
                        />
                      ))}
                    </span>
                  )}
                </Link>
              ))}
            </div>
          ))}
        </div>
      ))}
    </div>
  )
}
