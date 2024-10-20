-- Verify dvdrental:data/lkp_global_region on pg

BEGIN;

DO
$$
DECLARE
    expected_count INT := 5;
    json_count INT := 0;
    region_name_count INT := 0;
    region_code_count INT := 0;
    region_iso2_count INT := 0;

BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count = expected_count, 'Incorrect number of rows in dsa.json_imports.';

    SELECT
        COUNT(DISTINCT val->>'region_name'),
        COUNT(DISTINCT val->>'region_code'),
        COUNT(DISTINCT val->>'region_iso2')
    FROM
        dsa.json_imports
    INTO
        region_name_count,
        region_code_count,
        region_iso2_count;

    ASSERT region_name_count = expected_count, 'Incorrect number of distinct region names in dsa.json_imports.';
    ASSERT region_code_count = expected_count, 'Incorrect number of distinct region codes in dsa.json_imports.';
    ASSERT region_iso2_count = expected_count, 'Incorrect number of distinct region iso2 codes in dsa.json_imports.';

END;
$$;

ROLLBACK;
