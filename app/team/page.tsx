import { redirect } from 'next/navigation'

// Team is folded into About. Two pages said overlapping things in two voices,
// and the weaker one was on the more-visited page.
export default function TeamRedirect() {
  redirect('/about')
}
