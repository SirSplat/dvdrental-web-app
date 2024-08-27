-- Verify dvdrental:data/global_sub_region-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    expected_region_count INT := 5;
    expected_subregion_count INT := 23;
    load_count INT := 0;
BEGIN
    SELECT
        COALESCE( COUNT( DISTINCT region_code ), 0 )
    FROM
        dsa.global_sub_region
    INTO
        load_count;

    ASSERT load_count = expected_region_count, 'Incorrect number of rows in dsa.global_sub_region.';

    SELECT
        COALESCE( COUNT( DISTINCT subregion_code ), 0 )
    FROM
        dsa.global_sub_region
    INTO
        load_count;

    ASSERT load_count = expected_subregion_count, 'Incorrect number of subregions in dsa.global_sub_region.';
END;
$$;

ROLLBACK;
