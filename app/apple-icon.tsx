import { ImageResponse } from 'next/og'

/**
 * The home screen icon on iOS, which does not render SVG and does not honour
 * transparency, so it needs its own solid PNG rather than a link to icon.svg.
 *
 * iOS also rounds the corners itself. The mark is inset accordingly, so the
 * ring is not clipped by a radius this identity would never draw.
 */

export const size = { width: 180, height: 180 }
export const contentType = 'image/png'

export default function AppleIcon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          background: '#12100E',
        }}
      >
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            width: 104,
            height: 104,
            border: '21px solid #FBFAF7',
          }}
        >
          <div style={{ width: 31, height: 31, background: '#C2152A' }} />
        </div>
      </div>
    ),
    size
  )
}
