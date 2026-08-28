import { ImageResponse } from 'next/og'
import { readFile } from 'node:fs/promises'
import { join } from 'node:path'
import { getEntrySummary } from '@/lib/public-site'

/**
 * The card an entry becomes when someone shares it.
 *
 * Entry pages are what search lands on and what actually gets pasted into a
 * group chat, so this is the card that matters. It shows the word itself at
 * poster size, in its language, with the definition underneath, because a
 * shared link to a word should carry the word.
 */

export const alt = 'An entry in the LughaKonnect corpus'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

const INK = '#12100E'
const PAPER = '#FBFAF7'
const SIGNAL = '#FF6568'
const SAND = '#D6A85C'
const MUTED = '#8A837B'

/** Anton is wide. Long headwords have to come down in size or they clip. */
function headwordSize(headword: string) {
  if (headword.length > 26) return 68
  if (headword.length > 18) return 88
  if (headword.length > 12) return 112
  return 140
}

export default async function Image({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params

  const [entry, anton, mono] = await Promise.all([
    getEntrySummary(id).catch(() => null),
    readFile(join(process.cwd(), 'assets/fonts/Anton-Regular.ttf')),
    readFile(join(process.cwd(), 'assets/fonts/IBMPlexMono-SemiBold.ttf')),
  ])

  const headword = entry?.headword || 'LughaKonnect'
  const languageName = entry?.language?.name ?? null
  const nativeName = entry?.language?.native_name ?? null
  const definition = entry?.definition || entry?.english || ''

  const fonts = [
    { name: 'Anton', data: anton, style: 'normal' as const, weight: 400 as const },
    { name: 'Mono', data: mono, style: 'normal' as const, weight: 600 as const },
  ]

  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          background: INK,
          padding: '60px 72px',
        }}
      >
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
          }}
        >
          <div style={{ display: 'flex', alignItems: 'center', gap: 20 }}>
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: 56,
                height: 56,
                border: `11px solid ${PAPER}`,
              }}
            >
              <div style={{ width: 16, height: 16, background: SIGNAL }} />
            </div>
            <div
              style={{ display: 'flex', fontFamily: 'Mono', fontSize: 18, letterSpacing: 5, color: SAND }}
            >
              {languageName ? languageName.toUpperCase() : 'LUGHAKONNECT'}
              {nativeName && nativeName !== languageName ? `  ·  ${nativeName}` : ''}
            </div>
          </div>
          {entry?.partOfSpeech ? (
            <div
              style={{
                display: 'flex',
                fontFamily: 'Mono',
                fontSize: 17,
                letterSpacing: 3,
                color: MUTED,
                border: `1px solid ${MUTED}`,
                padding: '8px 16px',
              }}
            >
              {entry.partOfSpeech.toUpperCase()}
            </div>
          ) : (
            <div style={{ display: 'flex' }} />
          )}
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: 26 }}>
          <div
            style={{
              display: 'flex',
              fontFamily: 'Anton',
              fontSize: headwordSize(headword),
              lineHeight: 1,
              color: PAPER,
            }}
          >
            {headword}
          </div>
          {definition ? (
            <div
              style={{
                display: 'flex',
                width: 980,
                fontFamily: 'Mono',
                fontSize: 27,
                lineHeight: 1.4,
                color: MUTED,
              }}
            >
              {definition.length > 150 ? `${definition.slice(0, 147)}...` : definition}
            </div>
          ) : (
            <div style={{ display: 'flex' }} />
          )}
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: 18 }}>
          <div style={{ display: 'flex', width: 108, height: 5, background: SIGNAL }} />
          <div style={{ display: 'flex', fontFamily: 'Mono', fontSize: 21, color: PAPER }}>
            lughakonnect.co.ke
          </div>
        </div>
      </div>
    ),
    { ...size, fonts }
  )
}
