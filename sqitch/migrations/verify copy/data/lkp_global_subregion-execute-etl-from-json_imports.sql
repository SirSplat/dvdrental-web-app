-- Verify dvdrental:data/lkp_global_subregion-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    expected_region_count INT := 5;
    expected_subregion_count INT := 23;
    load_count INT := 0;
BEGIN
    SELECT
        COUNT( DISTINCT region_fk )
    FROM
        dsa.lkp_global_subregion
    INTO
        load_count;

    ASSERT load_count = expected_region_count, 'Incorrect number of regions in dsa.lkp_global_subregion.';

    SELECT
        COALESCE( COUNT( DISTINCT subregion_code ), 0 )
    FROM
        dsa.lkp_global_subregion
    INTO
        load_count;

    ASSERT load_count = expected_subregion_count, 'Incorrect number of subregion codes in dsa.lkp_global_subregion.';

    SELECT
        COALESCE( COUNT( DISTINCT subregion_name ), 0 )
    FROM
        dsa.lkp_global_subregion
    INTO
        load_count;

    ASSERT load_count = expected_subregion_count, 'Incorrect number of subregion names in dsa.lkp_global_subregion.';
END;
$$;

ROLLBACK;
