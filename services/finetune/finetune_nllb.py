# %% [markdown]
# # Fine-tuning NLLB-200 for LughaKonnect, run 2
#
# Run 1 (19 November 2026) adapted NLLB-200 distilled 1.3B (Meta, CC BY-NC
# 4.0) to Dholuo and Kikuyu: the model `Edveloper/lughakonnect-nllb`, main
# branch. Run 2 starts from that model and teaches it five languages NLLB has
# never seen: Kidaw'ida (Taita), Kalenjin, and the Luhya dialects Bukusu,
# Logooli and Marachi. A sample of Dholuo and Kikuyu pairs is mixed in so it
# keeps what it learned.
#
# Pairs come from `scripts/export-training-pairs.mjs`: AfriVoices-KE, KenTrans
# and thinkKenya (all CC BY 4.0), with the translation test's held-out
# sentences already removed. The result is still an NLLB derivative under
# CC BY-NC 4.0: free use only.
#
# **Before running** (Kaggle):
# 1. Settings: Accelerator **GPU T4 x2** or **P100** (only one GPU is used), Internet **on**.
# 2. Input: your private dataset holding the new `pairs.tsv`.
# 3. Add-ons, Secrets: `HF_MODEL_TOKEN` ticked. It is needed at the start to
#    read the private run 1 model, and at the end to upload.
#
# The result goes to the `run2` branch of the same model repo, so the live
# translator keeps using run 1 until we switch. Training takes roughly 6 hours.

# %%
MODEL_ID = "Edveloper/lughakonnect-nllb"   # run 1, private
OUTPUT_REPO = "Edveloper/lughakonnect-nllb"
OUTPUT_BRANCH = "run2"
EPOCHS = 1
LEARNING_RATE = 2e-4
BATCH_SIZE = 8         # per step; GRAD_ACCUM steps make one update of 16
GRAD_ACCUM = 2
MAX_LEN = 128
DEV_SIZE = 600        # pairs kept back to watch progress (the real test is separate)
SEED = 13
# Pairs per language at most. Dholuo and Kikuyu are a reminder, not the main
# course; the new languages use everything they have.
LIMITS = {"luo": 30000, "ki": 12000}
# The Luhya dialects have only a few thousand pairs each, so they are seen
# twice. More than that and the model starts memorising them.
REPEAT = {"bxk": 2, "rag": 2, "lri": 2}

# %%
!pip install -q "transformers>=4.44,<5" "peft>=0.11,<1" sacrebleu sentencepiece accelerate
# Kaggle ships an old torchao that new peft refuses to load; LoRA does not need it.
!pip uninstall -y -q torchao

# %%
import os
# One GPU only: with two, PyTorch copies the whole model to each and gathers
# everything on the first, which ran out of memory on Kaggle's T4s.
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ["PYTORCH_CUDA_ALLOC_CONF"] = "expandable_segments:True"
import glob, random, csv
from collections import Counter, defaultdict
import torch
from datasets import Dataset
from transformers import (AutoModelForSeq2SeqLM, AutoTokenizer, DataCollatorForSeq2Seq,
                          Seq2SeqTrainer, Seq2SeqTrainingArguments)
from peft import LoraConfig, get_peft_model
import sacrebleu

try:
    from kaggle_secrets import UserSecretsClient
    HF_TOKEN = UserSecretsClient().get_secret("HF_MODEL_TOKEN")
except Exception:
    HF_TOKEN = os.environ.get("HF_TOKEN")
if not HF_TOKEN:
    raise SystemExit("Attach the HF_MODEL_TOKEN secret (Add-ons, Secrets): it is needed to read the run 1 model.")
# Some library calls ask Hugging Face about the model without passing a token
# (transformers 4.57 checks every tokenizer against Mistral's), which fails on
# a private model. They all read HF_TOKEN from the environment.
os.environ["HF_TOKEN"] = HF_TOKEN

random.seed(SEED)
# LughaKonnect codes -> NLLB codes. The last five are new to NLLB.
NLLB = {"luo": "luo_Latn", "ki": "kik_Latn", "sw": "swh_Latn", "en": "eng_Latn",
        "dav": "dav_Latn", "kal": "kln_Latn", "bxk": "bxk_Latn", "rag": "rag_Latn", "lri": "lri_Latn"}
# Each new language code starts as a copy of a related language NLLB knows:
# Kiswahili for Kidaw'ida (both coastal Bantu), Dholuo for Kalenjin (both
# Nilotic), Luganda for the Luhya dialects (close Bantu neighbours).
NEW = {"dav_Latn": "swh_Latn", "kln_Latn": "luo_Latn",
       "bxk_Latn": "lug_Latn", "rag_Latn": "lug_Latn", "lri_Latn": "lug_Latn"}

