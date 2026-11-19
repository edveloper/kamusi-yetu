---
title: Lughakonnect Translate
emoji: 🏃
colorFrom: blue
colorTo: purple
sdk: gradio
sdk_version: 6.32.0
python_version: '3.12'
app_file: app.py
pinned: false
license: cc-by-nc-4.0
short_description: Machine translation for LughaKonnect (NLLB-200)
---

Machine translation for [LughaKonnect](https://lughakonnect.co.ke) using
[NLLB-200](https://huggingface.co/facebook/nllb-200-distilled-1.3B) by Meta
(CC BY-NC 4.0). Private: called only by LughaKonnect's server.

The source lives in the LughaKonnect repository under `services/translate-space/`
and is uploaded with `node --env-file=.env.local scripts/deploy-translate-space.mjs`.
