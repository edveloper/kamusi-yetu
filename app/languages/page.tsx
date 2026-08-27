import { redirect } from 'next/navigation'

// Browsing by language is a filter on Browse, not a destination of its own.
export default function LanguagesRedirect() {
  redirect('/explore')
}
