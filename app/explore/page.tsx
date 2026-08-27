import type { Metadata } from 'next'
import Link from 'next/link'
import { CATEGORIES } from '@/lib/constants'
import { SITE_URL } from '@/lib/constants/site'
import {
  BROWSE_PAGE_SIZE,
  getBrowseResults,
  getLanguageDirectory,
  type BrowseParams,
} from '@/lib/public-site'
import SearchAutocomplete from '@/components/SearchAutocomplete'

// One browse surface, replacing four. /search, /languages and /categories were
// separate doors onto the same intent, none of them complete, and results were
// fetched in the browser so no filtered view was ever indexable. Everything
// here is a plain link and everything renders on the server.

export const revalidate = 300

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

type SearchParams = Promise<Record<string, string | string[] | undefined>>

const one = (value: string | string[] | undefined) =>
  (Array.isArray(value) ? value[0] : value) ?? ''

export async function generateMetadata({
  searchParams,
}: {
  searchParams: SearchParams
}): Promise<Metadata> {
  const params = await searchParams
  const q = one(params.q)
  const title = q ? `${q} in Kenyan languages` : 'Browse the corpus'
  return {
    title,
    description: q
      ? `Words matching ${q} across Kenya's languages, with definitions, translations and recordings.`
      : "Search and filter every verified word in the corpus by language, topic and letter.",
    alternates: { canonical: `${SITE_URL}/explore` },
  }
}

function href(base: BrowseParams, changes: Partial<BrowseParams>) {
  const merged = { ...base, ...changes }
  const search = new URLSearchParams()
  if (merged.q) search.set('q', merged.q)
  if (merged.language && merged.language !== 'all') search.set('language', merged.language)
  if (merged.category && merged.category !== 'all') search.set('category', merged.category)
  if (merged.letter && merged.letter !== 'all') search.set('letter', merged.letter)
  if (merged.kind && merged.kind !== 'all') search.set('kind', merged.kind)
  if (merged.page) search.set('page', String(merged.page))
  const qs = search.toString()
  return qs ? `/explore?${qs}` : '/explore'
}

