import CountUp from '@/components/ui/CountUp'
import type { PlatformStatus } from '@/lib/platform-status'

// The four headline figures. Home, About and Coverage all show these same four,
// from the same place (lib/platform-status.ts), so they always agree.
export default function StatStrip({ totals }: { totals: PlatformStatus['totals'] }) {
  const stats = [
    {
      value: totals.machineLanguages,
      label: `of ${totals.languages} languages translate whole sentences`,
    },
    totals.sentencePairs !== null
      ? { value: totals.sentencePairs, label: 'Sentence pairs the translator learns from' }
      : { value: totals.trainedLanguages, label: 'Languages trained on our own sentence pairs' },
    {
      value: totals.words,
      label: `Dictionary words, ${totals.reviewedWords.toLocaleString()} checked by a reviewer`,
    },
    {
      value: totals.recordings,
      label: totals.recordings === 0 ? 'Recordings so far. Voice comes next' : `Recordings, in ${totals.languagesWithVoice} languages`,
    },
  ]

  return (
    <dl className="reveal-rows grid grid-cols-2 gap-x-8 gap-y-8 md:grid-cols-4">
      {stats.map((stat) => (
        <div key={stat.label}>
          <dd className="headword tabular text-5xl text-ink-900 md:text-6xl">
            <CountUp value={stat.value} />
          </dd>
          <dt className="mt-2 text-sm font-semibold text-ink-700">{stat.label}</dt>
        </div>
      ))}
    </dl>
  )
}
