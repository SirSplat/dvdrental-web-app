-- Verify dvdrental:data/country-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    expected_row_count INTEGER := 213;
    loaded_row_count INTEGER := 0;
    loaded_country_code_count INTEGER := 0;
    loaded_iso2_count INTEGER := 0;
    loaded_iso3_count INTEGER := 0;
    loaded_country_name_count INTEGER := 0;
BEGIN
    SELECT
        COUNT(*),
        COUNT( DISTINCT country_code ),
        COUNT( DISTINCT iso2 ),
        COUNT( DISTINCT iso3 ),
        COUNT( DISTINCT country_name )
    FROM
        rental.country
    INTO
        loaded_row_count,
        loaded_country_code_count,
        loaded_iso2_count,
        loaded_iso3_count,
        loaded_country_name_count;

    ASSERT loaded_row_count = expected_row_count, 'Incorrect number of rows in rental.country.';
    ASSERT loaded_country_code_count = expected_row_count, 'Incorrect number of country codes in rental.country.';
    ASSERT loaded_iso2_count = expected_row_count, 'Incorrect number of iso2 codes in rental.country.';
    ASSERT loaded_iso3_count = expected_row_count, 'Incorrect number of iso3 codes in rental.country.';
    ASSERT loaded_country_name_count = expected_row_count, 'Incorrect number of country names in rental.country.';
END;
$$;

ROLLBACK;
