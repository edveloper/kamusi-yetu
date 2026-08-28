import type { MetadataRoute } from 'next'
import { SITE_NAME, SITE_DESCRIPTION } from '@/lib/constants/site'

/**
 * Installed to a home screen this becomes an app, which matters more here than
 * it does for most sites. A lot of contribution and recording happens on a
 * phone, often on a poor connection, and an installed shortcut opening straight
 * to the gap queue is the shortest path from wanting to help to helping.
 */
export default function manifest(): MetadataRoute.Manifest {
  return {
    name: SITE_NAME,
    short_name: SITE_NAME,
    description: SITE_DESCRIPTION,
    start_url: '/',
    display: 'standalone',
    background_color: '#12100E',
    theme_color: '#12100E',
    lang: 'en-KE',
    categories: ['education', 'reference', 'books'],
    icons: [
      { src: '/brand/mark.svg', sizes: 'any', type: 'image/svg+xml' },
      { src: '/apple-icon', sizes: '180x180', type: 'image/png' },
    ],
  }
}
