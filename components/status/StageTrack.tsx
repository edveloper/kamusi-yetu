import type { StageState } from '@/lib/status-labels'

// The four stages every language moves through, drawn the same way on every
// page: words, sentence pairs, machine translation, voice. A filled square is
// done, a half-filled one is started, an empty one has not begun.

export const STAGES = [
  { key: 'words', label: 'Words' },
  { key: 'sentences', label: 'Sentences' },
  { key: 'translation', label: 'Translation' },
  { key: 'voice', label: 'Voice' },
] as const

export type StageKey = (typeof STAGES)[number]['key']

const STATE_TEXT: Record<StageState, string> = { done: 'done', started: 'started', none: 'not started' }

export function StageNode({ state, tone = 'light', size = 'md' }: { state: StageState; tone?: 'light' | 'dark'; size?: 'sm' | 'md' }) {
  const box = size === 'sm' ? 'h-3 w-3' : 'h-3.5 w-3.5'
  const fill = tone === 'dark' ? 'bg-sand-300' : 'bg-petrol-500'
  const edge = tone === 'dark' ? 'border-sand-300' : 'border-petrol-500'
  const empty = tone === 'dark' ? 'border-ink-600 bg-ink-900' : 'border-ink-300 bg-paper'
  return (
    <span
      aria-hidden="true"
      className={`relative inline-block shrink-0 overflow-hidden border ${box} ${state === 'none' ? empty : `${edge} ${tone === 'dark' ? 'bg-ink-900' : 'bg-paper'}`}`}
    >
      {state !== 'none' && (
        <span className={`absolute inset-y-0 left-0 ${fill} ${state === 'done' ? 'w-full' : 'w-1/2'}`} />
      )}
    </span>
  )
}

/**
 * Four equal columns, a square centred in each, and one line behind them. A
 * stretch of line is coloured once the stage before it is done.
 */
export default function StageTrack({
  stages,
  tone = 'light',
  size = 'md',
  showLabels = false,
}: {
  stages: Record<StageKey, StageState>
  tone?: 'light' | 'dark'
  size?: 'sm' | 'md'
  showLabels?: boolean
}) {
  const line = tone === 'dark' ? 'bg-ink-700' : 'bg-ink-200'
  const done = tone === 'dark' ? 'bg-sand-300' : 'bg-petrol-500'
  const top = size === 'sm' ? 'top-[0.375rem]' : 'top-[0.4375rem]'
  return (
    <div className="relative">
      {STAGES.slice(0, -1).map((stage, index) => (
        <span
          key={stage.key}
          aria-hidden="true"
          className={`absolute h-px ${top} ${stages[stage.key] === 'done' ? done : line}`}
          style={{ left: `${12.5 + 25 * index}%`, width: '25%' }}
        />
      ))}
      <ol className="relative grid grid-cols-4" aria-label="Progress">
        {STAGES.map((stage) => (
          <li key={stage.key} className="flex flex-col items-center gap-1.5">
            <StageNode state={stages[stage.key]} tone={tone} size={size} />
            {showLabels && (
              <span className={`label text-[0.5625rem] tracking-wide ${tone === 'dark' ? 'text-ink-400' : 'text-ink-500'}`}>
                {stage.label}
              </span>
            )}
            <span className="sr-only">
              {stage.label}, {STATE_TEXT[stages[stage.key]]}.
            </span>
          </li>
        ))}
      </ol>
    </div>
  )
}
