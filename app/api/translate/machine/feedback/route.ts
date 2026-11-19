import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'
import { getClient } from '@/lib/translation/engine'
import { MACHINE_MAX_CHARS, cleanMachineInput } from '@/lib/translation/machine'

// "Is this right?" on a machine translation (sql/124). Signed-in users only;
// one verdict per person per translation, which they can change. A better
// version is kept for a reviewer, never shown as an answer before that.

export async function POST(req: Request) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  const supabase = getClient()
  if (!url || !anon || !supabase) return NextResponse.json({ error: 'Not configured.' }, { status: 500 })

  const token = req.headers.get('authorization')?.replace(/^Bearer\s+/i, '').trim()
  if (!token) return NextResponse.json({ error: 'Sign in to say whether it is right.' }, { status: 401 })
  const { data: auth, error: authError } = await createClient(url, anon).auth.getUser(token)
  if (authError || !auth?.user) return NextResponse.json({ error: 'Sign in to say whether it is right.' }, { status: 401 })

  const body = (await req.json().catch(() => ({}))) as { id?: string; verdict?: string; betterText?: string }
  const id = String(body.id ?? '')
  const verdict = body.verdict === 'right' || body.verdict === 'wrong' ? body.verdict : null
  const better = verdict === 'wrong' ? cleanMachineInput(body.betterText ?? '') || null : null
  if (!/^[0-9a-f-]{36}$/i.test(id) || !verdict) {
    return NextResponse.json({ error: 'Something was missing. Try again.' }, { status: 400 })
  }
  if (better && better.length > MACHINE_MAX_CHARS) {
    return NextResponse.json({ error: `Up to ${MACHINE_MAX_CHARS} characters.` }, { status: 400 })
  }

  const { error } = await supabase.from('machine_translation_feedback').upsert(
    {
      machine_translation_id: id,
      user_id: auth.user.id,
      verdict,
      better_text: better,
      status: 'pending',
      created_at: new Date().toISOString(),
    },
    { onConflict: 'machine_translation_id,user_id' }
  )
  if (error) return NextResponse.json({ error: 'Could not save that. Try again.' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
