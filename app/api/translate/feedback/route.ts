import { NextResponse } from 'next/server'
import { createClient, type SupabaseClient } from '@supabase/supabase-js'
import {
  methodFromPath,
  validateFeedbackInput,
  type FeedbackPath,
  type FeedbackVerdict
} from '@/lib/translation/feedback'

type FeedbackRequest = {
  sourceEntryId?: string
  targetEntryId?: string
  sourceLanguageId?: string
  targetLanguageId?: string
  pathType?: FeedbackPath
  confidence?: number
  verdict?: FeedbackVerdict
  note?: string
}

type EntryTranslationRow = { id: string }
type AuthClient = SupabaseClient

function getSupabaseEnv() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const serviceRole = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !anon || !serviceRole) return null
  return { url, anon, serviceRole }
}

export async function POST(req: Request) {
  try {
    const env = getSupabaseEnv()
    if (!env) {
      return NextResponse.json({ error: 'Missing Supabase environment variables.' }, { status: 500 })
    }

    const authHeader = req.headers.get('authorization')
    if (!authHeader?.startsWith('Bearer ')) {
      return NextResponse.json({ error: 'Missing bearer token.' }, { status: 401 })
    }
    const token = authHeader.replace('Bearer ', '').trim()
    if (!token) {
      return NextResponse.json({ error: 'Missing bearer token.' }, { status: 401 })
    }

    const userClient: AuthClient = createClient(env.url, env.anon)
    const { data: authData, error: authError } = await userClient.auth.getUser(token)
    if (authError || !authData?.user) {
      return NextResponse.json({ error: 'Unauthorized.' }, { status: 401 })
    }

    const body = (await req.json()) as FeedbackRequest
    const validated = validateFeedbackInput(body)
    if (!validated.ok) {
      return NextResponse.json({ error: validated.error }, { status: 400 })
    }
    const {
      sourceEntryId,
      targetEntryId,
      sourceLanguageId,
      targetLanguageId,
      pathType,
      verdict,
      note,
      confidence
    } = validated.value

    const admin = createClient(env.url, env.serviceRole, {
      auth: { autoRefreshToken: false, persistSession: false }
    })

    const { data: existingData, error: existingErr } = await admin
      .from('entry_translations')
      .select('id')
      .eq('source_entry_id', sourceEntryId)
      .eq('target_entry_id', targetEntryId)
      .maybeSingle()
    if (existingErr) throw existingErr

    let translationId = (existingData as EntryTranslationRow | null)?.id || ''
    if (!translationId) {
      const { data: createdData, error: createErr } = await admin
        .from('entry_translations')
        .insert({
          source_entry_id: sourceEntryId,
          target_entry_id: targetEntryId,
          source_language_id: sourceLanguageId,
          target_language_id: targetLanguageId,
          method: methodFromPath(pathType),
          confidence,
          reviewed_status: 'pending',
          created_by: authData.user.id
        })
        .select('id')
        .single()
      if (createErr) throw createErr
      translationId = (createdData as EntryTranslationRow).id
    }

    const { data: feedbackData, error: feedbackErr } = await admin
      .from('translation_feedback')
      .insert({
        translation_id: translationId,
        user_id: authData.user.id,
        verdict,
        note: note || null
      })
      .select('id')
      .single()
    if (feedbackErr) throw feedbackErr

    return NextResponse.json({
      ok: true,
      result: {
        translation_id: translationId,
        feedback_id: String((feedbackData as { id: string }).id)
      }
    })
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Feedback request failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
