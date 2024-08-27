-- Verify dvdrental:data/global_sub_region on pg

BEGIN;

DO
$$
DECLARE
    expected_count INT := 5;
    expected_subregion_count INT := 23;
    json_count INT := 0;
BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count = expected_count, 'Incorrect number of rows in dsa.json_imports.';

    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports,
        LATERAL json_array_elements( val->'subregions' )
    INTO
        json_count;

    ASSERT json_count = expected_subregion_count, 'Incorrect number of subregions in dsa.json_imports.';
END;
$$;

ROLLBACK;
