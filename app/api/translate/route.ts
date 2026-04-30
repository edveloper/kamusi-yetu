import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'
import { rankCandidates, type TranslationCandidate as RankedCandidate } from '@/lib/translation/pipeline'

type TranslateRequest = {
  text?: string
  sourceLanguageId?: string
  targetLanguageId?: string
  limit?: number
}

type Candidate = {
  translation: string
  confidence: number
  path_type: 'direct_bridge' | 'direct_edge' | 'pivot_sw' | 'pivot_en' | 'pivot_sw_en' | 'pivot_en_sw'
  match_kind?: 'word' | 'phrase'
  source_entry_id: string
  target_entry_id?: string
  via?: 'swahili' | 'english'
}

type EntryRow = {
  id: string
  headword: string
  normalized_headword: string | null
  language_id: string
  part_of_speech: string | null
  english_translation: string | null
  swahili_translation: string | null
  validation_status: string
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
    .or(queries.join(','))
    .limit(Math.max(limit * 4, 12))

  if (!data || data.length === 0) {
    const fallback = await supabase
      .from('entries')
      .select(`id, headword, ${column}`)
      .eq('language_id', targetLanguageId)
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

function isPhraseEntry(entry: EntryRow) {
  return String(entry.part_of_speech || '').toLowerCase() === 'phrase'
}

function phraseAdjustedConfidence(base: number, entry: EntryRow, preferPhrase: boolean) {
  if (preferPhrase && isPhraseEntry(entry)) return Math.min(0.99, base + 0.2)
  return base
}

export async function POST(req: Request) {
  try {
    const supabase = getClient()
    if (!supabase) {
      return NextResponse.json({ error: 'Missing Supabase environment variables.' }, { status: 500 })
    }

    const body = (await req.json()) as TranslateRequest
    const text = String(body.text || '').trim()
    const sourceLanguageId = String(body.sourceLanguageId || '').trim()
    const targetLanguageId = String(body.targetLanguageId || '').trim()
    const limit = clampLimit(body.limit)

    if (!text || !sourceLanguageId || !targetLanguageId) {
      return NextResponse.json({ error: 'text, sourceLanguageId, and targetLanguageId are required.' }, { status: 400 })
    }

    if (sourceLanguageId === targetLanguageId) {
      return NextResponse.json({
        ok: true,
        result: [{
          translation: text,
          confidence: 1,
          path_type: 'direct_bridge',
          source_entry_id: ''
        } as Candidate]
      })
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
      .select('id, headword, normalized_headword, language_id, part_of_speech, english_translation, swahili_translation, validation_status')
      .eq('language_id', sourceLanguageId)
      .eq('validation_status', 'verified')
      .or(buildHeadwordMatchClause(text, normalized))
      .limit(20)
    if (sourceVerifiedErr) throw sourceVerifiedErr

    let sources = (sourceVerified || []) as EntryRow[]
    if (sources.length === 0) {
      const { data: sourceAny, error: sourceAnyErr } = await supabase
        .from('entries')
        .select('id, headword, normalized_headword, language_id, part_of_speech, english_translation, swahili_translation, validation_status')
        .eq('language_id', sourceLanguageId)
        .or(buildHeadwordMatchClause(text, normalized))
        .limit(20)
      if (sourceAnyErr) throw sourceAnyErr
      sources = (sourceAny || []) as EntryRow[]
    }
    if (sources.length === 0) {
      return NextResponse.json({ ok: true, result: [] })
    }

    if (preferPhrase) {
      const phraseSources = sources.filter(isPhraseEntry)
      const wordSources = sources.filter((source) => !isPhraseEntry(source))
      sources = [...phraseSources, ...wordSources]
    }

    const candidates: Candidate[] = []

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

    for (const s of sources) {
      if (targetLanguageId === englishLanguageId && s.english_translation) {
        candidates.push({
          translation: s.english_translation,
          confidence: phraseAdjustedConfidence(0.95, s, preferPhrase),
          path_type: 'direct_bridge',
          match_kind: isPhraseEntry(s) ? 'phrase' : 'word',
          source_entry_id: s.id,
          via: 'english'
        })
      }

      if (targetLanguageId === swahiliLanguageId && s.swahili_translation) {
        candidates.push({
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
          candidates.push({
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
          candidates.push({
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

      // Mixed bridge path: SW -> EN -> target
      if (targetLanguageId !== englishLanguageId && swBridge) {
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
                candidates.push({
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

      // Mixed bridge path: EN -> SW -> target
      if (targetLanguageId !== swahiliLanguageId && enBridge) {
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
                candidates.push({
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
    }

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

    return NextResponse.json({ ok: true, result: rankCandidates(candidates as RankedCandidate[], limit) })
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Translation failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
