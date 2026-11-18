// Reading and writing a whole entry, for the single entry form.
//
// Three ways in, one shape (lib/entry-draft.ts):
//   createEntryFromDraft  a contributor adds a word or phrase
//   submitCorrection      a contributor proposes changes to an existing entry
//   saveReview            a reviewer edits anything and approves
//
// The database enforces who may do what (sql/116, 118): a contributor's rows
// always arrive pending and attributed to them, whatever the browser sends.

import { supabase } from '@/lib/supabase'
import { runModerationAction } from '@/lib/api/moderation'
import {
  changedColumns,
  draftFromRows,
  entryColumns,
  filledExamples,
  filledSenses,
  validateDraft,
  type EntryDraft,
} from '@/lib/entry-draft'

export type EditableEntry = {
  id: string
  languageId: string
  languageName: string
  languageCode: string
  status: string
  createdBy: string | null
  humanReviewed: boolean
  reviewNote: string | null
  draft: EntryDraft
}

export type PendingSuggestion = {
  id: string
  suggestedBy: string | null
  reason: string | null
  createdAt: string
  /** The entry as the suggestion would leave it. */
  draft: EntryDraft
}

type Row = Record<string, unknown>

function friendlyError(error: { code?: string; message?: string } | null, fallback: string) {
  if (!error) return new Error(fallback)
  if (error.code === '23505' && /headword/i.test(error.message ?? '')) {
    return new Error('This language already has an entry spelled exactly like that.')
  }
  return new Error(error.message || fallback)
}

export async function loadEntryForEditing(id: string): Promise<EditableEntry | null> {
  const { data: entry, error } = await supabase
    .from('entries')
    .select('*, language:languages(id, name, code)')
    .eq('id', id)
    .maybeSingle()
  if (error) throw friendlyError(error, 'Could not load that entry.')
  if (!entry) return null

  const [senses, examples] = await Promise.all([
    supabase.from('entry_senses').select('*').eq('entry_id', id).neq('validation_status', 'disputed'),
    supabase
      .from('entry_usage_examples')
      .select('*')
      .eq('entry_id', id)
      .neq('validation_status', 'disputed')
      .order('created_at', { ascending: true }),
  ])

  const row = entry as Row
  const languageValue = row.language as Row | Row[] | null
  const language = (Array.isArray(languageValue) ? languageValue[0] : languageValue) ?? {}

  return {
    id,
    languageId: String(row.language_id),
    languageName: String(language.name ?? ''),
    languageCode: String(language.code ?? '').toLowerCase(),
    status: String(row.validation_status ?? ''),
    createdBy: (row.created_by as string | null) ?? null,
    humanReviewed: row.human_reviewed === true,
    reviewNote: (row.review_note as string | null) ?? null,
    draft: draftFromRows(row, (senses.data ?? []) as Row[], (examples.data ?? []) as Row[]),
  }
}

/** A pending correction, applied on top of the entry it belongs to. */
export async function loadSuggestion(id: string, base: EditableEntry): Promise<PendingSuggestion | null> {
  const { data, error } = await supabase.from('entry_suggestions').select('*').eq('id', id).maybeSingle()
  if (error) throw friendlyError(error, 'Could not load that suggestion.')
  if (!data) return null
  const row = data as Row

  const merged: Row = {}
  for (const [key, value] of Object.entries(entryColumns(base.draft))) merged[key] = value
  // Older suggestions carried only these two columns.
  if (row.headword) merged.headword = row.headword
  if (row.primary_definition) merged.primary_definition = row.primary_definition
  const patch = (row.patch && typeof row.patch === 'object' ? row.patch : {}) as Row
  for (const [key, value] of Object.entries(patch)) merged[key] = value

  const draft = draftFromRows(merged)
  draft.senses = base.draft.senses
  draft.examples = base.draft.examples

  return {
    id,
    suggestedBy: (row.suggested_by as string | null) ?? null,
    reason: (row.reason_for_change as string | null) ?? null,
    createdAt: String(row.created_at ?? ''),
    draft,
  }
}

