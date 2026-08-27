import Link from 'next/link'

type Props = {
  sourceType: string | null
  sourceReference?: string | null
  affirmations?: number
  nativeSpeakerConfirmed?: boolean
  disputes?: number
  recordings?: number
  languageName?: string | null
  languageCode?: string | null
}

/**
 * Where this entry came from, and who has vouched for it.
 *
 * One line, and it does three jobs at once: it is the credibility signal a
 * researcher needs, the honesty signal a funder needs, and the invitation a
 * speaker needs. Saying "seeded from a published source, not yet checked by a
 * speaker" is far stronger than implying community review that has not
 * happened — it is checkable, and it asks for help in the same breath.
 */
export default function Provenance({
  sourceType,
  sourceReference,
  affirmations = 0,
  nativeSpeakerConfirmed = false,
  disputes = 0,
  recordings = 0,
  languageName,
  languageCode,
}: Props) {
  const seeded = sourceType === 'seed_pack' || sourceType === 'import'
  const disputed = disputes > 0

  const tone = disputed
    ? 'border-signal-200 bg-signal-50'
    : nativeSpeakerConfirmed
      ? 'border-petrol-200 bg-petrol-50'
      : 'border-ink-200 bg-paper-warm'

  const status = disputed
    ? `Disputed by ${disputes} reviewer${disputes === 1 ? '' : 's'}`
    : nativeSpeakerConfirmed
      ? `Confirmed by ${affirmations} reviewer${affirmations === 1 ? '' : 's'}, including a first-language speaker`
      : affirmations > 0
        ? `Reviewed by ${affirmations} contributor${affirmations === 1 ? '' : 's'} — no first-language speaker yet`
        : seeded
          ? 'Seeded from a published source. No speaker has checked it yet.'
          : 'Contributed by the community. Not yet independently confirmed.'

  const origin =
    sourceType === 'elicited'
      ? 'Given by a speaker in response to a prompt'
      : sourceType === 'community'
        ? 'Submitted by a contributor'
        : sourceType === 'expert_review'
          ? 'Added under expert review'
          : sourceType === 'published_source'
            ? 'From a published source'
            : seeded
              ? 'From the initial seed import'
              : null

  return (
    <aside className={`rounded-lg border px-4 py-3 ${tone}`}>
      <div className="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
        <p className="label">Provenance</p>
        {recordings > 0 && (
          <p className="label">
            {recordings} recording{recordings === 1 ? '' : 's'}
          </p>
        )}
      </div>

      <p className="mt-1.5 text-[0.9375rem] leading-relaxed text-ink-800">{status}</p>

      {(origin || sourceReference) && (
        <p className="mt-1 text-sm text-ink-600">
          {origin}
          {sourceReference ? ` · ${sourceReference}` : ''}
        </p>
      )}

      {!nativeSpeakerConfirmed && !disputed && (
        <p className="mt-2.5 text-sm text-ink-700">
          {languageName ? `Do you speak ${languageName}?` : 'Do you speak this language?'}{' '}
          <Link
            href={`/contribute/gaps${languageCode ? `?lang=${languageCode}` : ''}`}
            className="font-semibold text-signal-500 underline underline-offset-2 hover:text-signal-600"
          >
            Help check entries like this one
          </Link>
          .
        </p>
      )}
    </aside>
  )
}
