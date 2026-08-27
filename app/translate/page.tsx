import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'
import { getTranslatableLanguages, getEntryRecordings } from '@/lib/public-site'
import { runTranslation } from '@/lib/translation/engine'
import type { TranslationPath } from '@/lib/translation/pipeline'
import TranslateControls from '@/components/translate/TranslateControls'
import Waveform from '@/components/ui/Waveform'

// A translation is now a location, not a transient client state. /translate?
// from=luo&to=en&q=Aheri can be linked, sent to someone and read by a crawler,
// which also makes every successful lookup a page that can be found.

export const revalidate = 300

type SearchParams = Promise<Record<string, string | string[] | undefined>>
const one = (v: string | string[] | undefined) => (Array.isArray(v) ? v[0] : v) ?? ''

const PATH_LABEL: Record<TranslationPath, string> = {
  concept: 'Same recorded meaning',
  direct_edge: 'Direct pair',
  direct_bridge: 'Through its own translation',
  pivot_sw: 'Via Kiswahili',
  pivot_en: 'Via English',
  pivot_sw_en: 'Via Kiswahili then English',
  pivot_en_sw: 'Via English then Kiswahili',
}

const PATH_NOTE: Record<TranslationPath, string> = {
  concept: 'Both languages record a word for the same meaning. The strongest kind of match.',
  direct_edge: 'Someone has explicitly linked these two entries.',
  direct_bridge: "Taken from the entry's own English or Kiswahili translation.",
  pivot_sw: 'Matched through a shared Kiswahili translation, so treat it as a good guess.',
  pivot_en: 'Matched through a shared English translation, so treat it as a good guess.',
  pivot_sw_en: 'Routed through two languages. Worth checking with a speaker.',
  pivot_en_sw: 'Routed through two languages. Worth checking with a speaker.',
}

export async function generateMetadata({
  searchParams,
}: {
  searchParams: SearchParams
}): Promise<Metadata> {
  const params = await searchParams
  const q = one(params.q)
  const from = one(params.from)
  const to = one(params.to)

  if (!q) {
    return {
      title: 'Translate',
      description: 'Move a word or phrase between any two Kenyan languages.',
      alternates: { canonical: `${SITE_URL}/translate` },
    }
  }

  const languages = await getTranslatableLanguages()
  const fromName = languages.find((l) => l.code === from)?.name ?? from
  const toName = languages.find((l) => l.code === to)?.name ?? to

  return {
    title: `${q} in ${toName}`,
    description: `How to say ${q} from ${fromName} in ${toName}.`,
    alternates: { canonical: `${SITE_URL}/translate?from=${from}&to=${to}&q=${encodeURIComponent(q)}` },
  }
}

