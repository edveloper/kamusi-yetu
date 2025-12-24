export const mockLanguages = [
  { id: '1', code: 'en', name: 'English', native_name: 'English' },
  { id: '2', code: 'sw', name: 'Swahili', native_name: 'Kiswahili' },
  { id: '3', code: 'ki', name: 'Kikuyu', native_name: 'Gĩkũyũ' },
  { id: '4', code: 'luo', name: 'Dholuo', native_name: 'Dholuo' },
  { id: '5', code: 'kam', name: 'Kamba', native_name: 'Kĩkamba' },
  { id: '6', code: 'luy', name: 'Luhya', native_name: 'Luhya' },
  { id: '7', code: 'kal', name: 'Kalenjin', native_name: 'Kalenjin' },
]

export const mockEntries = [
  {
    id: '1',
    language_id: '2',
    headword: 'mtoto',
    part_of_speech: 'noun',
    primary_definition: 'A child; a young person typically under 18 years of age',
    validation_status: 'verified',
    trust_score: 95,
    translations: [
      { language: 'English', word: 'child' },
      { language: 'Kikuyu', word: 'kaana, mwana' },
      { language: 'Dholuo', word: 'nyathi' },
    ],
    contexts: [
      {
        type: 'formal',
        text: 'Used in official contexts: schools, hospitals, government',
        example: 'Kila mtoto ana haki ya elimu',
        upvotes: 156,
      },
      {
        type: 'informal',
        text: 'Parents call adult children "mtoto wangu" - term of endearment',
        example: 'Mtoto wangu amerudi kutoka chuo!',
        upvotes: 89,
      },
    ],
  },
  {
    id: '2',
    language_id: '2',
    headword: 'chakula',
    part_of_speech: 'noun',
    primary_definition: 'Food; any nutritious substance eaten to sustain life',
    validation_status: 'verified',
    trust_score: 98,
    translations: [
      { language: 'English', word: 'food' },
      { language: 'Kikuyu', word: 'irio' },
      { language: 'Dholuo', word: 'chiemo' },
    ],
    contexts: [
      {
        type: 'general',
        text: 'Universal term for food in Swahili',
        example: 'Chakula tayari!',
        upvotes: 234,
      },
    ],
  },
  {
    id: '3',
    language_id: '2',
    headword: 'harambee',
    part_of_speech: 'noun',
    primary_definition: 'All pull together; collective community effort',
    validation_status: 'verified',
    trust_score: 97,
    translations: [
      { language: 'English', word: 'community fundraising' },
    ],
    contexts: [
      {
        type: 'cultural',
        text: "Kenya's national motto since independence",
        example: 'Tufanye harambee kujenga shule',
        upvotes: 178,
      },
    ],
  },
]

export const mockTrendingWords = [
  {
    word: 'ruto',
    language: 'Sheng',
    type: 'verb',
    definition: 'To promise something and not deliver',
    searches: 342,
  },
  {
    word: 'chakula',
    language: 'Swahili',
    type: 'noun',
    definition: 'Food - see translations in all 7 languages',
    searches: 156,
  },
  {
    word: 'harambee',
    language: 'Swahili',
    type: 'noun',
    definition: "All pull together - Kenya's motto",
    searches: 134,
  },
]