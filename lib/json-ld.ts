/**
 * Serialise structured data for a <script type="application/ld+json"> tag.
 *
 * JSON.stringify leaves "<" alone, so an entry whose text contained
 * "</script>" would close the tag early and whatever followed would run as
 * page markup. Escaping "<" (and the two line separators JSON allows but
 * older JavaScript did not) keeps the payload inert while staying valid JSON.
 */
const LINE_SEPARATOR = new RegExp(String.fromCharCode(0x2028), 'g')
const PARAGRAPH_SEPARATOR = new RegExp(String.fromCharCode(0x2029), 'g')

export function serializeJsonLd(data: unknown) {
  return JSON.stringify(data)
    .replace(/</g, '\\u003c')
    .replace(LINE_SEPARATOR, '\\u2028')
    .replace(PARAGRAPH_SEPARATOR, '\\u2029')
}
