import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/constants/site'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: '*',
        allow: '/',
        // Account pages are not blocked here on purpose. They carry a noindex
        // tag (see their layout.tsx), and a crawler only reads that tag on a
        // page it is allowed to fetch. Blocking them let a linked URL be
        // indexed anyway, just without a title.
        disallow: ['/api/'],
      },
    ],
    sitemap: `${SITE_URL}/sitemap.xml`,
  }
}
