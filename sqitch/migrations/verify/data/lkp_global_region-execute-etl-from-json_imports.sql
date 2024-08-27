-- Verify dvdrental:data/lkp_global_region-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    json_count INT := 0;
    region_load_count INT := 0;
    region_iso2_count INT := 0;
    region_code_count INT := 0;

BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    SELECT
        COALESCE( COUNT( * ), 0 ),
        COUNT( DISTINCT region_iso2 ),
        COUNT( DISTINCT region_code )
    FROM
        dsa.lkp_global_region
    INTO
        region_load_count,
        region_iso2_count,
        region_code_count;

    ASSERT region_load_count = json_count, 'Incorrect number of rows in dsa.lkp_global_region.';
    ASSERT region_iso2_count = json_count, 'Incorrect number of distinct region iso2 codes in dsa.lkp_global_region.';
    ASSERT region_code_count = json_count, 'Incorrect number of distinct region codes in dsa.lkp_global_region.';

END;
$$;

ROLLBACK;
