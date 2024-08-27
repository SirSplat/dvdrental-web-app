-- Verify dvdrental:data/country-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    expected_subregion_count INT := 16;
    expected_country_count INT := 195;
    expected_load_count INT := 195;
    loaded_load_count INT := 0;
    loaded_subregion_count INT := 0;
    loaded_country_count INT := 0;
BEGIN
    SELECT
        COUNT( * ) AS load_count,
        COUNT( DISTINCT subregion_fk ) AS subregion_count,
        COUNT( DISTINCT country_code ) AS country_count
    FROM
        rental.country
    INTO
        loaded_load_count,
        loaded_subregion_count,
        loaded_country_count;

    ASSERT loaded_load_count = expected_load_count, 'Incorrect number of rows in rental.country.';
    ASSERT loaded_subregion_count = expected_subregion_count, 'Incorrect number of distinct subregion codes in rental.country.';
    ASSERT loaded_country_count = expected_country_count, 'Incorrect number of distinct country codes in rental.country.';
END;
$$;

ROLLBACK;
