import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/constants/site'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: '*',
        allow: '/',
        // Signed-in and operational surfaces hold nothing a crawler should index.
        disallow: ['/api/', '/moderate', '/profile', '/login', '/signup', '/reset'],
      },
    ],
    sitemap: `${SITE_URL}/sitemap.xml`,
    host: SITE_URL,
  }
}
