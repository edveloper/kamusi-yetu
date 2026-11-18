// Lets a plain Node script import the site's TypeScript, which uses the
// '@/...' paths from tsconfig.json. Node 24 strips the types itself.
//
//   node --import ./scripts/ts-paths.mjs some-script.mjs
import { registerHooks } from 'node:module'
import { existsSync } from 'node:fs'
import { fileURLToPath, pathToFileURL } from 'node:url'
import path from 'node:path'

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')

registerHooks({
  resolve(specifier, context, nextResolve) {
    if (specifier.startsWith('@/')) {
      const base = path.join(ROOT, specifier.slice(2))
      for (const candidate of [base, `${base}.ts`, `${base}.tsx`, path.join(base, 'index.ts')]) {
        if (existsSync(candidate) && !candidate.endsWith(path.sep)) {
          return nextResolve(pathToFileURL(candidate).href, context)
        }
      }
    }
    return nextResolve(specifier, context)
  },
})