async function insertSensesAndExamples(entryId: string, draft: EntryDraft, userId: string, status?: 'verified') {
  const senses = filledSenses(draft).filter((s) => !s.id)
  if (senses.length > 0) {
    const { error } = await supabase.from('entry_senses').insert(
      senses.map((sense) => ({
        entry_id: entryId,
        // Placeholder: the database assigns the real position (sql/119).
        position: 2,
        definition: sense.definition.trim() || null,
        english_translation: sense.english.trim() || null,
        swahili_translation: sense.swahili.trim() || null,
        part_of_speech: draft.isPhrase ? null : sense.partOfSpeech.trim().toLowerCase() || null,
        created_by: userId,
        ...(status ? { validation_status: status } : {}),
      }))
    )
    if (error) throw friendlyError(error, 'The entry was saved, but its further meanings were not.')
  }

  const examples = filledExamples(draft).filter((e) => !e.id)
  if (examples.length > 0) {
    const { error } = await supabase.from('entry_usage_examples').insert(
      examples.map((example) => ({
        entry_id: entryId,
        example_text: example.text.trim(),
        english_translation: example.english.trim() || null,
        swahili_translation: example.swahili.trim() || null,
        created_by: userId,
        ...(status ? { validation_status: status } : {}),
      }))
    )
    if (error) throw friendlyError(error, 'The entry was saved, but its examples were not.')
  }
}

/** A new word or phrase. Returns the new entry's id. */
export async function createEntryFromDraft(
  draft: EntryDraft,
  languageId: string,
  languageCode: string,
  userId: string,
  opts: { conceptId?: string; elicited?: boolean } = {}
) {
  validateDraft(draft, languageCode)

  // normalized_headword is generated by the database (sql/110), so it is not
  // sent. Sending it made every insert from the old form fail.
  const { data, error } = await supabase
    .from('entries')
    .insert({
      ...entryColumns(draft),
      language_id: languageId,
      created_by: userId,
      validation_status: 'pending',
      ...(opts.conceptId ? { concept_id: opts.conceptId } : {}),
      // The database keeps 'elicited' and turns anything else into 'community' (sql/120).
      ...(opts.elicited ? { source_type: 'elicited' } : {}),
    })
    .select('id')
    .single()
  if (error || !data) throw friendlyError(error, 'Could not save that entry.')

  const id = String((data as Row).id)
  await insertSensesAndExamples(id, draft, userId)
  return id
}

/**
 * A contributor's proposed changes. Changed entry fields become one
 * suggestion for a reviewer; new meanings and examples are added directly as
 * pending rows, which reviewers see on the same entry.
 */
export async function submitCorrection(entry: EditableEntry, draft: EntryDraft, reason: string, userId: string) {
  validateDraft(draft, entry.languageCode)

  const changes = changedColumns(entry.draft, draft)
  const newSenses = filledSenses(draft).filter((s) => !s.id)
  const newExamples = filledExamples(draft).filter((e) => !e.id)
  if (changes.length === 0 && newSenses.length === 0 && newExamples.length === 0) {
    throw new Error('Nothing has changed yet. Edit a field, or add a meaning or an example.')
  }

  if (changes.length > 0) {
    const patch = Object.fromEntries(changes.map((c) => [c.column, c.to]))
    const { error } = await supabase.from('entry_suggestions').insert({
      entry_id: entry.id,
      suggested_by: userId,
      headword: draft.headword.trim(),
      primary_definition: draft.definition.trim(),
      reason_for_change: reason.trim() || null,
      status: 'pending',
      patch,
    })
    if (error) throw friendlyError(error, 'Could not send your correction.')
  }

  await insertSensesAndExamples(entry.id, draft, userId)
  return { fieldsChanged: changes.length, sensesAdded: newSenses.length, examplesAdded: newExamples.length }
}

