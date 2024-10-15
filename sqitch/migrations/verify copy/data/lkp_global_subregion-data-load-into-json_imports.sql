-- Verify dvdrental:data/lkp_global_subregion on pg

BEGIN;

DO
$$
DECLARE
    expected_region_count INT := 5;
    expected_subregion_count INT := 23;
    json_count INT := 0;
BEGIN
    SELECT
        COUNT( DISTINCT val->>'region_iso2' )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count = expected_region_count, 'Incorrect number of regions in dsa.json_imports.';

    SELECT
        COUNT( DISTINCT val->>'subregion_code' )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count = expected_subregion_count, 'Incorrect number of subregion codes in dsa.json_imports.';

    SELECT
        COUNT( DISTINCT val->>'subregion_name' )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count = expected_subregion_count, 'Incorrect number of subregions names in dsa.json_imports.';
END;
$$;

ROLLBACK;
