import { createHash } from 'node:crypto'
import { NextResponse } from 'next/server'
import { getClient } from '@/lib/translation/engine'
import {
  MACHINE_MAX_CHARS,
  MACHINE_MODEL,
  callTranslateSpace,
  cleanMachineInput,
  machinePairSupported,
} from '@/lib/translation/machine'

// A machine translation for the Translate page, from the saved answers when
// there is one, otherwise from the Space (sql/124, lib/translation/machine.ts).

// New translations allowed across the whole site per ten minutes, so that a
// script cannot spend the free GPU allowance. Saved answers are not counted.
const NEW_PER_TEN_MINUTES = 150

export const maxDuration = 150

export async function POST(req: Request) {
  const body = (await req.json().catch(() => ({}))) as { q?: string; from?: string; to?: string }
  const q = cleanMachineInput(body.q ?? '')
  const from = String(body.from ?? '')
  const to = String(body.to ?? '')

  if (!q || q.length > MACHINE_MAX_CHARS) {
    return NextResponse.json({ error: `Up to ${MACHINE_MAX_CHARS} characters.` }, { status: 400 })
  }
  if (!machinePairSupported(from, to)) {
    return NextResponse.json({ error: 'No machine translation for this pair.' }, { status: 400 })
  }

  const supabase = getClient()
  if (!supabase) return NextResponse.json({ error: 'Not configured.' }, { status: 500 })

  const textKey = createHash('md5').update(q.toLowerCase()).digest('hex')
  const { data: saved } = await supabase
    .from('machine_translations')
    .select('id, translation, hits')
    .eq('source_code', from)
    .eq('target_code', to)
    .eq('model', MACHINE_MODEL)
    .eq('text_key', textKey)
    .maybeSingle()

  if (saved) {
    await supabase
      .from('machine_translations')
      .update({ hits: Number(saved.hits ?? 1) + 1, last_used_at: new Date().toISOString() })
      .eq('id', saved.id)
    return NextResponse.json({ id: saved.id, translation: saved.translation, model: MACHINE_MODEL })
  }

  const since = new Date(Date.now() - 10 * 60_000).toISOString()
  const { count } = await supabase
    .from('machine_translations')
    .select('id', { count: 'exact', head: true })
    .gte('created_at', since)
  if ((count ?? 0) >= NEW_PER_TEN_MINUTES) {
    return NextResponse.json({ error: 'busy' }, { status: 429 })
  }

  let translation: string
  try {
    translation = await callTranslateSpace(q, from, to)
  } catch {
    return NextResponse.json({ error: 'unavailable' }, { status: 503 })
  }
  if (!translation) return NextResponse.json({ error: 'unavailable' }, { status: 503 })

  const { data: stored } = await supabase
    .from('machine_translations')
    .upsert(
      { source_code: from, target_code: to, source_text: q, translation, model: MACHINE_MODEL },
      { onConflict: 'source_code,target_code,model,text_key', ignoreDuplicates: false }
    )
    .select('id')
    .maybeSingle()

  return NextResponse.json({ id: stored?.id ?? null, translation, model: MACHINE_MODEL })
}
