const fs = require('fs');
const path = require('path');

// Read the CSV file
const csvPath = path.join(__dirname, '..', 'Kamusi_Yetu_Batch2.csv');
const csvContent = fs.readFileSync(csvPath, 'utf-8');
const lines = csvContent.split('\n');

// Parse header
const header = lines[0].split(',').map(h => h.replace(/^"|"$/g, ''));
const langIndex = header.findIndex(h => h === 'luo');
const languages = header.slice(langIndex);

// Parse rows
const sqlStatements = [];
sqlStatements.push('BEGIN TRANSACTION;');
sqlStatements.push('');

for (let i = 1; i < lines.length; i++) {
  if (!lines[i].trim()) continue;

  // Simple CSV parsing (handles quoted fields)
  const fields = [];
  let current = '';
  let inQuotes = false;

  for (let j = 0; j < lines[i].length; j++) {
    const char = lines[i][j];
    const nextChar = lines[i][j + 1];

    if (char === '"' && nextChar === '"') {
      current += '"';
      j++;
    } else if (char === '"') {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      fields.push(current);
      current = '';
    } else {
      current += char;
    }
  }
  fields.push(current);

  const row = {};
  for (let j = 0; j < header.length; j++) {
    row[header[j]] = fields[j] || '';
  }

  const english = row.english_gloss.replace(/'/g, "''");
  const swahili = row.swahili_gloss.replace(/'/g, "''");
  const partOfSpeech = row.part_of_speech.replace(/'/g, "''");
  const category = row.category.replace(/'/g, "''");

  // For each language column, generate INSERT
  for (const lang of languages) {
    let headword = (row[lang] || '').trim();

    // Skip if empty or placeholder
    if (!headword || headword === '?' || headword === '?' || headword === '') {
      continue;
    }

    headword = headword.replace(/'/g, "''");

    const sql = `INSERT INTO public.entries (language_id, headword, primary_definition, english_translation, swahili_translation, part_of_speech, category, validation_status, trust_score)
SELECT 
  l.id,
  '${headword}',
  '${english}',
  '${english}',
  '${swahili}',
  '${partOfSpeech}',
  '${category}',
  'pending',
  0.6
FROM public.languages l
WHERE l.code = '${lang}'
ON CONFLICT (language_id, headword) DO NOTHING;`;

    sqlStatements.push(sql);
  }
}

sqlStatements.push('');
sqlStatements.push('COMMIT;');

// Write output
const outputPath = path.join(__dirname, '..', 'sql', `seed-batch-insert-batch2-${new Date().toISOString().split('T')[0]}.sql`);
const sql = sqlStatements.join('\n');

fs.writeFileSync(outputPath, sql, 'utf-8');

console.log(`✅ Generated seed SQL: ${outputPath}`);
console.log(`📊 Total INSERT statements: ${sqlStatements.length - 4}`);
