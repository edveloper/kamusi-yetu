# %% [markdown]
# # Fine-tuning NLLB-200 for LughaKonnect
#
# Adapts NLLB-200 distilled 1.3B (Meta, CC BY-NC 4.0) to Dholuo and Kikuyu with
# LughaKonnect's sentence pairs: AfriVoices-KE and KenTrans (CC BY 4.0), as
# exported by `scripts/export-training-pairs.mjs`, with the translation test's
# held-out sentences already removed.
#
# The result is still an NLLB derivative under CC BY-NC 4.0: free use only.
#
# **Before running** (Kaggle):
# 1. Settings: Accelerator **GPU T4 x2** or **P100** (only one GPU is used), Internet **on**.
# 2. Add Input: your private dataset holding `pairs.tsv`.
# 3. Add-ons, Secrets: `HF_MODEL_TOKEN`, a token that can write to the model repo below.
#
# Then **Run All**. Training takes roughly 4 to 6 hours; the last cell uploads the
# model to Hugging Face.

# %%
MODEL_ID = "facebook/nllb-200-distilled-1.3B"
OUTPUT_REPO = "Edveloper/lughakonnect-nllb"   # private model repo on Hugging Face
EPOCHS = 1
LEARNING_RATE = 2e-4
BATCH_SIZE = 8         # per step; GRAD_ACCUM steps make one update of 16
GRAD_ACCUM = 2
MAX_LEN = 128
DEV_SIZE = 400        # pairs kept back to watch progress (the real test is separate)
SEED = 13

# %%
!pip install -q "transformers>=4.44,<5" "peft>=0.11" sacrebleu sentencepiece accelerate
# Kaggle ships an old torchao that new peft refuses to load; LoRA does not need it.
!pip uninstall -y -q torchao

# %%
import os
# One GPU only: with two, PyTorch copies the whole model to each and gathers
# everything on the first, which ran out of memory on Kaggle's T4s.
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ["PYTORCH_CUDA_ALLOC_CONF"] = "expandable_segments:True"
import glob, random, csv
import torch
from datasets import Dataset
from transformers import (AutoModelForSeq2SeqLM, AutoTokenizer, DataCollatorForSeq2Seq,
                          Seq2SeqTrainer, Seq2SeqTrainingArguments)
from peft import LoraConfig, get_peft_model
import sacrebleu

random.seed(SEED)
NLLB = {"luo": "luo_Latn", "ki": "kik_Latn", "sw": "swh_Latn", "en": "eng_Latn"}

path = glob.glob("/kaggle/input/**/pairs.tsv", recursive=True)[0]
with open(path, encoding="utf-8") as f:
    rows = list(csv.DictReader(f, delimiter="\t", quoting=csv.QUOTE_NONE))
print(len(rows), "pairs from", path)

# Both directions for every pair, so the model gets better at going into
# Dholuo and Kikuyu as well as out of them.
examples = []
for r in rows:
    lang, bridge = NLLB[r["lang"]], NLLB[r["bridge"]]
    examples.append({"src": r["text"], "tgt": r["translation"], "src_lang": lang, "tgt_lang": bridge})
    examples.append({"src": r["translation"], "tgt": r["text"], "src_lang": bridge, "tgt_lang": lang})
random.shuffle(examples)
dev, train = examples[:DEV_SIZE], examples[DEV_SIZE:]
print(len(train), "training examples,", len(dev), "dev")

# %%
tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)

def encode(ex):
    tokenizer.src_lang, tokenizer.tgt_lang = ex["src_lang"], ex["tgt_lang"]
    return tokenizer(ex["src"], text_target=ex["tgt"], max_length=MAX_LEN, truncation=True)

train_ds = Dataset.from_list(train).map(encode, remove_columns=["src", "tgt", "src_lang", "tgt_lang"])
dev_ds = Dataset.from_list(dev).map(encode, remove_columns=["src", "tgt", "src_lang", "tgt_lang"])

