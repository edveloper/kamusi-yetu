import { NextResponse } from 'next/server'
import { runTranslation, type TranslateRequest } from '@/lib/translation/engine'

// Thin wrapper. The engine lives in lib so the Translate page can call it
// directly and render a translation on the server.
export async function POST(req: Request) {
  try {
    const body = (await req.json()) as TranslateRequest
    const outcome = await runTranslation(body)

    if (!outcome.ok) {
      return NextResponse.json({ error: outcome.error }, { status: outcome.status })
    }
    return NextResponse.json({ ok: true, result: outcome.result })
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Translation failed.'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
