-- Deploy dvdrental:data/lkp_global_region-data-load-into-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
INSERT INTO dsa.json_imports ( val ) VALUES
    ('{
        "region_name": "Africa",
        "region_code": "AF"
    }'),
    ('{
        "region_name": "Americas",
        "region_code": "AM"
    }'),
    ('{
        "region_name": "Asia",
        "region_code": "AS"
    }'),
    ('{
        "region_name": "Europe",
        "region_code": "EU"
    }'),
    ('{
        "region_name": "Oceania",
        "region_code": "OC"
    }'),
    ('{
        "region_name": "Antarctica",
        "region_code": "AQ"
    }');

COMMIT;