path = glob.glob("/kaggle/input/**/pairs.tsv", recursive=True)[0]
with open(path, encoding="utf-8") as f:
    rows = list(csv.DictReader(f, delimiter="\t", quoting=csv.QUOTE_NONE))
print(len(rows), "pairs from", path, Counter(r["lang"] for r in rows))
missing = {"dav", "kal", "bxk", "rag", "lri"} - {r["lang"] for r in rows}
if missing:
    raise SystemExit(f"This pairs.tsv has no {sorted(missing)}: it is the run 1 file. Upload the new one as a new dataset version.")

by_lang = defaultdict(list)
for r in rows:
    by_lang[r["lang"]].append(r)
chosen = []
for lang, items in by_lang.items():
    random.shuffle(items)
    items = items[:LIMITS.get(lang, len(items))]
    chosen += items * REPEAT.get(lang, 1)
print("chosen", Counter(r["lang"] for r in chosen))

# Both directions for every pair, so the model gets better at going into each
# language as well as out of it.
examples = []
for r in chosen:
    lang, bridge = NLLB[r["lang"]], NLLB[r["bridge"]]
    examples.append({"src": r["text"], "tgt": r["translation"], "src_lang": lang, "tgt_lang": bridge})
    examples.append({"src": r["translation"], "tgt": r["text"], "src_lang": bridge, "tgt_lang": lang})
random.shuffle(examples)
# No dev pair may appear in training, in either direction or as a repeat.
dev = examples[:DEV_SIZE]
dev_keys = {(e["src"], e["tgt"]) for e in dev} | {(e["tgt"], e["src"]) for e in dev}
train = [e for e in examples[DEV_SIZE:] if (e["src"], e["tgt"]) not in dev_keys]
print(len(train), "training examples,", len(dev), "dev")

# %%
tokenizer = AutoTokenizer.from_pretrained(MODEL_ID, token=HF_TOKEN)
tokenizer.add_special_tokens({"additional_special_tokens": list(NEW)}, replace_additional_special_tokens=False)
NEW_IDS = [tokenizer.convert_tokens_to_ids(code) for code in NEW]
FIRST_NEW = min(NEW_IDS)
assert NEW_IDS == list(range(FIRST_NEW, FIRST_NEW + len(NEW))), NEW_IDS
for code in NEW:  # each new code must stay one token
    assert tokenizer.tokenize(code) == [code], tokenizer.tokenize(code)

def encode(ex):
    tokenizer.src_lang, tokenizer.tgt_lang = ex["src_lang"], ex["tgt_lang"]
    return tokenizer(ex["src"], text_target=ex["tgt"], max_length=MAX_LEN, truncation=True)

train_ds = Dataset.from_list(train).map(encode, remove_columns=["src", "tgt", "src_lang", "tgt_lang"])
dev_ds = Dataset.from_list(dev).map(encode, remove_columns=["src", "tgt", "src_lang", "tgt_lang"])

# %%
model = AutoModelForSeq2SeqLM.from_pretrained(MODEL_ID, dtype=torch.float32, token=HF_TOKEN)
model.resize_token_embeddings(len(tokenizer))
emb = model.get_input_embeddings().weight
with torch.no_grad():
    for code, like in NEW.items():
        row = emb[tokenizer.convert_tokens_to_ids(like)]
        # A little noise, so the three Luhya dialects do not start identical.
        emb[tokenizer.convert_tokens_to_ids(code)] = row + torch.randn_like(row) * row.std() * 0.1

# Recompute activations instead of storing them: slower, but fits a 16 GB GPU.
# Non-reentrant: NLLB's scaled embeddings bypass the hook the older mode relies on.
model.gradient_checkpointing_enable(gradient_checkpointing_kwargs={"use_reentrant": False})
lora = LoraConfig(r=16, lora_alpha=32, lora_dropout=0.05, task_type="SEQ_2_SEQ_LM",
                  target_modules=["q_proj", "k_proj", "v_proj", "out_proj", "fc1", "fc2"])
model = get_peft_model(model, lora)

