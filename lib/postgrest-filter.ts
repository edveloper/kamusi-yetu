// Safe building blocks for PostgREST `.or()` filter strings.
//
// `.or()` takes a raw string in which commas separate conditions and brackets
// group them. Interpolating user text directly meant a search such as
// "yes, thank you" was split at the comma into a broken condition, and the
// request failed. PostgREST accepts double-quoted values, inside which commas
// and brackets are literal; only `"` and `\` need escaping.

/** Escape LIKE wildcards so user text matches literally. */
export function escapeLike(value: string) {
  return value.replace(/[\\%_]/g, (char) => `\\${char}`)
}

/** Quote a value for use inside an `.or()` condition. */
export function quoteFilterValue(value: string) {
  return `"${value.replace(/[\\"]/g, (char) => `\\${char}`)}"`
}

/** `column.ilike."pattern"`, where pattern may contain % wildcards. */
export function ilikeCondition(column: string, pattern: string) {
  return `${column}.ilike.${quoteFilterValue(pattern)}`
}

/** `column.eq."value"` */
export function eqCondition(column: string, value: string) {
  return `${column}.eq.${quoteFilterValue(value)}`
}
