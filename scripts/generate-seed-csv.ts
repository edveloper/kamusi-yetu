import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

/**
 * Language-specific seed mappings
 * These are the native language translations for each concept pack
 */
const languageMappings = {
  luo: {
    // Numbers
    'NUM_001_ONE': { headword: 'achiel', definition: 'The number one' },
    'NUM_002_TWO': { headword: 'ariyo', definition: 'The number two' },
    'NUM_003_THREE': { headword: 'adek', definition: 'The number three' },
    'NUM_004_FOUR': { headword: 'ang\'wan', definition: 'The number four' },
    'NUM_005_FIVE': { headword: 'abich', definition: 'The number five' },
    'NUM_006_SIX': { headword: 'auchiel', definition: 'The number six' },
    'NUM_007_SEVEN': { headword: 'abiriyo', definition: 'The number seven' },
    'NUM_008_EIGHT': { headword: 'aboro', definition: 'The number eight' },
    'NUM_009_NINE': { headword: 'ochiko', definition: 'The number nine' },
    'NUM_010_TEN': { headword: 'pogo', definition: 'The number ten' },
    
    // Greetings
    'GRT_001_HELLO': { headword: 'oyawore', definition: 'A greeting word' },
    'GRT_002_GOOD_MORNING': { headword: 'oyawore buondi', definition: 'Good morning greeting' },
    'GRT_003_HOW_ARE_YOU': { headword: 'oyawore mano?', definition: 'How are you?' },
    'GRT_004_I_AM_FINE': { headword: 'oyawore maber', definition: 'I am fine' },
    'GRT_005_THANK_YOU': { headword: 'asante', definition: 'Thank you expression' },
    'GRT_006_SORRY': { headword: 'pole', definition: 'Sorry or condolence' },
    'GRT_007_WELCOME': { headword: 'karibu', definition: 'Welcome greeting' },
    'GRT_008_GOODBYE': { headword: 'kwaheri', definition: 'Goodbye' },
    
    // Kinship
    'KIN_001_FATHER': { headword: 'wuon', definition: 'Male parent' },
    'KIN_002_MOTHER': { headword: 'dhako', definition: 'Female parent' },
    'KIN_003_BROTHER': { headword: 'owadde', definition: 'Male sibling' },
    'KIN_004_SISTER': { headword: 'nyathie', definition: 'Female sibling' },
    'KIN_005_SON': { headword: 'wuowi', definition: 'Male child' },
    'KIN_006_DAUGHTER': { headword: 'nyathi', definition: 'Female child' },
    'KIN_007_CHILD': { headword: 'nyathi', definition: 'Young person' },
    'KIN_012_FRIEND': { headword: 'rafiki', definition: 'Close companion' },
    
    // Health
    'HLT_001_HEAD': { headword: 'wi', definition: 'Upper body part' },
    'HLT_002_EYE': { headword: 'iso', definition: 'Organ of sight' },
    'HLT_003_NOSE': { headword: 'pua', definition: 'Organ of smell' },
    'HLT_005_HAND': { headword: 'tama', definition: 'Upper limb extremity' },
    'HLT_006_LEG': { headword: 'seche', definition: 'Lower limb extremity' },
    'HLT_010_SICK': { headword: 'chuny', definition: 'In poor health' },
  },
  
  kikuyu: {
    // Numbers
    'NUM_001_ONE': { headword: 'imwe', definition: 'The number one' },
    'NUM_002_TWO': { headword: 'igiri', definition: 'The number two' },
    'NUM_003_THREE': { headword: 'itatu', definition: 'The number three' },
    'NUM_004_FOUR': { headword: 'ina', definition: 'The number four' },
    'NUM_005_FIVE': { headword: 'itano', definition: 'The number five' },
    
    // Greetings
    'GRT_001_HELLO': { headword: 'wĩ mwega', definition: 'A greeting word' },
    'GRT_005_THANK_YOU': { headword: 'ngoro', definition: 'Thank you expression' },
    
    // Kinship
    'KIN_001_FATHER': { headword: 'baba', definition: 'Male parent' },
    'KIN_002_MOTHER': { headword: 'nyina', definition: 'Female parent' },
    'KIN_003_BROTHER': { headword: 'mũrũ', definition: 'Male sibling' },
    'KIN_004_SISTER': { headword: 'mbirira', definition: 'Female sibling' },
    
    // Health
    'HLT_001_HEAD': { headword: 'mũtwe', definition: 'Upper body part' },
    'HLT_002_EYE': { headword: 'rũũri', definition: 'Organ of sight' },
  },
}

