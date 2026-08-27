import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getPublicEntry, getEntryEquivalents, getEntryRecordings } from '@/lib/public-site'
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'
import { SITE_NAME, SITE_URL } from '@/lib/constants/site'
import EntryCommunity from './EntryCommunity'

// Entry pages were client-rendered, so the server returned only a spinner and
// every entry in the corpus was invisible to search engines and link previews.
// The lexical content is now server-rendered; only the community layer below it
// runs on the client.

export const revalidate = 3600

type Params = { params: Promise<{ id: string }> }

/** "Mother in Kikuyu" — the phrasing people actually search for. */
function describeEntry(entry: NonNullable<Awaited<ReturnType<typeof getPublicEntry>>>) {
  const language = entry.language?.name ?? 'a Kenyan language'
  const gloss =
    String(entry.english_translation ?? '').trim() ||
    String(entry.primary_definition ?? '').trim()
  return gloss ? `${gloss} in ${language}` : `A ${language} entry`
}

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { id } = await params
  const entry = await getPublicEntry(id)
  if (!entry) return { title: 'Entry not found' }

  const summary = describeEntry(entry)
  const title = `${entry.headword} — ${summary}`
  const description = [
    `${entry.headword} (${entry.language?.name ?? 'Kenyan language'})`,
    String(entry.primary_definition ?? '').trim(),
    entry.swahili_translation ? `Kiswahili: ${entry.swahili_translation}` : '',
  ]
    .filter(Boolean)
    .join(' · ')
    .slice(0, 300)

  const url = `${SITE_URL}/entry/${entry.id}`

  return {
    title,
    description,
    alternates: { canonical: url },
    openGraph: { type: 'article', url, title, description, siteName: SITE_NAME },
    twitter: { card: 'summary', title, description },
  }
}

