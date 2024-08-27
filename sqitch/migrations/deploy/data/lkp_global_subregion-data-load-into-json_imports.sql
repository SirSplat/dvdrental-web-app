-- Deploy dvdrental:data/lkp_global_subregion to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
INSERT INTO dsa.json_imports ( val ) VALUES
    ('{
        "region_code": "AF",
        "subregions": [
            {
                "subregion_name": "Northern Africa",
                "subregion_code": "015"
            },
            {
                "subregion_name": "Sub-Saharan Africa",
                "subregion_code": "202"
            },
            {
                "subregion_name": "Eastern Africa",
                "subregion_code": "014"
            },
            {
                "subregion_name": "Western Africa",
                "subregion_code": "011"
            },
            {
                "subregion_name": "Middle Africa",
                "subregion_code": "017"
            },
            {
                "subregion_name": "Southern Africa",
                "subregion_code": "018"
            }
        ]
    }'),
    ('{
        "region_code": "AM",
        "subregions": [
            {
                "subregion_name": "Northern America",
                "subregion_code": "021"
            },
            {
                "subregion_name": "Central America",
                "subregion_code": "013"
            },
            {
                "subregion_name": "Caribbean",
                "subregion_code": "029"
            },
            {
                "subregion_name": "South America",
                "subregion_code": "005"
            }
        ]
    }'),
    ('{
        "region_code": "AS",
        "subregions": [
            {
                "subregion_name": "Central Asia",
                "subregion_code": "143"
            },
            {
                "subregion_name": "Eastern Asia",
                "subregion_code": "030"
            },
            {
                "subregion_name": "South-Eastern Asia",
                "subregion_code": "035"
            },
            {
                "subregion_name": "Southern Asia",
                "subregion_code": "034"
            },
            {
                "subregion_name": "Western Asia",
                "subregion_code": "145"
            }
        ]
    }'),
    ('{
        "region_code": "EU",
        "subregions": [
            {
                "subregion_name": "Northern Europe",
                "subregion_code": "154"
            },
            {
                "subregion_name": "Southern Europe",
                "subregion_code": "039"
            },
            {
                "subregion_name": "Eastern Europe",
                "subregion_code": "151"
            },
            {
                "subregion_name": "Western Europe",
                "subregion_code": "155"
            }
        ]
    }'),
    ('{
        "region_code": "OC",
        "subregions": [
            {
                "subregion_name": "Australia and New Zealand",
                "subregion_code": "053"
            },
            {
                "subregion_name": "Melanesia",
                "subregion_code": "054"
            },
            {
                "subregion_name": "Micronesia",
                "subregion_code": "057"
            },
            {
                "subregion_name": "Polynesia",
                "subregion_code": "061"
            }
        ]
    }');
    -- ('{
    --     "region_code": "AQ",
    --     "subregions": [
    --         {
    --             "subregion_name": "Antarctica",
    --             "subregion_code": "AQ"
    --         }
    --     ]
    -- }');

COMMIT;