interface SeedConcept {
  concept_id: string
  semantic_pack: string
  domain: string
  english_gloss: string
  swahili_gloss: string
  part_of_speech: string
  category: string
  phrase_type: string | null
  tags: string[]
  notes: string
}

interface CSVRow {
  batch_label: string
  source_row_no: number
  language_code: string
  headword: string
  primary_definition: string
  english_translation: string
  swahili_translation: string
  part_of_speech: string
  dialect_variant: string
  register: string
  pronunciation_ipa: string
  etymology: string
  audio_url: string
  category: string
  created_by: string
  source_name: string
  source_license: string
  source_url: string
  source_note: string
}

function loadSeedPacks(): Record<string, SeedConcept[]> {
  const packsDir = path.join(__dirname, '..', 'seed-packs')
  const packs: Record<string, SeedConcept[]> = {}

  const files = fs.readdirSync(packsDir).filter(f => f.endsWith('.json'))
  for (const file of files) {
    const packName = file.replace('.json', '')
    const content = fs.readFileSync(path.join(packsDir, file), 'utf-8')
    packs[packName] = JSON.parse(content)
  }

  return packs
}

function generateCSVRows(
  batchLabel: string,
  languageCode: string,
  languageMapping: Record<string, { headword: string; definition: string }>,
  packs: Record<string, SeedConcept[]>
): CSVRow[] {
  const rows: CSVRow[] = []
  let rowNo = 1

  // Iterate through all packs
  for (const packName of Object.keys(packs).sort()) {
    const concepts = packs[packName]

    for (const concept of concepts) {
      const mapping = languageMapping[concept.concept_id]

      // Skip if no mapping exists for this language
      if (!mapping) continue

      const row: CSVRow = {
        batch_label: batchLabel,
        source_row_no: rowNo,
        language_code: languageCode,
        headword: mapping.headword,
        primary_definition: mapping.definition,
        english_translation: concept.english_gloss,
        swahili_translation: concept.swahili_gloss,
        part_of_speech: concept.part_of_speech,
        dialect_variant: '',
        register: 'both',
        pronunciation_ipa: '',
        etymology: '',
        audio_url: '',
        category: concept.category,
        created_by: '',
        source_name: 'Kamusi Yetu seed generator',
        source_license: 'internal',
        source_url: '',
        source_note: `Generated from ${packName} seed pack. Concept ID: ${concept.concept_id}`,
      }

      rows.push(row)
      rowNo++
    }
  }

  return rows
}

function rowsToCSV(rows: CSVRow[]): string {
  if (rows.length === 0) return ''

  const headers = Object.keys(rows[0])
  const headerLine = headers.map(h => `"${h}"`).join(',')

  const dataLines = rows.map(row => {
    return headers
      .map(h => {
        const value = (row as unknown as Record<string, unknown>)[h] ?? ''
        const str = String(value)
        // Escape quotes and wrap in quotes
        return `"${str.replace(/"/g, '""')}"`
      })
      .join(',')
  })

  return [headerLine, ...dataLines].join('\n')
}

function main() {
  const batchLabel = `BATCH_SEED_${new Date().toISOString().split('T')[0].replace(/-/g, '_')}`
  const outputDir = path.join(__dirname, '..', 'output')

  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true })
  }

  const packs = loadSeedPacks()
  console.log(`\n✅ Loaded ${Object.keys(packs).length} seed packs:`)
  Object.keys(packs).forEach(packName => {
    console.log(
      `   - ${packName}: ${packs[packName].length} concepts`
    )
  })

  // Generate CSVs for each language
  console.log(`\n🔄 Generating CSVs for ${Object.keys(languageMappings).length} languages...`)

  for (const languageCode of Object.keys(languageMappings).sort()) {
    const mapping =
      languageMappings[languageCode as keyof typeof languageMappings]
    const rows = generateCSVRows(batchLabel, languageCode, mapping, packs)

    if (rows.length > 0) {
      const csv = rowsToCSV(rows)
      const filename = path.join(outputDir, `${batchLabel}_${languageCode}.csv`)
      fs.writeFileSync(filename, csv, 'utf-8')
      console.log(
        `   ✓ ${filename}: ${rows.length} rows`
      )
    } else {
      console.log(`   ⚠ ${languageCode}: No mappings found (skipped)`)
    }
  }

  console.log(`\n✨ Complete! Batch label: ${batchLabel}`)
  console.log(`📁 CSV files saved to: ${outputDir}`)
  console.log(
    `\n📖 Next step: Import CSVs to public.entry_import_staging using Supabase Table Editor`
  )
}

main()
