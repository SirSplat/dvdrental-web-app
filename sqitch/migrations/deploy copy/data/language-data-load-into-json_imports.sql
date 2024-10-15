-- Deploy dvdrental:data/language-data-load-into-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
INSERT INTO dsa.json_imports ( val ) VALUES
    ('{
        "iso2": "en",
        "iso3": "eng",
        "language_name": "English"
    }'),
    ('{
        "iso2": "zh",
        "iso3": "zho",
        "language_name": "Chinese"
    }'),
    ('{
        "iso2": "hi",
        "iso3": "hin",
        "language_name": "Hindi"
    }'),
    ('{
        "iso2": "es",
        "iso3": "spa",
        "language_name": "Spanish"
    }'),
    ('{
        "iso2": "ar",
        "iso3": "ara",
        "language_name": "Arabic"
    }'),
    ('{
        "iso2": "bn",
        "iso3": "ben",
        "language_name": "Bengali"
    }'),
    ('{
        "iso2": "pt",
        "iso3": "por",
        "language_name": "Portuguese"
    }'),
    ('{
        "iso2": "ru",
        "iso3": "rus",
        "language_name": "Russian"
    }'),
    ('{
        "iso2": "ja",
        "iso3": "jpn",
        "language_name": "Japanese"
    }'),
    ('{
        "iso2": "de",
        "iso3": "deu",
        "language_name": "German"
    }'),
    ('{
        "iso2": "ko",
        "iso3": "kor",
        "language_name": "Korean"
    }'),
    ('{
        "iso2": "fr",
        "iso3": "fra",
        "language_name": "French"
    }'),
    ('{
        "iso2": "ur",
        "iso3": "urd",
        "language_name": "Urdu"
    }'),
    ('{
        "iso2": "vi",
        "iso3": "vie",
        "language_name": "Vietnamese"
    }'),
    ('{
        "iso2": "te",
        "iso3": "tel",
        "language_name": "Telugu"
    }'),
    ('{
        "iso2": "tr",
        "iso3": "tur",
        "language_name": "Turkish"
    }'),
    ('{
        "iso2": "mr",
        "iso3": "mar",
        "language_name": "Marathi"
    }'),
    ('{
        "iso2": "it",
        "iso3": "ita",
        "language_name": "Italian"
    }'),
    ('{
        "iso2": "th",
        "iso3": "tha",
        "language_name": "Thai"
    }'),
    ('{
        "iso2": "gu",
        "iso3": "guj",
        "language_name": "Gujarati"
    }'),
    ('{
        "iso2": "pl",
        "iso3": "pol",
        "language_name": "Polish"
    }'),
    ('{
        "iso2": "pa",
        "iso3": "pan",
        "language_name": "Punjabi"
    }'),
    ('{
        "iso2": "ml",
        "iso3": "mal",
        "language_name": "Malayalam"
    }'),
    ('{
        "iso2": "kn",
        "iso3": "kan",
        "language_name": "Kannada"
    }'),
    ('{
        "iso2": "or",
        "iso3": "ori",
        "language_name": "Odia"
    }'),
    ('{
        "iso2": "my",
        "iso3": "mya",
        "language_name": "Burmese"
    }'),
    ('{
        "iso2": "ta",
        "iso3": "tam",
        "language_name": "Tamil"
    }'),
    ('{
        "iso2": "sw",
        "iso3": "swa",
        "language_name": "Swahili"
    }'),
    ('{
        "iso2": "am",
        "iso3": "amh",
        "language_name": "Amharic"
    }'),
    ('{
        "iso2": "ro",
        "iso3": "ron",
        "language_name": "Romanian"
    }'),
    ('{
        "iso2": "uk",
        "iso3": "ukr",
        "language_name": "Ukrainian"
    }'),
    ('{
        "iso2": "hu",
        "iso3": "hun",
        "language_name": "Hungarian"
    }'),
    ('{
        "iso2": "el",
        "iso3": "ell",
        "language_name": "Greek"
    }'),
    ('{
        "iso2": "nl",
        "iso3": "nld",
        "language_name": "Dutch"
    }'),
    ('{
        "iso2": "sv",
        "iso3": "swe",
        "language_name": "Swedish"
    }'),
    ('{
        "iso2": "fi",
        "iso3": "fin",
        "language_name": "Finnish"
    }'),
    ('{
        "iso2": "he",
        "iso3": "heb",
        "language_name": "Hebrew"
    }'),
    ('{
        "iso2": "cs",
        "iso3": "ces",
        "language_name": "Czech"
    }'),
    ('{
        "iso2": "no",
        "iso3": "nor",
        "language_name": "Norwegian"
    }'),
    ('{
        "iso2": "da",
        "iso3": "dan",
        "language_name": "Danish"
    }'),
    ('{
        "iso2": "bg",
        "iso3": "bul",
        "language_name": "Bulgarian"
    }'),
    ('{
        "iso2": "sk",
        "iso3": "slk",
        "language_name": "Slovak"
    }'),
    ('{
        "iso2": "sr",
        "iso3": "srp",
        "language_name": "Serbian"
    }'),
    ('{
        "iso2": "hr",
        "iso3": "hrv",
        "language_name": "Croatian"
    }'),
    ('{
        "iso2": "lt",
        "iso3": "lit",
        "language_name": "Lithuanian"
    }'),
    ('{
        "iso2": "lv",
        "iso3": "lav",
        "language_name": "Latvian"
    }'),
    ('{
        "iso2": "et",
        "iso3": "est",
        "language_name": "Estonian"
    }'),
    ('{
        "iso2": "gl",
        "iso3": "glg",
        "language_name": "Galician"
    }'),
    ('{
        "iso2": "ca",
        "iso3": "cat",
        "language_name": "Catalan"
    }'),
    ('{
        "iso2": "eu",
        "iso3": "eus",
        "language_name": "Basque"
    }'),
    ('{
        "iso2": "ga",
        "iso3": "gle",
        "language_name": "Irish"
    }'),
    ('{
        "iso2": "is",
        "iso3": "isl",
        "language_name": "Icelandic"
    }'),
    ('{
        "iso2": "mk",
        "iso3": "mkd",
        "language_name": "Macedonian"
    }'),
    ('{
        "iso2": "mt",
        "iso3": "mlt",
        "language_name": "Maltese"
    }'),
    ('{
        "iso2": "be",
        "iso3": "bel",
        "language_name": "Belarusian"
    }'),
    ('{
        "iso2": "sl",
        "iso3": "slv",
        "language_name": "Slovenian"
    }'),
    ('{
        "iso2": "hy",
        "iso3": "hye",
        "language_name": "Armenian"
    }'),
    ('{
        "iso2": "ka",
        "iso3": "kat",
        "language_name": "Georgian"
    }'),
    ('{
        "iso2": "az",
        "iso3": "aze",
        "language_name": "Azerbaijani"
    }'),
    ('{
        "iso2": "kk",
        "iso3": "kaz",
        "language_name": "Kazakh"
    }'),
    ('{
        "iso2": "ky",
        "iso3": "kir",
        "language_name": "Kyrgyz"
    }'),
    ('{
        "iso2": "tg",
        "iso3": "tgk",
        "language_name": "Tajik"
    }'),
    ('{
        "iso2": "uz",
        "iso3": "uzb",
        "language_name": "Uzbek"
    }'),
    ('{
        "iso2": "mn",
        "iso3": "mon",
        "language_name": "Mongolian"
    }'),
    ('{
        "iso2": "km",
        "iso3": "khm",
        "language_name": "Khmer"
    }'),
    ('{
        "iso2": "lo",
        "iso3": "lao",
        "language_name": "Lao"
    }'),
    ('{
        "iso2": "si",
        "iso3": "sin",
        "language_name": "Sinhala"
    }'),
    ('{
        "iso2": "ne",
        "iso3": "nep",
        "language_name": "Nepali"
    }'),
    ('{
        "iso2": "sd",
        "iso3": "snd",
        "language_name": "Sindhi"
    }'),
    ('{
        "iso2": "bo",
        "iso3": "bod",
        "language_name": "Tibetan"
    }'),
    ('{
        "iso2": "dz",
        "iso3": "dzo",
        "language_name": "Dzongkha"
    }'),
    ('{
        "iso2": "ps",
        "iso3": "pus",
        "language_name": "Pashto"
    }'),
    ('{
        "iso2": "fa",
        "iso3": "fas",
        "language_name": "Persian"
    }'),
    ('{
        "iso2": "ti",
        "iso3": "tir",
        "language_name": "Tigrinya"
    }'),
    ('{
        "iso2": "so",
        "iso3": "som",
        "language_name": "Somali"
    }'),
    ('{
        "iso2": "yo",
        "iso3": "yor",
        "language_name": "Yoruba"
    }'),
    ('{
        "iso2": "ig",
        "iso3": "ibo",
        "language_name": "Igbo"
    }'),
    ('{
        "iso2": "ha",
        "iso3": "hau",
        "language_name": "Hausa"
    }'),
    ('{
        "iso2": "zu",
        "iso3": "zul",
        "language_name": "Zulu"
    }'),
    ('{
        "iso2": "xh",
        "iso3": "xho",
        "language_name": "Xhosa"
    }'),
    ('{
        "iso2": "tn",
        "iso3": "tsn",
        "language_name": "Tswana"
    }'),
    ('{
        "iso2": "ss",
        "iso3": "ssw",
        "language_name": "Swati"
    }'),
    ('{
        "iso2": "st",
        "iso3": "sot",
        "language_name": "Sotho"
    }'),
    ('{
        "iso2": "ve",
        "iso3": "ven",
        "language_name": "Venda"
    }'),
    ('{
        "iso2": "ts",
        "iso3": "tso",
        "language_name": "Tsonga"
    }');

COMMIT;