# %%
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_ID, dtype=torch.float32)
# Recompute activations instead of storing them: slower, but fits a 16 GB GPU.
# Non-reentrant: NLLB's scaled embeddings bypass the hook the older mode relies on.
model.gradient_checkpointing_enable(gradient_checkpointing_kwargs={"use_reentrant": False})
lora = LoraConfig(r=16, lora_alpha=32, lora_dropout=0.05, task_type="SEQ_2_SEQ_LM",
                  target_modules=["q_proj", "k_proj", "v_proj", "out_proj", "fc1", "fc2"])
model = get_peft_model(model, lora)
model.print_trainable_parameters()

# %%
def translate(texts, src, tgt, m):
    tokenizer.src_lang = src
    batch = tokenizer(texts, return_tensors="pt", padding=True, truncation=True, max_length=MAX_LEN).to(m.device)
    with torch.no_grad():
        out = m.generate(**batch, forced_bos_token_id=tokenizer.convert_tokens_to_ids(tgt),
                         max_new_tokens=MAX_LEN, num_beams=4)
    return tokenizer.batch_decode(out, skip_special_tokens=True)

def dev_chrf(m, n=200):
    m.eval()
    hyps, refs = [], []
    for ex in dev[:n]:
        hyps += translate([ex["src"]], ex["src_lang"], ex["tgt_lang"], m)
        refs.append(ex["tgt"])
    m.train()
    return sacrebleu.corpus_chrf(hyps, [refs]).score

model.to("cuda")
print("dev chrF before:", round(dev_chrf(model), 1))

# %%
steps = len(train_ds) // (BATCH_SIZE * GRAD_ACCUM) * EPOCHS
args = Seq2SeqTrainingArguments(
    output_dir="/kaggle/working/run",
    num_train_epochs=EPOCHS,
    learning_rate=LEARNING_RATE,
    per_device_train_batch_size=BATCH_SIZE,
    per_device_eval_batch_size=BATCH_SIZE,
    gradient_accumulation_steps=GRAD_ACCUM,
    warmup_steps=max(1, int(steps * 0.03)),
    lr_scheduler_type="cosine",
    fp16=True,
    logging_steps=100,
    eval_strategy="steps",
    eval_steps=1000,
    save_steps=1000,
    save_total_limit=2,
    report_to="none",
    seed=SEED,
)
trainer = Seq2SeqTrainer(model=model, args=args, train_dataset=train_ds, eval_dataset=dev_ds,
                         data_collator=DataCollatorForSeq2Seq(tokenizer, model=model))
trainer.train()

# %%
print("dev chrF after:", round(dev_chrf(model), 1))
for ex in dev[:6]:
    print(ex["src_lang"], "->", ex["tgt_lang"], "|", ex["src"])
    print("   model:", translate([ex["src"]], ex["src_lang"], ex["tgt_lang"], model)[0])
    print("   real: ", ex["tgt"])

# %%
# Always keep the trained adapter (small) in the output, so the work is never lost.
model.save_pretrained("/kaggle/working/adapter")
tokenizer.save_pretrained("/kaggle/working/adapter")
print("Adapter saved to /kaggle/working/adapter")

try:
    from kaggle_secrets import UserSecretsClient
    token = UserSecretsClient().get_secret("HF_MODEL_TOKEN")
except Exception:
    token = None
if not token:
    raise SystemExit("No HF_MODEL_TOKEN secret attached: nothing uploaded. Download /kaggle/working/adapter instead.")

merged = model.merge_and_unload()
merged.save_pretrained("/kaggle/working/merged", safe_serialization=True)
tokenizer.save_pretrained("/kaggle/working/merged")
merged.push_to_hub(OUTPUT_REPO, token=token, private=True,
                   commit_message="NLLB-200 1.3B adapted to Dholuo and Kikuyu (LughaKonnect)")
tokenizer.push_to_hub(OUTPUT_REPO, token=token, private=True)
print("Uploaded to", OUTPUT_REPO)