export default async function BrowsePage({ searchParams }: { searchParams: SearchParams }) {
  const raw = await searchParams
  const kindRaw = one(raw.kind)
  const params: BrowseParams = {
    q: one(raw.q),
    language: one(raw.language),
    category: one(raw.category),
    letter: one(raw.letter),
    kind: kindRaw === 'word' || kindRaw === 'phrase' ? kindRaw : 'all',
    page: Number(one(raw.page)) || 0,
  }

  const [{ rows, total, page, hasMore }, languages] = await Promise.all([
    getBrowseResults(params),
    getLanguageDirectory(),
  ])

  const activeLanguage = languages.find((l) => l.id === params.language) ?? null
  const activeCategory = CATEGORIES.find((c) => c.id === params.category) ?? null
  const filtered = Boolean(
    params.q || params.language || params.category || params.letter || params.kind !== 'all'
  )

  const chip = (active: boolean) =>
    `border px-3 py-1.5 text-sm transition-colors ${
      active
        ? 'border-ink-900 bg-ink-900 font-semibold text-paper'
        : 'border-ink-200 text-ink-700 hover:border-ink-900'
    }`

  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-6xl px-4 py-10 sm:px-6 md:py-14">
          <p className="mark label mb-4 text-signal-300">Browse</p>
          <h1 className="display text-4xl sm:text-5xl">
            {params.q
              ? params.q
              : activeLanguage
                ? activeLanguage.name
                : 'Every word we have'}
          </h1>

          <form action="/explore" className="relative mt-8 max-w-2xl">
            {params.language && <input type="hidden" name="language" value={params.language} />}
            {params.category && <input type="hidden" name="category" value={params.category} />}
            <SearchAutocomplete
              name="q"
              formMode
              placeholder="A word in any language"
              inputClassName="w-full border border-ink-700 bg-ink-800 px-4 py-3.5 pr-24 text-paper outline-none placeholder:text-ink-400 focus:border-sand-300"
            />
            <button
              type="submit"
              className="btn-on-dark absolute right-1.5 top-1/2 -translate-y-1/2 px-4 py-2 text-sm"
            >
              Search
            </button>
          </form>
        </div>
      </header>

      <div className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
        <div className="grid gap-10 lg:grid-cols-[16rem_1fr] lg:gap-14">
          {/* --------------------------------------------------- filters */}
          <aside className="lg:sticky lg:top-24 lg:self-start">
            <div className="mb-8">
              <h2 className="mark label mb-3 text-ink-600">Kind</h2>
              <div className="flex flex-wrap gap-2">
                {(['all', 'word', 'phrase'] as const).map((kind) => (
                  <Link
                    key={kind}
                    href={href(params, { kind, page: 0 })}
                    className={chip(params.kind === kind)}
                  >
                    {kind === 'all' ? 'Everything' : kind === 'word' ? 'Words' : 'Phrases'}
                  </Link>
                ))}
              </div>
            </div>

            <div className="mb-8">
              <h2 className="mark label mb-3 text-ink-600">Language</h2>
              <ul className="max-h-72 overflow-y-auto border-t border-ink-200">
                {languages.map((language) => (
                  <li key={language.id} className="border-b border-ink-200">
                    <Link
                      href={href(params, {
                        language: params.language === language.id ? 'all' : language.id,
                        page: 0,
                      })}
                      className={`flex items-baseline justify-between gap-3 py-2 text-sm transition-colors hover:text-signal-600 ${
                        params.language === language.id
                          ? 'font-semibold text-signal-600'
                          : 'text-ink-700'
                      }`}
                    >
                      <span>{language.name}</span>
                      <span className="tabular font-mono text-xs text-ink-500">
                        {language.entries.toLocaleString()}
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            <div className="mb-8">
              <h2 className="mark label mb-3 text-ink-600">Topic</h2>
              <div className="flex flex-wrap gap-1.5">
                {CATEGORIES.map((category) => (
                  <Link
                    key={category.id}
                    href={href(params, {
                      category: params.category === category.id ? 'all' : category.id,
                      page: 0,
                    })}
                    className={chip(params.category === category.id)}
                  >
                    {category.name}
                  </Link>
                ))}
              </div>
            </div>

            <div>
              <h2 className="mark label mb-3 text-ink-600">Letter</h2>
              <div className="flex flex-wrap gap-1">
                {ALPHABET.map((letter) => (
                  <Link
                    key={letter}
                    href={href(params, {
                      letter: params.letter === letter ? 'all' : letter,
                      page: 0,
                    })}
                    className={`w-7 border py-1 text-center font-mono text-xs transition-colors ${
                      params.letter === letter
                        ? 'border-ink-900 bg-ink-900 text-paper'
                        : 'border-ink-200 text-ink-600 hover:border-ink-900'
                    }`}
                  >
                    {letter}
                  </Link>
                ))}
              </div>
            </div>
          </aside>

          {/* --------------------------------------------------- results */}
          <div>
            <div className="mb-6 flex flex-wrap items-baseline justify-between gap-4 border-b border-ink-900 pb-3">
              <p className="text-sm text-ink-700">
                <strong className="tabular font-mono text-ink-900">
                  {total.toLocaleString()}
                </strong>{' '}
                {total === 1 ? 'entry' : 'entries'}
                {activeLanguage ? ` in ${activeLanguage.name}` : ''}
                {activeCategory ? ` about ${activeCategory.name.toLowerCase()}` : ''}
              </p>
              {filtered && (
                <Link
                  href="/explore"
                  className="text-sm font-semibold text-signal-600 underline underline-offset-4"
                >
                  Clear filters
                </Link>
              )}
            </div>

            {rows.length === 0 ? (
              <div className="border-y-2 border-ink-900 py-14 text-center">
                <p className="display mb-3 text-2xl text-ink-900">Nothing here yet</p>
                <p className="mx-auto mb-7 max-w-sm text-ink-600">
                  {params.q
                    ? `No entry matches ${params.q}. If you know this word, you can be the first to record it.`
                    : 'No entry matches those filters.'}
                </p>
                <Link
                  href={`/contribute/gaps${activeLanguage ? `?lang=${activeLanguage.code}` : ''}`}
                  className="btn-primary"
                >
                  Add a word
                </Link>
              </div>
            ) : (
              <ul className="reveal-rows border-t border-ink-200">
                {rows.map((row) => (
                  <li key={row.id} className="border-b border-ink-200">
                    <Link
                      href={`/entry/${row.id}`}
                      className="group grid gap-x-6 gap-y-1 py-4 transition-colors hover:bg-paper-warm sm:grid-cols-[minmax(9rem,14rem)_1fr]"
                    >
                      <div>
                        <p className="flex items-center gap-2 text-lg font-semibold text-ink-900 group-hover:text-signal-600">
                          {row.headword}
                          {row.hasAudio && (
                            <span
                              aria-label="Has a recording"
                              title="Has a recording"
                              className="inline-flex items-end gap-[2px]"
                            >
                              {[6, 10, 7, 11, 5].map((h, i) => (
                                <span
                                  key={i}
                                  className="block w-[2px] bg-signal-500"
                                  style={{ height: `${h}px` }}
                                />
                              ))}
                            </span>
                          )}
                        </p>
                        <p className="label mt-0.5 text-ink-500">
                          {row.language?.name}
                          {row.part_of_speech ? ` · ${row.part_of_speech}` : ''}
                        </p>
                      </div>
                      <div>
                        <p className="text-ink-800">
                          {row.english_translation || row.primary_definition}
                        </p>
                        {row.swahili_translation && (
                          <p className="mt-0.5 text-sm text-ink-600">{row.swahili_translation}</p>
                        )}
                      </div>
                    </Link>
                  </li>
                ))}
              </ul>
            )}

            {(page > 0 || hasMore) && (
              <nav
                aria-label="Pagination"
                className="mt-8 flex items-center justify-between gap-4 border-t border-ink-200 pt-6"
              >
                {page > 0 ? (
                  <Link href={href(params, { page: page - 1 })} className="btn-secondary">
                    Previous
                  </Link>
                ) : (
                  <span />
                )}
                <p className="label text-ink-500">
                  {page * BROWSE_PAGE_SIZE + 1} to{' '}
                  {Math.min((page + 1) * BROWSE_PAGE_SIZE, total)} of {total.toLocaleString()}
                </p>
                {hasMore ? (
                  <Link href={href(params, { page: page + 1 })} className="btn-secondary">
                    Next
                  </Link>
                ) : (
                  <span />
                )}
              </nav>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
