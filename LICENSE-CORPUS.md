# Licence — the LughaKonnect language corpus

The **data** in LughaKonnect — headwords, definitions, translations, usage
examples, phrases, recordings and their metadata — is licensed under the

**Creative Commons Attribution 4.0 International Licence (CC BY 4.0)**
<https://creativecommons.org/licenses/by/4.0/>

You are free to share and adapt this data for any purpose, including
commercially, provided you give appropriate credit.

**Attribution:** *LughaKonnect — lughakonnect.co.ke — CC BY 4.0*, plus the named
contributors and language communities listed on the entries you use, where the
data identifies them.

The **application source code** in this repository is covered separately; see
`LICENSE` if present, otherwise all rights are reserved.

---

## Why CC BY and not ShareAlike

CC BY was chosen deliberately over CC BY-SA. Kenyan languages are absent from
most commercial language technology, and the goal of this project is for them to
appear in it — in translation systems, keyboards, speech recognition, wearables
and assistive devices. A ShareAlike clause would require every such system to
adopt the same licence, which in practice means most would simply carry on
without these languages. Attribution is required; adoption is not restricted.

## What this means for imported data

Because CC BY 4.0 is not compatible with taking in ShareAlike material and
relicensing it, the corpus has a hard rule:

**Nothing under CC BY-SA may be merged into the `entries` table.**

| Source | Licence | Status |
| --- | --- | --- |
| PanLex | CC0 | Safe to ingest |
| Open English WordNet | CC BY 4.0 | Safe to ingest, attribution required |
| Concepticon / CLDF concept lists | Open — verify per list | Safe once verified |
| Leipzig–Jakarta, Swadesh lists | Public | Safe to ingest |
| FLORES-200 / NLLB | Verify per dataset | Check before ingesting |
| **Wiktionary / kaikki.org** | **CC BY-SA** | **Quarantine only** |

Quarantined material may live in a separate table and be shown to a human
reviewer as a *suggestion*. A contributor may then supply the entry in their own
words. The suggestion is not the entry, and the ShareAlike text never lands in
the corpus.

Every imported row must record its `source_type` and `source_reference` so the
provenance of any entry can be traced.

## What this means for contributors

By contributing, you grant LughaKonnect the right to publish your contribution
under CC BY 4.0, and you confirm that it is your own work or that you have the
right to share it. You keep the copyright in what you contribute; you are naming
the terms on which others may use it.

**Recordings.** Voice is personal data. A recording is only collected with the
speaker's explicit, recorded consent, and a speaker may ask for their recordings
to be withdrawn at any time. Consent covers use in this corpus and in language
technology built from it, including speech recognition and synthesis.

## Community and cultural material

Some knowledge is not any individual's to license. Where an entry carries
ceremonial, sacred or otherwise restricted meaning, communities may ask for it to
be limited or removed, and that request is honoured regardless of this licence.
Raise it through the contact page.
