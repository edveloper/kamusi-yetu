import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getPublicEntry, getEntryEquivalents, getEntryRecordings } from '@/lib/public-site'
import { SITE_NAME, SITE_URL } from '@/lib/constants/site'
import Waveform from '@/components/ui/Waveform'
import Provenance from '@/components/ui/Provenance'
import RecordEntryAudio from '@/components/recording/RecordEntryAudio'
import EntryCommunity from './EntryCommunity'

// This is the front door. Most visitors arrive here from a search for one word,
// never having seen the homepage — so the page has to answer in two seconds and
// then earn a second action, rather than ending the visit.

export const revalidate = 3600

type Params = { params: Promise<{ id: string }> }
type Entry = NonNullable<Awaited<ReturnType<typeof getPublicEntry>>>

/** "Mother in Kikuyu" — the phrasing people actually type into a search box. */
function describeEntry(entry: Entry) {
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

  const title = `${entry.headword}. ${describeEntry(entry)}`
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

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'DefinedTerm',
    name: entry.headword,
    description: entry.primary_definition ?? undefined,
    inDefinedTermSet: {
      '@type': 'DefinedTermSet',
      name: `${SITE_NAME}, ${entry.language?.name ?? 'Kenyan languages'}`,
      url: SITE_URL,
    },
    inLanguage: entry.language?.code ?? undefined,
    url: `${SITE_URL}/entry/${entry.id}`,
  }

  const speakerCaption = (r: (typeof recordings)[number]) =>
    [
      r.speakerType === 'native' ? 'First-language speaker' : null,
      r.speakerType === 'heritage' ? 'Heritage speaker' : null,
      r.speakerType === 'learner' ? 'Learner' : null,
      r.homeCounty ? `learned in ${r.homeCounty}` : null,
    ]
      .filter(Boolean)
      .join(' · ')

  const detail = [
    entry.pronunciation_ipa && { label: 'Pronunciation', value: entry.pronunciation_ipa, mono: true },
    entry.dialect_variant && { label: 'Dialect', value: entry.dialect_variant },
    entry.part_of_speech && { label: 'Part of speech', value: entry.part_of_speech },
    entry.category && { label: 'Domain', value: entry.category },
  ].filter(Boolean) as Array<{ label: string; value: string; mono?: boolean }>

  return (
    <div className="entry-root min-h-screen bg-paper">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      {/* ---- The answer, on the ink ground, above everything else ---- */}
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-4xl px-4 pb-10 pt-8 sm:px-6">
          <nav aria-label="Breadcrumb" className="mb-8">
            <ol className="flex flex-wrap items-center gap-2 text-[0.6875rem] font-semibold uppercase tracking-[0.12em] text-ink-300">
              <li>
                <Link href="/explore" className="transition-colors hover:text-sand-300">
                  Browse
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li>
                <Link
                  href={`/explore?language=${entry.language?.id ?? ''}`}
                  className="transition-colors hover:text-sand-300"
                >
                  {entry.language?.name ?? 'Language'}
                </Link>
              </li>
            </ol>
          </nav>

          <h1 className="headword break-words text-5xl sm:text-6xl md:text-7xl">
            {entry.headword}
          </h1>

          <p className="label mt-4 text-sand-300">
            {entry.language?.name}
            {entry.language?.native_name ? ` · ${entry.language.native_name}` : ''}
            {entry.part_of_speech ? ` · ${entry.part_of_speech}` : ''}
          </p>

          <p className="definition mt-6 max-w-2xl text-paper">{entry.primary_definition}</p>

          {(entry.english_translation || entry.swahili_translation) && (
            <dl className="mt-7 flex flex-wrap gap-x-10 gap-y-3 border-t border-ink-800 pt-5">
              {entry.english_translation && (
                <div>
                  <dt className="label text-ink-400">English</dt>
                  <dd className="mt-0.5 text-lg text-paper">{entry.english_translation}</dd>
                </div>
              )}
              {entry.swahili_translation && (
                <div>
                  <dt className="label text-ink-400">Kiswahili</dt>
                  <dd className="mt-0.5 text-lg text-paper">{entry.swahili_translation}</dd>
                </div>
              )}
            </dl>
          )}
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
        {/* ---- Voice: the signature element, directly under the answer ---- */}
        <section aria-labelledby="voice-heading" className="mb-10">
          <h2 id="voice-heading" className="label mb-3">
            {recordings.length > 0
              ? `Heard from ${recordings.length} ${recordings.length === 1 ? 'speaker' : 'speakers'}`
              : 'Pronunciation'}
          </h2>

          {recordings.length > 0 ? (
            <ul className="space-y-5">
              {recordings.map((recording) => (
                <li key={recording.id}>
                  <Waveform src={recording.url} caption={speakerCaption(recording)} />
                </li>
              ))}
            </ul>
          ) : (
            <Waveform
              src={entry.audio_url}
              emptyLabel={`No one has recorded ${entry.headword} yet`}
            />
          )}
        </section>

        {/* ---- Provenance: credibility, honesty and invitation in one line ---- */}
        <div className="mb-10">
          <Provenance
            sourceType={entry.source_type}
            sourceReference={entry.source_reference}
            affirmations={entry.attestations.affirmations}
            disputes={entry.attestations.disputes}
            nativeSpeakerConfirmed={entry.attestations.nativeSpeakerConfirmed}
            recordings={recordings.length}
            languageName={entry.language?.name}
            languageCode={entry.language?.code}
          />
        </div>

        {detail.length > 0 && (
          <section className="mb-10 border-t border-ink-200 pt-6">
            <dl className="grid gap-x-10 gap-y-5 sm:grid-cols-2">
              {detail.map((item) => (
                <div key={item.label}>
                  <dt className="label">{item.label}</dt>
                  <dd className={`mt-1 text-ink-800 ${item.mono ? 'font-mono text-[0.95rem]' : ''}`}>
                    {item.value}
                  </dd>
                </div>
              ))}
            </dl>
          </section>
        )}

        {entry.usage_examples.length > 0 && (
          <section className="mb-10 border-t border-ink-200 pt-6">
            <h2 className="label mb-4">In context</h2>
            <ul className="space-y-5">
              {entry.usage_examples.map((example, index) => (
                <li key={index} className="border-l-2 border-signal-500 pl-5">
                  <p className="definition italic">{example.text}</p>
                  {(example.english || example.swahili) && (
                    <p className="mt-1.5 text-sm text-ink-600">
                      {example.english || example.swahili}
                    </p>
                  )}
                </li>
              ))}
            </ul>
          </section>
        )}

        {entry.etymology && (
          <section className="mb-10 border-t border-ink-200 pt-6">
            <h2 className="label mb-3">Etymology</h2>
            <p className="text-ink-800 leading-relaxed">{entry.etymology}</p>
          </section>
        )}

        {/* ---- The second action: same meaning, other languages ---- */}
        {equivalents.length > 0 && (
          <section className="mb-10 border-t border-ink-200 pt-6">
            <h2 className="label mb-4">The same meaning elsewhere</h2>
            <ul className="flex flex-wrap gap-2">
              {equivalents.map((item) => (
                <li key={item.id}>
                  <Link
                    href={`/entry/${item.id}`}
                    className="inline-flex items-baseline gap-2 rounded-md border border-ink-200 bg-card px-3.5 py-2 transition-colors hover:border-ink-900"
                  >
                    <span className="font-semibold text-ink-900">{item.headword}</span>
                    <span className="label">{item.language?.name}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        )}

        {/* ---- The third action: add your voice ---- */}
        <section className="mb-10 border-t border-ink-200 pt-6">
          <RecordEntryAudio
            entryId={entry.id}
            headword={entry.headword}
            languageId={entry.language?.id ?? ''}
            languageCode={entry.language?.code ?? ''}
            languageName={entry.language?.name ?? 'this language'}
          />
        </section>
      </main>

      <EntryCommunity entryId={entry.id} />
    </div>
  )
}
