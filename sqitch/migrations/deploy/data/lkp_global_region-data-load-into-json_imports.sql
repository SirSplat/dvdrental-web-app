-- Deploy dvdrental:data/lkp_global_region-data-load-into-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
INSERT INTO dsa.json_imports ( val ) VALUES
    ('{
        "region_name": "Africa",
        "region_iso2": "AF",
        "region_code": "002"
    }'),
    ('{
        "region_name": "Americas",
        "region_iso2": "AM",
        "region_code": "019"
    }'),
    ('{
        "region_name": "Asia",
        "region_iso2": "AS",
        "region_code": "142"
    }'),
    ('{
        "region_name": "Europe",
        "region_iso2": "EU",
        "region_code": "150"
    }'),
    ('{
        "region_name": "Oceania",
        "region_iso2": "OC",
        "region_code": "009"
    }');

COMMIT;
