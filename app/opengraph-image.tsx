import { ImageResponse } from 'next/og'
import { readFile } from 'node:fs/promises'
import { join } from 'node:path'

/**
 * The card a link to this site becomes when it is pasted anywhere.
 *
 * Generated rather than drawn, so it always carries the real fonts and the real
 * colours, and so it cannot drift out of step with the site the way an exported
 * PNG in a folder always eventually does.
 */

export const alt =
  "LughaKonnect. An open corpus of Kenya's languages, documented by the people who speak them."
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

const INK = '#12100E'
const PAPER = '#FBFAF7'
const SIGNAL = '#FF6568'
const SAND = '#D6A85C'
const MUTED = '#8A837B'

export default async function Image() {
  const [anton, mono] = await Promise.all([
    readFile(join(process.cwd(), 'assets/fonts/Anton-Regular.ttf')),
    readFile(join(process.cwd(), 'assets/fonts/IBMPlexMono-SemiBold.ttf')),
  ])

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
          padding: '68px 72px',
        }}
      >
        {/* The mark, built from boxes rather than a path, because the ring is
            two nested squares and always was. */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 26 }}>
          <div
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: 84,
              height: 84,
              border: `17px solid ${PAPER}`,
            }}
          >
            <div style={{ width: 24, height: 24, background: SIGNAL }} />
          </div>
          <div
            style={{
              display: 'flex',
              fontFamily: 'Mono',
              fontSize: 21,
              letterSpacing: 6,
              color: SAND,
            }}
          >
            LUGHAKONNECT
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column' }}>
          <div
            style={{
              display: 'flex',
              fontFamily: 'Anton',
              fontSize: 118,
              lineHeight: 1,
              letterSpacing: -1,
              color: PAPER,
            }}
          >
            KENYAN LANGUAGES,
          </div>
          <div
            style={{
              display: 'flex',
              fontFamily: 'Anton',
              fontSize: 118,
              lineHeight: 1.06,
              letterSpacing: -1,
              color: SIGNAL,
            }}
          >
            BY THEIR SPEAKERS
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: 22 }}>
          <div style={{ display: 'flex', width: 132, height: 5, background: SIGNAL }} />
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'flex-end',
            }}
          >
            <div
              style={{
                display: 'flex',
                width: 700,
                fontFamily: 'Mono',
                fontSize: 25,
                lineHeight: 1.45,
                color: MUTED,
              }}
            >
              An open corpus of words, phrases and recordings, built so these
              languages are usable by the technology that is coming.
            </div>
            <div style={{ display: 'flex', fontFamily: 'Mono', fontSize: 23, color: PAPER }}>
              lughakonnect.co.ke
            </div>
          </div>
        </div>
      </div>
    ),
    {
      ...size,
      fonts: [
        { name: 'Anton', data: anton, style: 'normal', weight: 400 },
        { name: 'Mono', data: mono, style: 'normal', weight: 600 },
      ],
    }
  )
}
