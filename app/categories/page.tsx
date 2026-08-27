import { redirect } from 'next/navigation'

// Browsing by topic is a filter on Browse, not a destination of its own.
export default function CategoriesRedirect() {
  redirect('/explore')
}
