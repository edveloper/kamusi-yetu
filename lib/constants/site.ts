export const SITE_URL = 'https://lughakonnect.co.ke'
export const SITE_NAME = 'LughaKonnect'
export const SITE_TITLE = `${SITE_NAME}. Kenyan Languages, Documented by Their Speakers`
export const SITE_DESCRIPTION =
  "Free sentence translation and an open dictionary for Kenya's languages, built with the people who speak them. Words, sentences and recordings, so these languages work in the technology that is coming."

/**
 * Who to write to. Every address lands in the same Zoho mailbox; separate
 * addresses let the inbox sort itself and let any one of them move to a
 * different person later without touching the site.
 *
 * hello      day-to-day: contributors, corrections, reviewing, privacy requests
 * eddie      partnerships and collaboration, straight to the founder
 * enquiries  using the data: researchers, builders, bulk exports
 * info       the organisation's public address, for listings and metadata
 */
export const CONTACT = {
  hello: 'hello@lughakonnect.co.ke',
  eddie: 'eddie@lughakonnect.co.ke',
  enquiries: 'enquiries@lughakonnect.co.ke',
  info: 'info@lughakonnect.co.ke',
} as const

/** Data licence for the corpus. See LICENSE-CORPUS.md for the reasoning. */
export const CORPUS_LICENCE = {
  name: 'CC BY 4.0',
  fullName: 'Creative Commons Attribution 4.0 International',
  url: 'https://creativecommons.org/licenses/by/4.0/',
} as const
