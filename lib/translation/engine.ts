// The translation engine, lifted out of the route handler so a server
// component can run it directly. That is what makes a translation a real
// shareable URL rather than something that only exists after a fetch.

import { createClient } from '@supabase/supabase-js'
import { rankCandidates, type TranslationCandidate as RankedCandidate } from '@/lib/translation/pipeline'

export type TranslateRequest = {
  text?: string
  sourceLanguageId?: string
  targetLanguageId?: string
  limit?: number
}

export type { TranslationCandidate as Candidate } from '@/lib/translation/pipeline'
import type { TranslationCandidate as Candidate } from '@/lib/translation/pipeline'

type EntryRow = {
  id: string
  headword: string
  normalized_headword: string | null
  language_id: string
  part_of_speech: string | null
  english_translation: string | null
  swahili_translation: string | null
  validation_status: string
  concept_id: string | null
}

type LanguageCodeRow = { id: string; code: string }
type TranslationEdgeRow = {
  source_entry_id: string
  target_entry_id: string
  confidence: number | null
  reviewed_status: string | null
}
type TargetEntryRow = { id: string; headword: string }
type BridgeLexiconRow = {
  swahili_term: string | null
  english_term: string | null
}

function normalizeText(s: string) {
  return s
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/['’]/g, '')
    .replace(/[^a-zA-Z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .toLowerCase()
    .trim()
}

function clampLimit(n?: number) {
  if (!n || Number.isNaN(n)) return 10
  return Math.max(1, Math.min(25, n))
}

function pickNonEmpty(value: string | null | undefined) {
  const v = String(value || '').trim()
  return v.length > 0 ? v : null
}

function splitTerms(value: string) {
  return value
    .split(/[;,/|]/g)
    .map((s) => s.trim())
    .filter((s) => s.length > 0)
}

function addTerm(set: Set<string>, term: string | null | undefined) {
  const clean = pickNonEmpty(term)
  if (!clean) return
  for (const token of splitTerms(clean)) {
    const normalized = normalizeText(token)
    if (normalized) set.add(normalized)
  }
}

function escapeLike(value: string) {
  return value.replace(/[%_]/g, (char) => `\\${char}`)
}

function buildHeadwordMatchClause(rawText: string, normalized: string) {
  const trimmed = rawText.trim()
  const escaped = escapeLike(trimmed)
  return [
    `normalized_headword.eq.${normalized}`,
    `headword.ilike.${trimmed}`,
    `headword.ilike.%${escaped}%`
  ].join(',')
}

function getBridgeTerms(entry: EntryRow, via: 'english' | 'swahili') {
  const terms = new Set<string>()
  addTerm(terms, via === 'english' ? entry.english_translation : entry.swahili_translation)
  addTerm(terms, entry.headword)
  return Array.from(terms)
}

function hasBridgeToken(value: string | null | undefined, termSet: Set<string>) {
  const clean = pickNonEmpty(value)
  if (!clean) return false

  if (termSet.has(normalizeText(clean))) return true

  for (const token of splitTerms(clean)) {
    if (termSet.has(normalizeText(token))) return true
  }

  return false
}

async function findBridgeMatches(
  supabase: any,
  targetLanguageId: string,
  via: 'english' | 'swahili',
  terms: string[],
  limit: number
) {
  if (terms.length === 0) return []

  const column = via === 'english' ? 'english_translation' : 'swahili_translation'
  const normalizedTerms = new Set(terms.map((term) => normalizeText(term)).filter(Boolean))
  const queries = terms.map((term) => `${column}.ilike.%${escapeLike(term)}%`)
  let { data } = await supabase
    .from('entries')
    .select(`id, headword, ${column}`)
    .eq('language_id', targetLanguageId)
    .eq('validation_status', 'verified')
    .eq('needs_orthography_review', false)
    .or(queries.join(','))
    .limit(Math.max(limit * 4, 12))

  if (!data || data.length === 0) {
    const fallback = await supabase
      .from('entries')
      .select(`id, headword, ${column}`)
      .eq('language_id', targetLanguageId)
      .eq('needs_orthography_review', false)
      .neq('validation_status', 'seeded')
      .or(queries.join(','))
      .limit(Math.max(limit * 4, 12))
    data = fallback.data || []
  }

  const matches = (data || []).filter((row: Record<string, string | null>) =>
    hasBridgeToken(row[column], normalizedTerms)
  )
  return matches.slice(0, limit)
}

function getClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon) return null

  if (serviceRole) {
    return createClient(url, serviceRole, {
      auth: { autoRefreshToken: false, persistSession: false }
    })
  }
  return createClient(url, anon)
}

/**
 * A miss is the highest-quality contribution signal there is: someone naming
 * exactly which word, in which pair, is absent. It used to be discarded.
 */
async function recordGap(
  supabase: any,
  text: string,
  sourceLanguageId: string,
  targetLanguageId: string
) {
  try {
    await supabase.rpc('record_translation_gap', {
      p_query: text,
      p_source: sourceLanguageId,
      p_target: targetLanguageId
    })
  } catch {
    // Never let gap logging break a translation response.
  }
}

function isPhraseEntry(entry: EntryRow) {
  return String(entry.part_of_speech || '').toLowerCase() === 'phrase'
}

function phraseAdjustedConfidence(base: number, entry: EntryRow, preferPhrase: boolean) {
  if (preferPhrase && isPhraseEntry(entry)) return Math.min(0.99, base + 0.2)
  return base
}

export type TranslationOutcome =
  | { ok: true; result: Candidate[] }
  | { ok: false; error: string; status: number }

export async function runTranslation(params: TranslateRequest): Promise<TranslationOutcome> {
  try {
    const supabase = getClient()
    if (!supabase) {
      return { ok: false, error: 'Missing Supabase environment variables.', status: 500 }
    }

    const body = params
    const text = String(body.text || '').trim()
    const sourceLanguageId = String(body.sourceLanguageId || '').trim()
    const targetLanguageId = String(body.targetLanguageId || '').trim()
    const limit = clampLimit(body.limit)

    if (!text || !sourceLanguageId || !targetLanguageId) {
      return { ok: false, error: 'text, sourceLanguageId, and targetLanguageId are required.', status: 400 }
    }

    if (sourceLanguageId === targetLanguageId) {
      return {
        ok: true,
        result: [{
          translation: text,
          confidence: 1,
          path_type: 'direct_bridge',
          source_entry_id: ''
        } as Candidate]
      }
    }

    const normalized = normalizeText(text)
    const preferPhrase = normalized.includes(' ')

    const { data: languageRowsData } = await supabase
      .from('languages')
      .select('id, code')
      .in('code', ['en', 'sw'])
    const languageRows = (languageRowsData || []) as LanguageCodeRow[]

    const englishLanguageId = languageRows.find((l) => l.code === 'en')?.id
    const swahiliLanguageId = languageRows.find((l) => l.code === 'sw')?.id

    const { data: sourceVerified, error: sourceVerifiedErr } = await supabase
      .from('entries')
      .select('id, headword, normalized_headword, language_id, part_of_speech, english_translation, swahili_translation, validation_status, concept_id')
      .eq('language_id', sourceLanguageId)
      .eq('validation_status', 'verified')
      .eq('needs_orthography_review', false)
      .or(buildHeadwordMatchClause(text, normalized))
      .limit(8)
    if (sourceVerifiedErr) throw sourceVerifiedErr

    let sources = (sourceVerified || []) as EntryRow[]
    if (sources.length === 0) {
      const { data: sourceAny, error: sourceAnyErr } = await supabase
        .from('entries')
        .select('id, headword, normalized_headword, language_id, part_of_speech, english_translation, swahili_translation, validation_status, concept_id')
        .eq('language_id', sourceLanguageId)
        .eq('needs_orthography_review', false)
        .neq('validation_status', 'seeded')
        .or(buildHeadwordMatchClause(text, normalized))
        .limit(8)
      if (sourceAnyErr) throw sourceAnyErr
      sources = (sourceAny || []) as EntryRow[]
    }
    // KY-12. When translating FROM a bridge language, the answer often lives in
    // the TARGET row's gloss, not in a source entry. This used to run only
    // after a source entry had been found, so it never fired for the case it
    // was written for: "How are you?" -> Dholuo returned nothing even though
    // the Dholuo row carries that exact English gloss, because English has no
    // phrase entries at all. Running it on the raw query text first fixes that.
    const bridgeSourceCandidates: Candidate[] = []
    if (sourceLanguageId === englishLanguageId || sourceLanguageId === swahiliLanguageId) {
      const bridgeColumn =
        sourceLanguageId === englishLanguageId ? 'english_translation' : 'swahili_translation'
      const via = sourceLanguageId === englishLanguageId ? 'english' : 'swahili'
      const trimmed = text.trim()

      const { data: reverseRows } = await supabase
        .from('entries')
        .select('id, headword, part_of_speech')
        .eq('language_id', targetLanguageId)
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false)
        .or([
          `${bridgeColumn}.ilike.${escapeLike(trimmed)}`,
          `${bridgeColumn}.ilike.%${escapeLike(trimmed)}%`
        ].join(','))
        .limit(Math.max(limit * 2, 10))

      for (const row of (reverseRows || []) as Array<{ id: string; headword: string; part_of_speech: string | null }>) {
        const exact =
          normalizeText(String(row.headword)) === normalized ||
          (reverseRows || []).length === 1
        bridgeSourceCandidates.push({
          translation: row.headword,
          confidence: exact ? 0.92 : 0.88,
          path_type: 'direct_bridge',
          match_kind: String(row.part_of_speech || '').toLowerCase() === 'phrase' ? 'phrase' : 'word',
          source_entry_id: '',
          target_entry_id: row.id,
          via: via as 'english' | 'swahili'
        })
      }
    }

    if (sources.length === 0) {
      if (bridgeSourceCandidates.length > 0) {
        return {
          ok: true,
          result: rankCandidates(bridgeSourceCandidates as RankedCandidate[], limit)
        }
      }
      await recordGap(supabase, text, sourceLanguageId, targetLanguageId)
      return { ok: true, result: [] }
    }

    if (preferPhrase) {
      const phraseSources = sources.filter(isPhraseEntry)
      const wordSources = sources.filter((source) => !isPhraseEntry(source))
      sources = [...phraseSources, ...wordSources]
    }

    const candidates: Candidate[] = [...bridgeSourceCandidates]

    // Concept join. Two entries sharing a concept are translation equivalents
    // by construction, so this is exact where the string pivots below are
    // approximate. It runs first and outranks them.
    const conceptIds = Array.from(
      new Set(sources.map((s) => s.concept_id).filter((id): id is string => !!id))
    )

    if (conceptIds.length > 0) {
      const { data: conceptMatches } = await supabase
        .from('entries')
        .select('id, headword, part_of_speech, concept_id')
        .eq('language_id', targetLanguageId)
        .eq('validation_status', 'verified')
        .eq('needs_orthography_review', false)
        .in('concept_id', conceptIds)
        .limit(Math.max(limit * 2, 10))

      const sourceByConcept = new Map<string, EntryRow>()
      for (const source of sources) {
        if (source.concept_id && !sourceByConcept.has(source.concept_id)) {
          sourceByConcept.set(source.concept_id, source)
        }
      }

      for (const match of (conceptMatches || []) as Array<{
        id: string; headword: string; part_of_speech: string | null; concept_id: string
      }>) {
        const source = sourceByConcept.get(match.concept_id) ?? sources[0]
        candidates.push({
          translation: match.headword,
          confidence: phraseAdjustedConfidence(0.97, source, preferPhrase),
          path_type: 'concept',
          match_kind: String(match.part_of_speech || '').toLowerCase() === 'phrase' ? 'phrase' : 'word',
          source_entry_id: source.id,
          target_entry_id: match.id
        })
      }
    }

    const sourceIds = sources.map((s) => s.id)
    const { data: edgeRowsData } = await supabase
      .from('entry_translations')
      .select('source_entry_id, target_entry_id, confidence, reviewed_status')
      .in('source_entry_id', sourceIds)
      .eq('target_language_id', targetLanguageId)
      .order('confidence', { ascending: false })
      .limit(limit)
    const edgeRows = (edgeRowsData || []) as TranslationEdgeRow[]

    if (edgeRows && edgeRows.length > 0) {
      const targetIds = edgeRows.map((r) => r.target_entry_id)
      const { data: targetsData } = await supabase
        .from('entries')
        .select('id, headword')
        .in('id', targetIds)
      const targets = (targetsData || []) as TargetEntryRow[]

      const targetMap = new Map(targets.map((t) => [t.id, t.headword]))
      const sourceMap = new Map(sources.map((source) => [source.id, source]))

      for (const edge of edgeRows) {
        const headword = targetMap.get(edge.target_entry_id)
        const source = sourceMap.get(edge.source_entry_id)
        if (!headword) continue
        candidates.push({
          translation: headword,
          confidence: phraseAdjustedConfidence(Number(edge.confidence || 0.7), source || sources[0], preferPhrase),
          path_type: 'direct_edge',
          match_kind: source && isPhraseEntry(source) ? 'phrase' : 'word',
          source_entry_id: edge.source_entry_id,
          target_entry_id: edge.target_entry_id
        })
      }
    }

    const strong = candidates.filter((candidate) => candidate.confidence >= 0.85)
    const distinctStrong = new Set(strong.map((c) => c.translation.trim().toLowerCase())).size

    if (distinctStrong >= limit) {
      // Enough exact answers already. Anything the pivots could add scores at
      // most 0.6 and would be cut before it was shown.
      return { ok: true, result: rankCandidates(candidates as RankedCandidate[], limit) }
    }

    // Each source's pivot lookups are independent, so run them concurrently.
    // Previously this awaited one source at a time: with up to 20 sources and
    // four pivot paths each, a polysemous word fired 100+ serial round trips.
    const perSourceCandidates = await Promise.all(sources.map(async (s) => {
      const found: Candidate[] = []
      if (targetLanguageId === englishLanguageId && s.english_translation) {
        found.push({
          translation: s.english_translation,
          confidence: phraseAdjustedConfidence(0.95, s, preferPhrase),
          path_type: 'direct_bridge',
          match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
          source_entry_id: s.id,
          via: 'english'
        })
      }

      if (targetLanguageId === swahiliLanguageId && s.swahili_translation) {
        found.push({
          translation: s.swahili_translation,
          confidence: phraseAdjustedConfidence(0.95, s, preferPhrase),
          path_type: 'direct_bridge',
          match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
          source_entry_id: s.id,
          via: 'swahili'
        })
      }

      const swBridge = pickNonEmpty(s.swahili_translation)
      if (targetLanguageId !== swahiliLanguageId && swBridge) {
        const targetBySw = await findBridgeMatches(
          supabase,
          targetLanguageId,
          'swahili',
          getBridgeTerms(s, 'swahili'),
          5
        )

        for (const t of targetBySw || []) {
          found.push({
            translation: t.headword,
            confidence: phraseAdjustedConfidence(0.6, s, preferPhrase),
            path_type: 'pivot_sw',
            match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
            source_entry_id: s.id,
            target_entry_id: t.id,
            via: 'swahili'
          })
        }
      }

      const enBridge = pickNonEmpty(s.english_translation)
      if (targetLanguageId !== englishLanguageId && enBridge) {
        const targetByEn = await findBridgeMatches(
          supabase,
          targetLanguageId,
          'english',
          getBridgeTerms(s, 'english'),
          5
        )

        for (const t of targetByEn || []) {
          found.push({
            translation: t.headword,
            confidence: phraseAdjustedConfidence(0.55, s, preferPhrase),
            path_type: 'pivot_en',
            match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
            source_entry_id: s.id,
            target_entry_id: t.id,
            via: 'english'
          })
        }
      }

      // Mixed bridge path: SW -> EN -> target. Two extra round trips for a
      // 0.5-confidence guess, so only when the cupboard is close to bare.
      if (distinctStrong === 0 && targetLanguageId !== englishLanguageId && swBridge) {
        try {
          const { data: bridgeRows, error: bridgeErr } = await supabase
            .from('bridge_lexicon')
            .select('swahili_term, english_term')
            .ilike('swahili_term', swBridge)
            .limit(20)

          if (!bridgeErr) {
            const rows = (bridgeRows || []) as BridgeLexiconRow[]
            const englishTerms = new Set<string>()
            for (const row of rows) addTerm(englishTerms, row.english_term)

            for (const term of englishTerms) {
              const targetByBridgeEn = await findBridgeMatches(
                supabase,
                targetLanguageId,
                'english',
                [term],
                5
              )

              for (const t of targetByBridgeEn || []) {
                found.push({
                  translation: t.headword,
                  confidence: phraseAdjustedConfidence(0.5, s, preferPhrase),
                  path_type: 'pivot_sw_en',
                  match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
                  source_entry_id: s.id,
                  target_entry_id: t.id,
                  via: 'english'
                })
              }
            }
          }
        } catch {
          // bridge_lexicon may not exist yet; skip mixed pivot gracefully.
        }
      }

      // Mixed bridge path: EN -> SW -> target. Same trade as above.
      if (distinctStrong === 0 && targetLanguageId !== swahiliLanguageId && enBridge) {
        try {
          const { data: bridgeRows, error: bridgeErr } = await supabase
            .from('bridge_lexicon')
            .select('swahili_term, english_term')
            .ilike('english_term', enBridge)
            .limit(20)

          if (!bridgeErr) {
            const rows = (bridgeRows || []) as BridgeLexiconRow[]
            const swahiliTerms = new Set<string>()
            for (const row of rows) addTerm(swahiliTerms, row.swahili_term)

            for (const term of swahiliTerms) {
              const targetByBridgeSw = await findBridgeMatches(
                supabase,
                targetLanguageId,
                'swahili',
                [term],
                5
              )

              for (const t of targetByBridgeSw || []) {
                found.push({
                  translation: t.headword,
                  confidence: phraseAdjustedConfidence(0.5, s, preferPhrase),
                  path_type: 'pivot_en_sw',
                  match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
                  source_entry_id: s.id,
                  target_entry_id: t.id,
                  via: 'swahili'
                })
              }
            }
          }
        } catch {
          // bridge_lexicon may not exist yet; skip mixed pivot gracefully.
        }
      }
      return found
    }))

    for (const group of perSourceCandidates) candidates.push(...group)


    // Special case: reverse-lookup when source IS a bridge language (EN or SW)
    // E.g., English "Boy" → Dholuo should find Dholuo entries with english_translation="Boy"
    if (sourceLanguageId === englishLanguageId || sourceLanguageId === swahiliLanguageId) {
      const isBridgeSource = sourceLanguageId === englishLanguageId ? 'english' : 'swahili'
      const bridgeColumn = sourceLanguageId === englishLanguageId ? 'english_translation' : 'swahili_translation'

      for (const s of sources) {
        const sourceHeadword = s.headword
        const { data: reverseMatches } = await supabase
          .from('entries')
          .select('id, headword')
          .eq('language_id', targetLanguageId)
          .eq('validation_status', 'verified')
          .eq('needs_orthography_review', false)
          .ilike(bridgeColumn, `%${escapeLike(sourceHeadword)}%`)
          .limit(limit * 2)

        if (reverseMatches && reverseMatches.length > 0) {
          for (const match of reverseMatches as TargetEntryRow[]) {
            candidates.push({
              translation: match.headword,
              confidence: phraseAdjustedConfidence(0.9, s, preferPhrase),
              path_type: 'direct_bridge',
              match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
              source_entry_id: s.id,
              target_entry_id: match.id,
              via: isBridgeSource as 'english' | 'swahili'
            })
          }
        }
      }
    }

    const ranked = rankCandidates(candidates as RankedCandidate[], limit)
    if (ranked.length === 0) {
      await recordGap(supabase, text, sourceLanguageId, targetLanguageId)
    }

    return { ok: true, result: ranked }
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Translation failed.'
    return { ok: false, error: message, status: 500 }
  }
}
