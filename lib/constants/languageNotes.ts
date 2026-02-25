export const LANGUAGE_NOTES: Record<string, string> = {
  sw: 'Kiswahili is Kenya\'s national language and a major bridge across communities, commerce, and culture.',
  en: 'English is widely used in education, law, technology, and international communication in Kenya.',
  luo: 'Dholuo is a Nilotic language with strong oral poetry, music traditions, and intergenerational storytelling.',
  ki: 'Kikuyu is a major Central Kenyan language known for rich proverbs, folktales, and agricultural vocabulary.',
  kam: 'Kamba is an Eastern Bantu language with deep oral heritage, trade vocabulary, and expressive idioms.',
  luy: 'Luhya is a language cluster across western Kenya with distinct dialects and strong communal storytelling.',
  kal: 'Kalenjin is a Nilotic language group with diverse dialects and powerful idiomatic expression.',
  x_sheng: 'Sheng is a dynamic urban Kenyan sociolect blending multiple languages and evolving rapidly in youth culture.',
  x_ke_hin: 'Kenyan Hindustani reflects generations of South Asian Kenyan heritage in family, food, and trade language.',
  guz: 'Ekegusii is spoken by the Gusii community and carries rich social, agricultural, and oral traditions.',
  mer: 'Kimeru represents the Meru community\'s linguistic heritage, with strong ties to highland culture and folklore.',
  ebu: 'Kiembu is the Embu community language, preserving local identity, values, and oral wisdom.',
  mas: 'Maa (Maasai) preserves pastoralist heritage, social identity, and ceremonial vocabulary across generations.',
  x_ke_trk: 'Ng\'aturkana (Turkana) reflects pastoral life, resilience, and community identity in northwestern Kenya.',
  som: 'Af-Soomaali in Kenya supports vibrant cross-border trade, family life, and cultural continuity.',
  orm: 'Afaan Oromoo (Borana Oromo) carries pastoral and communal knowledge across northern Kenyan regions.',
  x_ke_pok: 'Kipokomo reflects the Pokomo community\'s riverine culture, farming life, and oral heritage.',
  dav: 'Kitaita carries the Taita community\'s linguistic history from the hills and surrounding settlements.',
  tvs: 'Kitaveta preserves Taveta identity with strong cross-border cultural and linguistic exchange.',
  saq: 'Samburu language preserves pastoral worldview, kinship structures, and ceremonial expression.',
  rel: 'Rendille language captures pastoral desert heritage, kinship systems, and place-based knowledge.',
  x_ke_kur: 'Ekikuria reflects Kuria community identity, social life, and cross-border cultural continuity.',
  nyf: 'Kigiryama is part of the Mijikenda linguistic heritage with deep coastal oral traditions.',
  dig: 'Chidigo is a coastal language with strong Islamic, mercantile, and community storytelling influences.',
  dug: 'Kiduruma preserves Duruma identity within the Mijikenda cultural and linguistic landscape.',
  coh: 'Kichonyi reflects Chonyi community heritage and everyday coastal social expression.',
  rra: 'Kirabai is a Mijikenda language preserving Rabai community memory and local knowledge.',
}

export function getLanguageNote(code?: string | null) {
  const normalized = String(code || '').toLowerCase().replace(/-/g, '_')
  return LANGUAGE_NOTES[normalized] || 'A living Kenyan language community preserved by its speakers.'
}
