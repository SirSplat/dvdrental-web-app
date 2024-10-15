-- Verify dvdrental:data/country_initial_load on pg

BEGIN;

DO
$$
DECLARE
    expected_row_count INTEGER := 213;
    expected_region_count INTEGER := 5;
    expected_subregion_count INTEGER := 21;
    expected_country_count INTEGER := 213;

    load_row_count INTEGER := 0;
    load_region_count INTEGER := 0;
    load_subregion_count INTEGER := 0;
    load_country_code_count INTEGER := 0;
    load_country_iso2_count INTEGER := 0;
    load_country_iso3_count INTEGER := 0;
    load_country_name_count INTEGER := 0;
BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        load_row_count;

    ASSERT load_row_count = expected_row_count, 'Incorrect number of rows found in dsa.json_imports.';

    SELECT
        COUNT( DISTINCT val->>'region_code' )
    FROM
        dsa.json_imports
    INTO
        load_region_count;

    ASSERT load_region_count = expected_region_count, 'Incorrect number of regions found in dsa.json_imports.';

    SELECT
        COUNT( DISTINCT val->>'subregion_code' )
    FROM
        dsa.json_imports
    INTO
        load_subregion_count;

    ASSERT load_subregion_count = expected_subregion_count, 'Incorrect number of subregions found in dsa.json_imports.';

    SELECT
        COUNT( DISTINCT val->>'country_name' ),
        COUNT( DISTINCT val->>'iso2' ),
        COUNT( DISTINCT val->>'iso3' ),
        COUNT( DISTINCT val->>'country_code' )
    FROM
        dsa.json_imports
    INTO
        load_country_name_count,
        load_country_iso2_count,
        load_country_iso3_count,
        load_country_code_count;

    ASSERT load_country_name_count = expected_country_count, 'Duplicate country names found in dsa.json_imports.';
    ASSERT load_country_iso2_count = expected_country_count, 'Duplicate iso2 found in dsa.json_imports.';
    ASSERT load_country_iso3_count = expected_country_count, 'Duplicate iso3 found in dsa.json_imports.';
    ASSERT load_country_code_count = expected_country_count, 'Duplicate country_code found in dsa.json_imports.';
END;
$$;

ROLLBACK;
