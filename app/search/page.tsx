import { redirect } from 'next/navigation'

// /search was a separate results page. Browse now does this, server-rendered,
// so old links and bookmarks carry their query straight across.
export default async function SearchRedirect({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>
}) {
  const params = await searchParams
  const search = new URLSearchParams()
  for (const [key, value] of Object.entries(params)) {
    const v = Array.isArray(value) ? value[0] : value
    if (v) search.set(key, v)
  }
  const qs = search.toString()
  redirect(qs ? `/explore?${qs}` : '/explore')
}
