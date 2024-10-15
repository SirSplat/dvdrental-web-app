-- Verify dvdrental:data/city-execute-populate-function-data-into-json_imports on pg

BEGIN;

DO
$$
DECLARE
    json_count INTEGER := 0;
    city_count INTEGER := 0;
    iso2_count INTEGER := 0;
    iso3_count INTEGER := 0;
    country_count INTEGER := 0;

BEGIN
    SELECT
        COALESCE( COUNT (* ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count > 0, 'No data found in dsa.json_imports.';
    
    SELECT
        COUNT( DISTINCT val->>'country_code' ),
        COUNT( DISTINCT val->>'iso2' ),
        COUNT( DISTINCT val->>'iso3' ),
        COUNT( DISTINCT val->>'city_name' )
    FROM
        dsa.json_imports
    INTO
        city_count,
        iso2_count,
        iso3_count;

    ASSERT iso2_count != country_count, 'Duplicate iso2 found in dsa.json_imports.';
    ASSERT iso3_count != country_count, 'Duplicate iso3 found in dsa.json_imports.';
    ASSERT city_count != json_count, 'Duplicate city found in dsa.json_imports.';
END;
$$;

ROLLBACK;
