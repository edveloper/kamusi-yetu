import { unstable_cache } from 'next/cache'
import { supabase } from '@/lib/supabase'
import { getCorpusHeadline, getLanguageDirectory, type LanguageState } from '@/lib/public-site'
import { machineLevel, type MachineLevel } from '@/lib/translation/machine'
import { STAGE_RULES, type StageState } from '@/lib/status-labels'

export { MACHINE_LEVEL_TEXT, STAGE_RULES, type StageState } from '@/lib/status-labels'

// The one place the public pages get their figures from. The home page, About,
// Coverage and Standards all describe the same platform, so they read the same
// numbers here rather than counting in four different ways and drifting apart.
//
// A language moves through four stages, and every page shows them the same
// way (components/status/StageTrack.tsx):
//   words        the dictionary: how much of the 225 core meanings it covers
//   sentences    sentence pairs with a Kiswahili or English translation, which
//                is what machine translation learns from
//   translation  machine translation of whole sentences (lib/translation/machine.ts)
//   voice        recordings checked by a reviewer

export type LanguageStatus = LanguageState & {
  /** Null until sql/126 is applied; the pages then leave the figure out. */
  sentencePairs: number | null
  machine: MachineLevel | null
  stages: { words: StageState; sentences: StageState; translation: StageState; voice: StageState }
}

export type PlatformStatus = {
  languages: LanguageStatus[]
  totals: {
    languages: number
    /** Languages on the list that translate whole sentences (English is not on the list). */
    machineLanguages: number
    trainedLanguages: number
    words: number
    reviewedWords: number
    sentencePairs: number | null
    recordings: number
    languagesWithVoice: number
  }
}

const getSentenceCounts = unstable_cache(
  async (): Promise<Record<string, number> | null> => {
    const { data, error } = await supabase.rpc('language_sentence_counts')
    if (error || !Array.isArray(data)) return null
    return Object.fromEntries(
      (data as Array<{ language_id: string; sentence_pairs: number }>).map((row) => [
        String(row.language_id),
        Number(row.sentence_pairs ?? 0),
      ])
    )
  },
  ['public-language-sentence-counts'],
  { revalidate: 3600 }
)

const stageOf = (value: number, done: number): StageState =>
  value >= done ? 'done' : value > 0 ? 'started' : 'none'

export async function getPlatformStatus(): Promise<PlatformStatus> {
  const [directory, headline, sentenceCounts] = await Promise.all([
    getLanguageDirectory(),
    getCorpusHeadline(),
    getSentenceCounts(),
  ])

  const languages: LanguageStatus[] = directory.map((language) => {
    const sentencePairs = sentenceCounts ? sentenceCounts[language.id] ?? 0 : null
    const machine = machineLevel(language.code)
    return {
      ...language,
      sentencePairs,
      machine,
      stages: {
        words: stageOf(language.percentCovered, STAGE_RULES.wordsDone),
        sentences: stageOf(sentencePairs ?? 0, STAGE_RULES.sentencesDone),
        translation: machine === 'trained' || machine === 'bridge' ? 'done' : machine ? 'started' : 'none',
        voice: stageOf(language.recordings, STAGE_RULES.voiceDone),
      },
    }
  })

  // Furthest along first: translation, then sentence pairs, then words.
  const rank = { bridge: 4, trained: 3, early: 2, base: 1 } as const
  languages.sort(
    (a, b) =>
      (b.machine ? rank[b.machine] : 0) - (a.machine ? rank[a.machine] : 0) ||
      (b.sentencePairs ?? 0) - (a.sentencePairs ?? 0) ||
      b.entries - a.entries
  )

  return {
    languages,
    totals: {
      languages: languages.length,
      machineLanguages: languages.filter((l) => l.machine).length,
      trainedLanguages: languages.filter((l) => l.machine === 'trained').length,
      // The sum of the same rows the tables show, so the totals always add up.
      words: languages.reduce((sum, l) => sum + l.entries, 0),
      reviewedWords: headline?.reviewed_entries ?? 0,
      sentencePairs: sentenceCounts ? languages.reduce((sum, l) => sum + (l.sentencePairs ?? 0), 0) : null,
      recordings: languages.reduce((sum, l) => sum + l.recordings, 0),
      languagesWithVoice: languages.filter((l) => l.recordings > 0).length,
    },
  }
}

