import type { MachineLevel } from '@/lib/translation/machine'

// Words and thresholds for the four stages (lib/platform-status.ts). Kept apart
// from the data loading so browser components can use them too.

export type StageState = 'done' | 'started' | 'none'

// Where a stage counts as done. Deliberately plain thresholds.
export const STAGE_RULES = {
  /** Half the core meanings. */
  wordsDone: 50,
  /** Enough pairs to train on properly. */
  sentencesDone: 10_000,
  /** Enough recordings to start a speech model. */
  voiceDone: 1_000,
}

export const MACHINE_LEVEL_TEXT: Record<MachineLevel | 'none', { label: string; body: string }> = {
  trained: {
    label: 'Trained',
    body: 'Trained on our sentence pairs and tested on sentences it never saw.',
  },
  early: {
    label: 'Early',
    body: 'New to the translator and still learning. Expect more mistakes.',
  },
  base: {
    label: 'Base Model',
    body: "Meta's translation model as it comes. Not yet trained on our own data.",
  },
  bridge: {
    label: 'Bridge',
    body: 'The translator already handles it well, and the other languages translate through it.',
  },
  none: {
    label: 'Not Yet',
    body: 'Needs sentence pairs before it can be trained.',
  },
}
