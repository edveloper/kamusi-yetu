export type CountyLanguagePresence = {
  countyCode: string
  countyName: string
  region: 'coast' | 'north-eastern' | 'eastern' | 'central' | 'rift-valley' | 'western' | 'nyanza' | 'nairobi'
  primaryLanguageCode?: string
  languageCodes: string[]
  note?: string
}

// Curated first-pass county language presence for Trending.
// This is representative, not exhaustive, and should not be treated as a
// demographic or political ownership map.
export const COUNTY_LANGUAGE_PRESENCE: CountyLanguagePresence[] = [
  { countyCode: 'mom', countyName: 'Mombasa', region: 'coast', primaryLanguageCode: 'sw', languageCodes: ['sw', 'dig', 'x-sheng'], note: 'Coastal multilingual hub with strong Swahili presence and urban language mixing.' },
  { countyCode: 'kwl', countyName: 'Kwale', region: 'coast', primaryLanguageCode: 'dig', languageCodes: ['dig', 'sw', 'dug'], note: 'Digo is strongly present alongside Kiswahili and other coastal speech communities.' },
  { countyCode: 'kil', countyName: 'Kilifi', region: 'coast', primaryLanguageCode: 'nyf', languageCodes: ['nyf', 'coh', 'rra', 'sw'], note: 'Mijikenda communities dominate, with Giriama especially prominent in the county.' },
  { countyCode: 'trv', countyName: 'Tana River', region: 'coast', primaryLanguageCode: 'orc', languageCodes: ['orc', 'x-ke-pok', 'sw'], note: 'Orma and Pokomo are both important in this riverine county.' },
  { countyCode: 'lam', countyName: 'Lamu', region: 'coast', primaryLanguageCode: 'sw', languageCodes: ['sw', 'bob'], note: 'Swahili remains central, with Aweer heritage also relevant in the region.' },
  { countyCode: 'trt', countyName: 'Taita-Taveta', region: 'coast', primaryLanguageCode: 'dav', languageCodes: ['dav', 'tvs', 'sw'], note: 'Taita and Taveta communities shape the county’s linguistic identity.' },
  { countyCode: 'grs', countyName: 'Garissa', region: 'north-eastern', primaryLanguageCode: 'som', languageCodes: ['som', 'sw', 'en'], note: 'Somali is a major community language in the county.' },
  { countyCode: 'wjr', countyName: 'Wajir', region: 'north-eastern', primaryLanguageCode: 'som', languageCodes: ['som', 'orm', 'sw'], note: 'Somali is dominant, with Oromo presence in some areas.' },
  { countyCode: 'mdr', countyName: 'Mandera', region: 'north-eastern', primaryLanguageCode: 'som', languageCodes: ['som', 'orm', 'sw'], note: 'Cross-border Somali language presence is strong.' },
  { countyCode: 'mrs', countyName: 'Marsabit', region: 'eastern', primaryLanguageCode: 'orm', languageCodes: ['orm', 'rel', 'saq', 'elo'], note: 'Borana Oromo, Rendille, Samburu, and El Molo presence intersect in northern Kenya.' },
  { countyCode: 'isi', countyName: 'Isiolo', region: 'eastern', primaryLanguageCode: 'orm', languageCodes: ['orm', 'saq', 'sw'], note: 'A multilingual pastoral corridor with Oromo and Samburu influence.' },
  { countyCode: 'mru', countyName: 'Meru', region: 'eastern', primaryLanguageCode: 'mer', languageCodes: ['mer', 'ebu', 'ki'], note: 'Meru language is central, with Embu and Kikuyu influence near county edges.' },
  { countyCode: 'thr', countyName: 'Tharaka-Nithi', region: 'eastern', primaryLanguageCode: 'mer', languageCodes: ['mer', 'sw', 'en'], note: 'Meru-linked speech communities remain important in this county.' },
  { countyCode: 'emb', countyName: 'Embu', region: 'eastern', primaryLanguageCode: 'ebu', languageCodes: ['ebu', 'ki', 'kam'], note: 'Kiembu is central, with Kikuyu and Kamba influence nearby.' },
  { countyCode: 'ktu', countyName: 'Kitui', region: 'eastern', primaryLanguageCode: 'kam', languageCodes: ['kam', 'sw', 'en'], note: 'Kamba is the main local language in much of the county.' },
  { countyCode: 'mku', countyName: 'Machakos', region: 'eastern', primaryLanguageCode: 'kam', languageCodes: ['kam', 'sw', 'x-sheng'], note: 'Kamba remains strong, with urban multilingual influence growing.' },
  { countyCode: 'mak', countyName: 'Makueni', region: 'eastern', primaryLanguageCode: 'kam', languageCodes: ['kam', 'sw', 'en'], note: 'Kamba is a major community language throughout the county.' },
  { countyCode: 'nyd', countyName: 'Nyandarua', region: 'central', primaryLanguageCode: 'ki', languageCodes: ['ki', 'sw', 'en'], note: 'Kikuyu has strong presence in this central highlands county.' },
  { countyCode: 'nri', countyName: 'Nyeri', region: 'central', primaryLanguageCode: 'ki', languageCodes: ['ki', 'sw', 'en'], note: 'Kikuyu language and culture are strongly rooted here.' },
  { countyCode: 'krg', countyName: 'Kirinyaga', region: 'central', primaryLanguageCode: 'ki', languageCodes: ['ki', 'sw', 'en'], note: 'Kirinyaga remains one of the heartlands of Kikuyu speech.' },
  { countyCode: 'mur', countyName: 'Muranga', region: 'central', primaryLanguageCode: 'ki', languageCodes: ['ki', 'sw', 'x-sheng'], note: 'Kikuyu is dominant, with growing urban and peri-urban language mixing.' },
  { countyCode: 'kmb', countyName: 'Kiambu', region: 'central', primaryLanguageCode: 'ki', languageCodes: ['ki', 'sw', 'x-sheng', 'en'], note: 'Kikuyu remains foundational, but urban multilingualism is strong.' },
  { countyCode: 'trk', countyName: 'Turkana', region: 'rift-valley', primaryLanguageCode: 'x-ke-trk', languageCodes: ['x-ke-trk', 'sw', 'en'], note: 'Turkana is the major community language across much of the county.' },
  { countyCode: 'wpk', countyName: 'West Pokot', region: 'rift-valley', primaryLanguageCode: 'pko', languageCodes: ['pko', 'sw', 'kal'], note: 'Pokot is central, with wider Kalenjin and national-language influence.' },
  { countyCode: 'skr', countyName: 'Samburu', region: 'rift-valley', primaryLanguageCode: 'saq', languageCodes: ['saq', 'sw', 'en'], note: 'Samburu language remains a key pastoral community language.' },
  { countyCode: 'tnz', countyName: 'Trans Nzoia', region: 'rift-valley', primaryLanguageCode: 'bxk', languageCodes: ['bxk', 'spy', 'sw'], note: 'Bukusu and Sabaot are both important in this agriculturally rich county.' },
  { countyCode: 'uas', countyName: 'Uasin Gishu', region: 'rift-valley', primaryLanguageCode: 'niq', languageCodes: ['niq', 'sgc', 'sw'], note: 'Nandi and Kipsigis are both significant Kalenjin subgroup languages here.' },
  { countyCode: 'elg', countyName: 'Elgeyo-Marakwet', region: 'rift-valley', primaryLanguageCode: 'enb', languageCodes: ['enb', 'eyo', 'kal'], note: 'Markweeta and Keiyo heritage are especially relevant in this county.' },
  { countyCode: 'nan', countyName: 'Nandi', region: 'rift-valley', primaryLanguageCode: 'niq', languageCodes: ['niq', 'sgc', 'sw'], note: 'Nandi is strongly rooted here, alongside broader Kalenjin identity.' },
  { countyCode: 'bar', countyName: 'Baringo', region: 'rift-valley', primaryLanguageCode: 'tuy', languageCodes: ['tuy', 'pko', 'kal'], note: 'Tugen is especially important, with Pokot and Kalenjin umbrella identity also relevant.' },
  { countyCode: 'lak', countyName: 'Laikipia', region: 'rift-valley', primaryLanguageCode: 'ki', languageCodes: ['ki', 'saq', 'sw'], note: 'A mixed county with central Kenyan, pastoral, and national-language influence.' },
  { countyCode: 'nak', countyName: 'Nakuru', region: 'rift-valley', primaryLanguageCode: 'sgc', languageCodes: ['sgc', 'ki', 'sw', 'x-sheng'], note: 'Highly mixed county with strong Kipsigis, Kikuyu, and urban language presence.' },
  { countyCode: 'nrv', countyName: 'Narok', region: 'rift-valley', primaryLanguageCode: 'mas', languageCodes: ['mas', 'sw', 'en'], note: 'Maa remains a key language of identity across large parts of the county.' },
  { countyCode: 'kaj', countyName: 'Kajiado', region: 'rift-valley', primaryLanguageCode: 'mas', languageCodes: ['mas', 'sw', 'x-sheng'], note: 'Maasai language remains important alongside strong Nairobi spillover multilingualism.' },
  { countyCode: 'ker', countyName: 'Kericho', region: 'rift-valley', primaryLanguageCode: 'sgc', languageCodes: ['sgc', 'sw', 'en'], note: 'Kipsigis has especially strong presence in Kericho.' },
  { countyCode: 'bom', countyName: 'Bomet', region: 'rift-valley', primaryLanguageCode: 'sgc', languageCodes: ['sgc', 'sw', 'en'], note: 'Kipsigis is a major language of daily life in the county.' },
  { countyCode: 'kak', countyName: 'Kakamega', region: 'western', primaryLanguageCode: 'luy', languageCodes: ['luy', 'lto', 'rag', 'lks'], note: 'The county is part of the wider Luhya cluster and includes several subgroup communities.' },
  { countyCode: 'vga', countyName: 'Vihiga', region: 'western', primaryLanguageCode: 'rag', languageCodes: ['rag', 'ida', 'luy'], note: 'Logooli and Idakho-Isukha-Tiriki-related speech communities are important here.' },
  { countyCode: 'bgm', countyName: 'Bungoma', region: 'western', primaryLanguageCode: 'bxk', languageCodes: ['bxk', 'lts', 'spy', 'luy'], note: 'Bukusu is especially prominent, with Tachoni and Sabaot influence near county edges.' },
  { countyCode: 'bsi', countyName: 'Busia', region: 'western', primaryLanguageCode: 'lsm', languageCodes: ['lsm', 'luy', 'sw'], note: 'Samia and other Luhya-linked communities shape the county’s linguistic life.' },
  { countyCode: 'smy', countyName: 'Siaya', region: 'nyanza', primaryLanguageCode: 'luo', languageCodes: ['luo', 'sxb', 'sw'], note: 'Dholuo is central, with Suba-linked communities also part of the county landscape.' },
  { countyCode: 'ksm', countyName: 'Kisumu', region: 'nyanza', primaryLanguageCode: 'luo', languageCodes: ['luo', 'sxb', 'sw', 'x-sheng'], note: 'Dholuo and Kiswahili are both strong, especially in urban and lakeside settings.' },
  { countyCode: 'hmb', countyName: 'Homa Bay', region: 'nyanza', primaryLanguageCode: 'luo', languageCodes: ['luo', 'sxb', 'sw'], note: 'Dholuo remains dominant, with Suba communities especially significant around the lake and islands.' },
  { countyCode: 'mig', countyName: 'Migori', region: 'nyanza', primaryLanguageCode: 'x-ke-kur', languageCodes: ['x-ke-kur', 'luo', 'sxb', 'sw'], note: 'Kuria is important in the county, alongside Dholuo and Suba-linked communities.' },
  { countyCode: 'kis', countyName: 'Kisii', region: 'nyanza', primaryLanguageCode: 'guz', languageCodes: ['guz', 'sw', 'en'], note: 'Ekegusii is a major language of county identity and daily life.' },
  { countyCode: 'nmr', countyName: 'Nyamira', region: 'nyanza', primaryLanguageCode: 'guz', languageCodes: ['guz', 'sw', 'en'], note: 'Ekegusii is strongly present here as well.' },
  { countyCode: 'nbr', countyName: 'Nairobi', region: 'nairobi', primaryLanguageCode: 'sw', languageCodes: ['sw', 'en', 'x-sheng', 'ki', 'kam', 'luo'], note: 'National urban multilingual hub where Kiswahili, English, Sheng, and many home languages intersect.' },
]

export function getCountyLanguagePresence(countyCode: string) {
  return COUNTY_LANGUAGE_PRESENCE.find((county) => county.countyCode === countyCode)
}
