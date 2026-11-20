import Link from 'next/link'
import type { LanguageStatus } from '@/lib/platform-status'
import { STAGE_RULES } from '@/lib/status-labels'
import StageTrack, { StageNode } from '@/components/status/StageTrack'
import MachineTag from '@/components/status/MachineTag'

// Where each language is on the way from words to translation to voice.
//   compact  the home page: one tile per language with its track
//   full     the Coverage page: the figures behind every stage

export function StageLegend() {
  const items = [
    {
      title: 'Words',
      body: `The dictionary. Done once a language covers half of the core meanings.`,
    },
    {
      title: 'Sentences',
      body: `Real sentences with a Kiswahili or English translation. Done at ${STAGE_RULES.sentencesDone.toLocaleString()} pairs, enough to train a translator.`,
    },
    {
      title: 'Translation',
      body: 'Machine translation of whole sentences. Done once it is trained on our own sentence pairs and tested.',
    },
    {
      title: 'Voice',
      body: `Recordings by speakers. Done at ${STAGE_RULES.voiceDone.toLocaleString()} recordings, enough to start on speech.`,
    },
  ]
  return (
    <div>
      <ol className="grid gap-px border border-ink-200 bg-ink-200 sm:grid-cols-2 lg:grid-cols-4">
        {items.map((item, index) => (
          <li key={item.title} className="bg-paper px-5 py-4">
            <p className="label text-signal-500">0{index + 1}</p>
            <p className="mt-1 font-semibold text-ink-900">{item.title}</p>
            <p className="mt-1.5 text-sm text-ink-700">{item.body}</p>
          </li>
        ))}
      </ol>
      <p className="mt-4 flex flex-wrap items-center gap-x-5 gap-y-2 text-sm text-ink-600">
        <span className="flex items-center gap-2"><StageNode state="done" /> Done</span>
        <span className="flex items-center gap-2"><StageNode state="started" /> Started</span>
        <span className="flex items-center gap-2"><StageNode state="none" /> Not started</span>
      </p>
    </div>
  )
}

export function LanguageTiles({ languages }: { languages: LanguageStatus[] }) {
  return (
    <ul className="reveal-rows grid gap-px border border-ink-200 bg-ink-200 sm:grid-cols-2 lg:grid-cols-3">
      {languages.map((language) => (
        <li key={language.id} className="bg-paper">
          <Link
            href={language.machine ? `/translate?from=${language.code}&to=sw` : `/explore?language=${language.id}`}
            className="block h-full px-5 py-4 transition-colors hover:bg-paper-warm"
          >
            <div className="flex items-start justify-between gap-3">
              <div className="min-w-0">
                <p className="truncate font-semibold text-ink-900">{language.name}</p>
                {language.nativeName && language.nativeName !== language.name && (
                  <p className="truncate text-sm text-ink-600">{language.nativeName}</p>
                )}
              </div>
              <MachineTag level={language.machine} />
            </div>
            <div className="mt-4">
              <StageTrack stages={language.stages} size="sm" showLabels />
            </div>
          </Link>
        </li>
      ))}
    </ul>
  )
}

export function LanguageTable({ languages }: { languages: LanguageStatus[] }) {
  const cell = 'py-3.5 pr-5 align-top'
  return (
    <div className="overflow-x-auto">
      <table className="w-full min-w-[48rem] border-collapse text-sm">
        <thead>
          <tr className="border-y border-ink-900">
            {['Language', 'Words', 'Sentence pairs', 'Translation', 'Voice'].map((h) => (
              <th key={h} className="label py-3 pr-5 text-left text-ink-600">{h}</th>
            ))}
          </tr>
        </thead>
        <tbody className="stagger">
          {languages.map((language, index) => (
            <tr
              key={language.id}
              style={{ '--i': index } as React.CSSProperties}
              className="border-b border-ink-200"
            >
              <td className={cell}>
                <Link
                  href={`/explore?language=${language.id}`}
                  className="font-semibold text-ink-900 hover:text-signal-600"
                >
                  {language.name}
                </Link>
                {language.nativeName && language.nativeName !== language.name && (
                  <p className="text-ink-600">{language.nativeName}</p>
                )}
              </td>
              <td className={cell}>
                <div className="flex items-start gap-2.5">
                  <span className="mt-0.5"><StageNode state={language.stages.words} /></span>
                  <div>
                    <p className="tabular font-mono text-ink-900">{language.entries.toLocaleString()}</p>
                    <p className="text-ink-600">{language.percentCovered}% of core meanings</p>
                  </div>
                </div>
              </td>
              <td className={cell}>
                <div className="flex items-start gap-2.5">
                  <span className="mt-0.5"><StageNode state={language.stages.sentences} /></span>
                  <p className={`tabular font-mono ${language.sentencePairs ? 'text-ink-900' : 'text-ink-500'}`}>
                    {language.sentencePairs === null
                      ? 'Not counted'
                      : language.sentencePairs === 0
                        ? 'None yet'
                        : language.sentencePairs.toLocaleString()}
                  </p>
                </div>
              </td>
              <td className={cell}>
                <div className="flex items-start gap-2.5">
                  <span className="mt-0.5"><StageNode state={language.stages.translation} /></span>
                  <MachineTag level={language.machine} />
                </div>
              </td>
              <td className={cell}>
                <div className="flex items-start gap-2.5">
                  <span className="mt-0.5"><StageNode state={language.stages.voice} /></span>
                  <p className={`tabular font-mono ${language.recordings ? 'text-ink-900' : 'text-signal-500'}`}>
                    {language.recordings === 0
                      ? 'None yet'
                      : `${language.recordings.toLocaleString()} from ${language.speakers}`}
                  </p>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