export default async function TranslatePage({ searchParams }: { searchParams: SearchParams }) {
  const params = await searchParams
  const languages = await getTranslatableLanguages()

  const fallbackFrom = languages.find((l) => l.code === 'sw')?.code ?? languages[0]?.code ?? ''
  const fallbackTo = languages.find((l) => l.code === 'en')?.code ?? languages[1]?.code ?? ''

  const from = one(params.from) || fallbackFrom
  const to = one(params.to) || fallbackTo
  const q = one(params.q)

  const fromLang = languages.find((l) => l.code === from) ?? null
  const toLang = languages.find((l) => l.code === to) ?? null

  let outcome: Awaited<ReturnType<typeof runTranslation>> | null = null
  if (q && fromLang && toLang) {
    outcome = await runTranslation({
      text: q,
      sourceLanguageId: fromLang.id,
      targetLanguageId: toLang.id,
      limit: 8,
    })
  }

  const results = outcome?.ok ? outcome.result : []
  const best = results[0] ?? null
  const alternates = results.slice(1)

  // If the answer has a recording, you should be able to hear it. This is the
  // whole point of collecting audio and it costs one query.
  const recordings = best?.target_entry_id ? await getEntryRecordings(best.target_entry_id) : []

  return (
    <div className="min-h-screen bg-paper">
      {/* ---------------------------------------------------------- controls */}
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-4xl px-4 py-10 sm:px-6 md:py-14">
          <p className="mark label mb-5 text-signal-300">Translate</p>
          {!q && (
            <h1 className="display mb-8 max-w-2xl text-4xl sm:text-5xl">
              Between any two Kenyan languages, not just to English
            </h1>
          )}
          <TranslateControls languages={languages} from={from} to={to} q={q} />
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 py-10 sm:px-6">
        {/* ------------------------------------------------------ the answer */}
        {q && best && (
          <section aria-label="Translation">
            <p className="label mb-3 text-ink-500">
              {fromLang?.name} to {toLang?.name}
            </p>
            <p className="headword break-words text-5xl text-ink-900 sm:text-6xl md:text-7xl">
              {best.translation}
            </p>

            <div className="mt-5 flex flex-wrap items-center gap-x-3 gap-y-2">
              <span className="border border-ink-900 bg-ink-900 px-2.5 py-1 text-[0.6875rem] font-semibold uppercase tracking-[0.12em] text-paper">
                {PATH_LABEL[best.path_type]}
              </span>
              {(best.via_paths ?? []).slice(1).map((path) => (
                <span
                  key={path}
                  className="border border-ink-300 px-2.5 py-1 text-[0.6875rem] font-semibold uppercase tracking-[0.12em] text-ink-600"
                >
                  also {PATH_LABEL[path].toLowerCase()}
                </span>
              ))}
              {best.match_kind === 'phrase' && (
                <span className="label text-ink-500">phrase</span>
              )}
            </div>

            <p className="mt-3 max-w-xl text-[0.9375rem] text-ink-600">
              {PATH_NOTE[best.path_type]}
            </p>

            {recordings.length > 0 && (
              <div className="mt-8 border-t border-ink-200 pt-6">
                <h2 className="mark label mb-3 text-ink-600">Hear it</h2>
                <Waveform
                  src={recordings[0].url}
                  caption={
                    recordings[0].speakerType === 'native'
                      ? 'First-language speaker'
                      : recordings[0].speakerType ?? undefined
                  }
                />
              </div>
            )}

            {best.target_entry_id && (
              <p className="mt-6">
                <Link
                  href={`/entry/${best.target_entry_id}`}
                  className="font-semibold text-signal-600 underline underline-offset-4"
                >
                  Open the full entry
                </Link>
              </p>
            )}
          </section>
        )}

        {/* -------------------------------------------------------- alternates */}
        {alternates.length > 0 && (
          <section className="mt-12 border-t border-ink-200 pt-8">
            <h2 className="mark label mb-4 text-ink-600">Other candidates</h2>
            <ul className="border-t border-ink-200">
              {alternates.map((candidate, index) => (
                <li key={`${candidate.translation}-${index}`} className="border-b border-ink-200">
                  <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 py-3.5">
                    <span className="text-xl font-semibold text-ink-900">
                      {candidate.translation}
                    </span>
                    <span className="label text-ink-500">
                      {PATH_LABEL[candidate.path_type]}
                    </span>
                  </div>
                </li>
              ))}
            </ul>
            <p className="mt-4 max-w-xl text-sm text-ink-600">
              More than one word can be right. If you speak {toLang?.name} and one of these is
              wrong, say so on its entry page.
            </p>
          </section>
        )}

        {/* ------------------------------------------------------------- miss */}
        {q && results.length === 0 && (
          <section className="border-y-2 border-ink-900 py-12">
            <p className="label mb-3 text-signal-500">Not recorded yet</p>
            <p className="display max-w-2xl text-3xl text-ink-900 sm:text-4xl">
              No {toLang?.name} word for {q} yet
            </p>
            <p className="mt-5 max-w-xl text-ink-700">
              That is a real gap, not an error. We have written it down, and if you know the
              word you would be the first to record it.
            </p>
            <div className="mt-7 flex flex-wrap gap-3">
              <Link
                href={`/contribute/gaps?lang=${encodeURIComponent(to)}`}
                className="btn-primary"
              >
                Add it in {toLang?.name}
              </Link>
              <Link href={`/explore?q=${encodeURIComponent(q)}`} className="btn-secondary">
                Search every language
              </Link>
            </div>
          </section>
        )}

        {outcome && !outcome.ok && (
          <p role="alert" className="border border-signal-200 bg-signal-50 px-4 py-3 text-sm font-semibold text-signal-700">
            {outcome.error}
          </p>
        )}

        {/* -------------------------------------------------------- empty state */}
        {!q && (
          <section>
            <h2 className="mark display mb-3 text-2xl">Try one of these</h2>
            <p className="mb-6 max-w-xl text-ink-700">
              Most translation tools only go to and from English. This one moves between
              Kenyan languages directly, using a shared meaning where both languages have
              recorded one.
            </p>
            <ul className="reveal-rows border-t border-ink-200">
              {[
                { q: 'Aheri', from: 'luo', to: 'sw', gloss: 'I love you, Dholuo to Kiswahili' },
                { q: 'maji', from: 'sw', to: 'ki', gloss: 'water, Kiswahili to Kikuyu' },
                { q: 'Nade?', from: 'luo', to: 'en', gloss: 'a greeting, Dholuo to English' },
                { q: 'mother', from: 'en', to: 'luo', gloss: 'English to Dholuo' },
              ].map((example) => (
                <li key={`${example.q}-${example.to}`} className="border-b border-ink-200">
                  <Link
                    href={`/translate?from=${example.from}&to=${example.to}&q=${encodeURIComponent(example.q)}`}
                    className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 py-3.5 transition-colors hover:text-signal-600"
                  >
                    <span className="text-lg font-semibold text-ink-900">{example.q}</span>
                    <span className="label text-ink-500">{example.gloss}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        )}

        <p className="mt-14 max-w-xl text-sm text-ink-600">
          Translation quality depends entirely on how much each language has recorded.{' '}
          <Link
            href="/trending"
            className="font-semibold text-signal-600 underline underline-offset-2"
          >
            See where the gaps are
          </Link>
          .
        </p>
      </main>
    </div>
  )
}