export default async function EntryPage({ params }: Params) {
  const { id } = await params
  const entry = await getPublicEntry(id)
  if (!entry) notFound()

  const [equivalents, recordings] = await Promise.all([
    getEntryEquivalents(entry),
    getEntryRecordings(entry.id),
  ])

  // Structured data so search engines read this as a dictionary entry rather
  // than an unlabelled page of text.
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'DefinedTerm',
    name: entry.headword,
    description: entry.primary_definition ?? undefined,
    inDefinedTermSet: {
      '@type': 'DefinedTermSet',
      name: `${SITE_NAME} — ${entry.language?.name ?? 'Kenyan languages'}`,
      url: SITE_URL,
    },
    inLanguage: entry.language?.code ?? undefined,
    url: `${SITE_URL}/entry/${entry.id}`,
  }

  const meta = [
    entry.pronunciation_ipa && { label: 'Pronunciation (IPA)', value: entry.pronunciation_ipa },
    entry.dialect_variant && { label: 'Dialect variant', value: entry.dialect_variant },
    entry.etymology && { label: 'Etymology', value: entry.etymology, wide: true },
  ].filter(Boolean) as Array<{ label: string; value: string; wide?: boolean }>

  return (
    <div className="entry-root min-h-screen bg-neutral-50 pb-20 font-sans">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <main className="max-w-4xl mx-auto px-4 pt-10">
        <nav aria-label="Breadcrumb" className="mb-6">
          <ol className="flex flex-wrap items-center gap-2 text-[10px] font-black uppercase tracking-[0.25em] text-neutral-600">
            <li><Link href="/explore" className="hover:text-accent-700">Explore</Link></li>
            <li aria-hidden="true">/</li>
            <li>
              <Link
                href={`/explore?language=${entry.language?.id ?? ''}`}
                className="hover:text-accent-700"
              >
                {entry.language?.name ?? 'Language'}
              </Link>
            </li>
          </ol>
        </nav>

        <article className="bg-neutral-100 rounded-[3rem] border border-accent-300/30 p-8 md:p-14 shadow-soft">
          <header className="mb-10">
            <div className="flex flex-col md:flex-row md:items-end gap-3">
              <h1 className="text-4xl md:text-6xl font-black font-display text-heritage-dark tracking-tight break-words">
                {entry.headword}
              </h1>
              <p className="text-accent-700 font-display text-lg italic mb-1 md:mb-3">
                / {entry.part_of_speech || 'word'} /
              </p>
            </div>
            <p className="mt-3 text-sm font-black uppercase tracking-[0.25em] text-neutral-600">
              {entry.language?.name}
              {entry.language?.native_name ? ` · ${entry.language.native_name}` : ''}
            </p>
          </header>

          {recordings.length > 0 ? (
            <div className="mb-8 bg-accent-50 border border-accent-100 rounded-2xl p-5">
              <h2 className="text-[10px] font-black text-accent-700 uppercase tracking-[0.2em] mb-3">
                Heard from {recordings.length} {recordings.length === 1 ? 'speaker' : 'speakers'}
              </h2>
              <ul className="space-y-3">
                {recordings.map((recording) => (
                  <li key={recording.id}>
                    {/* eslint-disable-next-line jsx-a11y/media-has-caption */}
                    <audio controls preload="none" src={recording.url} className="w-full" />
                    <p className="mt-1 text-xs text-neutral-600">
                      {[
                        recording.speakerType === 'native' ? 'First-language speaker' : null,
                        recording.speakerType === 'heritage' ? 'Heritage speaker' : null,
                        recording.speakerType === 'learner' ? 'Learner' : null,
                        recording.homeCounty ? `learned in ${recording.homeCounty}` : null,
                      ]
                        .filter(Boolean)
                        .join(' · ')}
                    </p>
                  </li>
                ))}
              </ul>
            </div>
          ) : entry.audio_url ? (
            <div className="mb-8 bg-accent-50 border border-accent-100 rounded-2xl p-4">
              <h2 className="text-[10px] font-black text-accent-700 uppercase tracking-[0.2em] mb-2">
                Pronunciation
              </h2>
              {/* eslint-disable-next-line jsx-a11y/media-has-caption */}
              <audio controls preload="none" className="w-full" src={entry.audio_url}>
                Your browser does not support audio playback.
              </audio>
            </div>
          ) : null}

          <div className="mb-8">
            <RecordEntryAudio
              entryId={entry.id}
              headword={entry.headword}
              languageId={entry.language?.id ?? ''}
              languageCode={entry.language?.code ?? ''}
              languageName={entry.language?.name ?? 'this language'}
            />
          </div>

          <div className="space-y-10">
            <section>
              <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.3em] mb-4">
                Definition
              </h2>
              <p className="text-lg md:text-2xl font-medium text-neutral-800 leading-relaxed font-serif">
                {entry.primary_definition}
              </p>
            </section>

            {(entry.english_translation || entry.swahili_translation) && (
              <section className="grid md:grid-cols-2 gap-6">
                {entry.english_translation && (
                  <div className="bg-neutral-50 p-5 rounded-2xl border border-neutral-200">
                    <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.2em] mb-2">
                      English
                    </h2>
                    <p className="text-lg font-medium text-neutral-700">{entry.english_translation}</p>
                  </div>
                )}
                {entry.swahili_translation && (
                  <div className="bg-neutral-50 p-5 rounded-2xl border border-neutral-200">
                    <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.2em] mb-2">
                      Kiswahili
                    </h2>
                    <p className="text-lg font-medium text-neutral-700">{entry.swahili_translation}</p>
                  </div>
                )}
              </section>
            )}

            {meta.length > 0 && (
              <section className="grid md:grid-cols-2 gap-6">
                {meta.map((item) => (
                  <div
                    key={item.label}
                    className={`bg-neutral-50 p-5 rounded-2xl border border-neutral-200 ${item.wide ? 'md:col-span-2' : ''}`}
                  >
                    <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.2em] mb-2">
                      {item.label}
                    </h2>
                    <p className="text-neutral-700 font-medium leading-relaxed">{item.value}</p>
                  </div>
                ))}
              </section>
            )}

            {entry.usage_examples.length > 0 && (
              <section>
                <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.3em] mb-6">
                  In context
                </h2>
                <div className="space-y-6">
                  {entry.usage_examples.map((example, index) => (
                    <figure
                      key={index}
                      className="bg-neutral-50 p-4 md:p-8 rounded-[2rem] border-l-4 border-accent-300 break-words"
                    >
                      <blockquote className="italic text-neutral-700 text-lg">
                        {example.text}
                      </blockquote>
                      {(example.english || example.swahili) && (
                        <figcaption className="mt-3 text-sm text-neutral-600">
                          {example.english || example.swahili}
                        </figcaption>
                      )}
                    </figure>
                  ))}
                </div>
              </section>
            )}

            {equivalents.length > 0 && (
              <section>
                <h2 className="text-[10px] font-black text-neutral-600 uppercase tracking-[0.3em] mb-4">
                  The same meaning in other languages
                </h2>
                <ul className="flex flex-wrap gap-2">
                  {equivalents.map((item) => (
                    <li key={item.id}>
                      <Link
                        href={`/entry/${item.id}`}
                        className="inline-flex items-baseline gap-2 rounded-xl border border-neutral-200 bg-neutral-50 px-4 py-2 hover:border-accent-300 transition-colors"
                      >
                        <span className="font-bold text-neutral-900">{item.headword}</span>
                        <span className="text-[10px] font-black uppercase tracking-widest text-neutral-600">
                          {item.language?.name}
                        </span>
                      </Link>
                    </li>
                  ))}
                </ul>
              </section>
            )}
          </div>
        </article>
      </main>

      {/* Likes, comments, saving, reporting and editing — client only. */}
      <EntryCommunity entryId={entry.id} />
    </div>
  )
}