# The new language codes need embeddings of their own. LoRA leaves embeddings
# frozen, and training the whole 256k-row table would not fit, so the new rows
# get a small trainable correction (5 x 1024 numbers), added wherever a new
# code is looked up. It is folded into the table before upload.
class NewCodes(torch.nn.Module):
    def __init__(self, n, dim):
        super().__init__()
        self.delta = torch.nn.Parameter(torch.zeros(n, dim))

    def hook(self, module, inputs, output):
        ids = inputs[0]
        index = ids - FIRST_NEW
        mine = (index >= 0) & (index < self.delta.shape[0])
        if not mine.any():
            return output
        add = self.delta[index.clamp(0, self.delta.shape[0] - 1)] * mine.unsqueeze(-1).to(output.dtype)
        return output + add.to(output.dtype) * getattr(module, "embed_scale", 1.0)

new_codes = NewCodes(len(NEW_IDS), emb.shape[1])
model.base_model.model.add_module("new_codes", new_codes)
# After resizing, the encoder and decoder may share one lookup object, which
# named_modules() would list only once; each distinct object is hooked once.
lookups = {id(m): m for name, m in model.named_modules(remove_duplicate=False)
           if name.endswith(("embed_tokens", "shared"))}
hooked = [m.register_forward_hook(new_codes.hook) for m in lookups.values()]
print("embedding lookups hooked:", len(hooked))
assert hooked
model.print_trainable_parameters()

# %%
def translate(texts, src, tgt, m):
    m.eval()  # generating in training mode drops the decoder cache and gives "? ? ?"
    tokenizer.src_lang = src
    batch = tokenizer(texts, return_tensors="pt", padding=True, truncation=True, max_length=MAX_LEN).to(m.device)
    with torch.no_grad():
        out = m.generate(**batch, forced_bos_token_id=tokenizer.convert_tokens_to_ids(tgt),
                         max_new_tokens=MAX_LEN, num_beams=4)
    return tokenizer.batch_decode(out, skip_special_tokens=True)

def dev_chrf(m, n=300):
    """chrF on the dev examples, overall and per language pair."""
    groups = defaultdict(lambda: ([], []))
    for ex in dev[:n]:
        hyp = translate([ex["src"]], ex["src_lang"], ex["tgt_lang"], m)[0]
        for key in ("all", f'{ex["src_lang"][:3]}>{ex["tgt_lang"][:3]}'):
            groups[key][0].append(hyp)
            groups[key][1].append(ex["tgt"])
    m.train()
    return {k: round(sacrebleu.corpus_chrf(h, [r]).score, 1) for k, (h, r) in sorted(groups.items())}

model.to("cuda")
print("dev chrF before:", dev_chrf(model))

# %%
steps = len(train_ds) // (BATCH_SIZE * GRAD_ACCUM) * EPOCHS
print(steps, "updates")
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
print("dev chrF after:", dev_chrf(model))
for ex in dev[:8]:
    print(ex["src_lang"], "->", ex["tgt_lang"], "|", ex["src"])
    print("   model:", translate([ex["src"]], ex["src_lang"], ex["tgt_lang"], model)[0])
    print("   real: ", ex["tgt"])

# %%
# Always keep the trained adapter and the new codes (small) in the output, so
# the work is never lost.
model.save_pretrained("/kaggle/working/adapter")
tokenizer.save_pretrained("/kaggle/working/adapter")
torch.save(new_codes.delta.detach().cpu(), "/kaggle/working/adapter/new_codes.pt")
print("Adapter saved to /kaggle/working/adapter")

for h in hooked:
    h.remove()
merged = model.merge_and_unload()
with torch.no_grad():
    table = merged.get_input_embeddings()
    table.weight[FIRST_NEW:FIRST_NEW + len(NEW_IDS)] += new_codes.delta.detach().to(table.weight.dtype)
del merged.new_codes  # folded in; not part of the saved model
# Without the hooks the merged model must translate just as well.
print("check after merging:", translate([dev[0]["src"]], dev[0]["src_lang"], dev[0]["tgt_lang"], merged))
merged.save_pretrained("/kaggle/working/merged", safe_serialization=True)
tokenizer.save_pretrained("/kaggle/working/merged")

from huggingface_hub import create_branch
create_branch(OUTPUT_REPO, branch=OUTPUT_BRANCH, token=HF_TOKEN, exist_ok=True)
merged.push_to_hub(OUTPUT_REPO, token=HF_TOKEN, revision=OUTPUT_BRANCH, private=True,
                   commit_message="Run 2: adds Kidaw'ida, Kalenjin, Bukusu, Logooli and Marachi")
tokenizer.push_to_hub(OUTPUT_REPO, token=HF_TOKEN, revision=OUTPUT_BRANCH, private=True)
print("Uploaded to", OUTPUT_REPO, "branch", OUTPUT_BRANCH)
