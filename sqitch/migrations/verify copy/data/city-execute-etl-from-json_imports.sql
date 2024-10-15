-- Verify dvdrental:data/city-execute-etl-from-json_imports on pg

BEGIN;

DO
$$
DECLARE
    expected_country_count INT := 164;
    expected_load_count INT := 34485;
    loaded_load_count INT := 0;
    loaded_country_count INT := 0;
BEGIN
    SELECT
        COUNT( * ) AS load_count,
        COUNT( DISTINCT country_fk ) AS country_count
    FROM
        rental.city
    INTO
        loaded_load_count,
        loaded_country_count;

    ASSERT loaded_load_count = expected_load_count, 'Incorrect number of rows in rental.city.';
    ASSERT loaded_country_count = expected_country_count, 'Incorrect number of distinct country codes in rental.city.';
END;
$$;

COMMIT;