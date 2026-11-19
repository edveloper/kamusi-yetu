// Turn finetune_nllb.py ("# %%" cells) into finetune_nllb.ipynb for Kaggle.
//   node services/finetune/build-notebook.mjs
import fs from 'node:fs'

const dir = new URL('./', import.meta.url)
const source = fs.readFileSync(new URL('finetune_nllb.py', dir), 'utf8').replace(/\r\n/g, '\n')
const cells = source.split(/^# %%/m).filter((c) => c.trim()).map((chunk) => {
  const markdown = chunk.startsWith(' [markdown]')
  const body = chunk.replace(/^ \[markdown\]/, '').replace(/^\n/, '').replace(/\n+$/, '')
  const lines = (markdown ? body.split('\n').map((l) => l.replace(/^# ?/, '')) : body.split('\n'))
    .map((l, i, all) => (i < all.length - 1 ? l + '\n' : l))
  return markdown
    ? { cell_type: 'markdown', metadata: {}, source: lines }
    : { cell_type: 'code', execution_count: null, metadata: {}, outputs: [], source: lines }
})

const notebook = {
  cells,
  metadata: {
    kernelspec: { display_name: 'Python 3', language: 'python', name: 'python3' },
    language_info: { name: 'python' },
  },
  nbformat: 4,
  nbformat_minor: 5,
}
fs.writeFileSync(new URL('finetune_nllb.ipynb', dir), JSON.stringify(notebook, null, 1) + '\n')
console.log(cells.length, 'cells written to services/finetune/finetune_nllb.ipynb')
