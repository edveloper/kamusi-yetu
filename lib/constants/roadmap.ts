// Where LughaKonnect is going, in the order it is being done. Shown on the
// home page and About (components/status/Roadmap.tsx). No figures here: the
// numbers live in lib/platform-status.ts so they cannot go stale in two places.
//
// Direction since November 2026: machine translation first, because whole
// sentences in your own language are what bring speakers in, and every
// correction they make is training data. Words and voice grow alongside.

export type RoadmapPhase = { key: 'done' | 'now' | 'next' | 'later'; title: string; items: string[] }

export const ROADMAP: RoadmapPhase[] = [
  {
    key: 'done',
    title: 'Done',
    items: [
      'Sentence translation for Dholuo and Kikuyu, trained on our own sentence pairs and tested on sentences it never saw.',
      'Early translation for Taita, Kalenjin, Logooli and Olumarachi.',
      'Speakers can mark a machine translation right or wrong and give their own. Accepted corrections become new sentence pairs.',
    ],
  },
  {
    key: 'now',
    title: 'Now',
    items: [
      'Recruiting speakers to check translations and review words, one language at a time.',
      'Gathering more sentence pairs. Requests are in with the groups holding Kalenjin, Somali, Maasai, Kamba, Ekegusii and Luhya collections.',
      'Training the next version of the translator on everything speakers have corrected.',
    ],
  },
  {
    key: 'next',
    title: 'Next',
    items: [
      'Translation trained on our own data for Somali and Kamba, then Maasai, Ekegusii and Bukusu.',
      'Field sessions in Taita Taveta County, starting with Taita and Taveta speakers.',
      'The first recordings, each with the speaker\'s consent kept word for word.',
    ],
  },
  {
    key: 'later',
    title: 'Later',
    items: [
      'Speech. Recognising spoken Kenyan languages and reading text aloud, built from the recordings.',
      'Open downloads of the words, sentence pairs and recordings for anyone building tools.',
      'Translation straight between two Kenyan languages, without going through Kiswahili.',
    ],
  },
]
