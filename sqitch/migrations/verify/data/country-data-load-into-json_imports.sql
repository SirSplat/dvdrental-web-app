-- Verify dvdrental:data/country_initial_load on pg

BEGIN;

DO
$$
DECLARE
    json_count INT := 0;
    country_name_count INT := 0;
    iso2_count INT := 0;
    iso3_count INT := 0;
    country_code_count INT := 0;
BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count > 0, 'No data found in dsa.json_imports.';

    SELECT
        COUNT(DISTINCT val->>'country_name'),
        COUNT(DISTINCT val->>'iso2'),
        COUNT(DISTINCT val->>'iso3'),
        COUNT(DISTINCT val->>'country_code')
    FROM
        dsa.json_imports
    INTO
        country_name_count,
        iso2_count,
        iso3_count,
        country_code_count;

    ASSERT country_name_count = json_count, 'Duplicate country names found in dsa.json_imports.';
    ASSERT iso2_count = json_count, 'Duplicate iso2 found in dsa.json_imports.';
    ASSERT iso3_count = json_count, 'Duplicate iso3 found in dsa.json_imports.';
    ASSERT country_code_count = json_count, 'Duplicate country_code found in dsa.json_imports.';
END;
$$;

ROLLBACK;
