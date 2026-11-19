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

# LughaKonnect language codes -> NLLB codes.
LANGS = {
    "sw": "swh_Latn",
    "en": "eng_Latn",
    "luo": "luo_Latn",
    "ki": "kik_Latn",
    "kam": "kam_Latn",
    "som": "som_Latn",
}
MAX_LINES = 32
MAX_CHARS = 400

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_ID)
model.to("cuda")  # ZeroGPU attaches a GPU only while a @spaces.GPU call runs
model.eval()


@spaces.GPU(duration=30)
def translate(text: str, source: str, target: str) -> str:
    """One sentence per line in, one translation per line out."""
    if source not in LANGS or target not in LANGS or source == target:
        raise gr.Error("Unsupported language pair")
    lines = [line.strip()[:MAX_CHARS] for line in str(text or "").split("\n") if line.strip()]
    if not lines:
        return ""
    if len(lines) > MAX_LINES:
        raise gr.Error(f"At most {MAX_LINES} lines at a time")

    tokenizer.src_lang = LANGS[source]
    inputs = tokenizer(lines, return_tensors="pt", padding=True, truncation=True, max_length=256).to("cuda")
    with torch.inference_mode():
        output = model.generate(
            **inputs,
            forced_bos_token_id=tokenizer.convert_tokens_to_ids(LANGS[target]),
            max_new_tokens=256,
            num_beams=4,
        )
    return "\n".join(tokenizer.batch_decode(output, skip_special_tokens=True))


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