/**
 * A reviewer's decision. The entry's fields go through the moderation API (so
 * language rights and the self-review rule apply); meanings and examples are
 * written directly, which the database allows for moderators only.
 */
export async function saveReview(
  entry: EditableEntry,
  draft: EntryDraft,
  userId: string,
  opts: { suggestionId?: string } = {}
) {
  validateDraft(draft, entry.languageCode)
  const updates = entryColumns(draft)

  if (opts.suggestionId) {
    await runModerationAction({ action: 'apply_suggestion', itemId: opts.suggestionId, note: 'Reviewed in full', updates })
  } else {
    await runModerationAction({ action: 'approve_entry', itemId: entry.id, updates })
  }

  // Existing meanings and examples: save edits and approve; those removed in
  // the form are set aside as disputed rather than deleted.
  const keptSenseIds = new Set(draft.senses.map((s) => s.id).filter(Boolean))
  for (const sense of entry.draft.senses) {
    if (sense.id && !keptSenseIds.has(sense.id)) {
      await supabase.from('entry_senses').update({ validation_status: 'disputed' }).eq('id', sense.id)
    }
  }
  for (const sense of filledSenses(draft).filter((s) => s.id)) {
    const { error } = await supabase
      .from('entry_senses')
      .update({
        definition: sense.definition.trim() || null,
        english_translation: sense.english.trim() || null,
        swahili_translation: sense.swahili.trim() || null,
        part_of_speech: draft.isPhrase ? null : sense.partOfSpeech.trim().toLowerCase() || null,
        validation_status: 'verified',
        updated_at: new Date().toISOString(),
      })
      .eq('id', sense.id as string)
    if (error) throw friendlyError(error, 'Could not save a meaning.')
  }

  const keptExampleIds = new Set(draft.examples.map((e) => e.id).filter(Boolean))
  for (const example of entry.draft.examples) {
    if (example.id && !keptExampleIds.has(example.id)) {
      await supabase.from('entry_usage_examples').update({ validation_status: 'disputed' }).eq('id', example.id)
    }
  }
  for (const example of filledExamples(draft).filter((e) => e.id)) {
    const { error } = await supabase
      .from('entry_usage_examples')
      .update({
        example_text: example.text.trim(),
        english_translation: example.english.trim() || null,
        swahili_translation: example.swahili.trim() || null,
        validation_status: 'verified',
        reviewed_by: userId,
        reviewed_at: new Date().toISOString(),
      })
      .eq('id', example.id as string)
    if (error) throw friendlyError(error, 'Could not save an example.')
  }

  await insertSensesAndExamples(entry.id, draft, userId, 'verified')
}

/** Send an entry, or a suggestion, back with a reason the contributor sees. */
export async function rejectReview(entry: EditableEntry, reason: string, opts: { suggestionId?: string } = {}) {
  if (!reason.trim()) throw new Error('Give a reason. The contributor is shown it.')
  if (opts.suggestionId) {
    await runModerationAction({ action: 'review_suggestion', itemId: opts.suggestionId, suggestionAction: 'reject', note: reason })
  } else {
    await runModerationAction({ action: 'reject_entry', itemId: entry.id, note: reason })
  }
}

/** The languages a person listed on their profile, in their order. */
export async function getMyLanguageIds(userId: string): Promise<string[]> {
  const { data } = await supabase.from('user_profiles').select('languages').eq('id', userId).maybeSingle()
  const list = (data as { languages?: unknown } | null)?.languages
  return Array.isArray(list) ? list.map(String) : []
}

/** Add a language to the person's profile list, so Contribute offers it next time. */
export async function rememberLanguage(userId: string, languageId: string) {
  const current = await getMyLanguageIds(userId)
  if (current.includes(languageId)) return current
  const next = [...current, languageId]
  await supabase.from('user_profiles').update({ languages: next }).eq('id', userId)
  return next
}
