# LughaKonnect machine translation service (Hugging Face Space, ZeroGPU).
#
# Runs Meta's NLLB-200 for the Kenyan languages it covers. The Space is
# private: only LughaKonnect's server calls it, with a token. NLLB is licensed
# CC BY-NC 4.0, so its output is shown free, unsold, labelled as machine
# translation, and never saved into the CC BY dictionary.
#
# Deployed from services/translate-space/ by scripts/deploy-translate-space.mjs.

import os

import gradio as gr
import spaces
import torch
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

MODEL_ID = os.environ.get("MODEL_ID", "facebook/nllb-200-distilled-1.3B")
# A branch of the model repo, e.g. "run2"; empty means the main branch.
MODEL_REVISION = os.environ.get("MODEL_REVISION") or None

# LughaKonnect language codes -> NLLB codes. The last five were added by
# LughaKonnect's fine-tuning (run 2) and exist only in a model that has them.
LANGS = {
    "sw": "swh_Latn",
    "en": "eng_Latn",
    "luo": "luo_Latn",
    "ki": "kik_Latn",
    "kam": "kam_Latn",
    "som": "som_Latn",
    "dav": "dav_Latn",
    "kal": "kln_Latn",
    "bxk": "bxk_Latn",
    "rag": "rag_Latn",
    "lri": "lri_Latn",
}
# These learned from Kiswahili pairs only, so anything else goes through
# Kiswahili first: English -> Kiswahili -> Kalenjin.
SWAHILI_ONLY = {"dav", "kal", "bxk", "rag", "lri"}
MAX_LINES = 32
MAX_CHARS = 400

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID, revision=MODEL_REVISION)
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_ID, revision=MODEL_REVISION)
model.to("cuda")  # ZeroGPU attaches a GPU only while a @spaces.GPU call runs
model.eval()
# Languages this model actually knows: the run 2 codes are missing from older ones.
KNOWN = {code for code, nllb in LANGS.items() if tokenizer.convert_tokens_to_ids(nllb) != tokenizer.unk_token_id}


def _generate(lines, source, target):
    tokenizer.src_lang = LANGS[source]
    inputs = tokenizer(lines, return_tensors="pt", padding=True, truncation=True, max_length=256).to("cuda")
    with torch.inference_mode():
        output = model.generate(
            **inputs,
            forced_bos_token_id=tokenizer.convert_tokens_to_ids(LANGS[target]),
            max_new_tokens=256,
            num_beams=4,
        )
    return tokenizer.batch_decode(output, skip_special_tokens=True)


@spaces.GPU(duration=45)
def translate(text: str, source: str, target: str) -> str:
    """One sentence per line in, one translation per line out."""
    if source not in KNOWN or target not in KNOWN or source == target:
        raise gr.Error("Unsupported language pair")
    lines = [line.strip()[:MAX_CHARS] for line in str(text or "").split("\n") if line.strip()]
    if not lines:
        return ""
    if len(lines) > MAX_LINES:
        raise gr.Error(f"At most {MAX_LINES} lines at a time")

    if "sw" not in (source, target) and (source in SWAHILI_ONLY or target in SWAHILI_ONLY):
        lines = _generate(lines, source, "sw")
        source = "sw"
    return "\n".join(_generate(lines, source, target))


demo = gr.Interface(
    fn=translate,
    inputs=[
        gr.Textbox(label="Text, one sentence per line", lines=4),
        gr.Dropdown(list(LANGS), value="sw", label="From"),
        gr.Dropdown(list(LANGS), value="luo", label="Into"),
    ],
    outputs=gr.Textbox(label="Machine translation (NLLB-200, may be wrong)"),
    title="LughaKonnect machine translation",
    description="NLLB-200 by Meta, CC BY-NC 4.0. For LughaKonnect's own use.",
    api_name="translate",
    flagging_mode="never",
)

demo.queue(max_size=64).launch()
