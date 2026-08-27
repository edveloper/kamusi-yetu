import type { MetadataRoute } from 'next'
import { SITE_URL } from '@/lib/constants/site'
import { getSitemapEntries } from '@/lib/public-site'

// Regenerate daily; the corpus changes far more slowly than that.
export const revalidate = 86400

const STATIC_PATHS: Array<{ path: string; priority: number; changeFrequency: MetadataRoute.Sitemap[number]['changeFrequency'] }> = [
  { path: '', priority: 1.0, changeFrequency: 'daily' },
  { path: '/explore', priority: 0.9, changeFrequency: 'daily' },
  { path: '/translate', priority: 0.9, changeFrequency: 'weekly' },
  { path: '/trending', priority: 0.7, changeFrequency: 'daily' },
  { path: '/contribute', priority: 0.7, changeFrequency: 'monthly' },
  { path: '/about', priority: 0.6, changeFrequency: 'monthly' },
  { path: '/guidelines', priority: 0.5, changeFrequency: 'monthly' },
  { path: '/team', priority: 0.4, changeFrequency: 'monthly' },
  { path: '/contact', priority: 0.3, changeFrequency: 'yearly' },
]

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const staticEntries: MetadataRoute.Sitemap = STATIC_PATHS.map((entry) => ({
    url: `${SITE_URL}${entry.path}`,
    lastModified: new Date(),
    changeFrequency: entry.changeFrequency,
    priority: entry.priority,
  }))

  let entryPages: MetadataRoute.Sitemap = []
  try {
    const rows = await getSitemapEntries()
    entryPages = rows.map((row) => ({
      url: `${SITE_URL}/entry/${row.id}`,
      lastModified: row.updated_at ? new Date(row.updated_at) : undefined,
      changeFrequency: 'monthly' as const,
      priority: 0.6,
    }))
  } catch {
    // A sitemap missing its entry pages is far better than a 500 that makes
    // crawlers drop the whole file.
  }

  return [...staticEntries, ...entryPages]
}
