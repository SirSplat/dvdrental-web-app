-- Verify dvdrental:data/address-data-load-into-json_imports on pg

BEGIN;

DO
$$
DECLARE
    json_count INTEGER := 0;
    country_count INTEGER := 0;
    city_count INTEGER := 0;
    postal_code_count INTEGER := 0;

BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count > 0, 'No data found in dsa.json_imports.';

    SELECT
        COUNT( val->>'country_name' ),
        COUNT( val->>'city_name' ),
        COUNT( val->>'postal_code' )
    FROM
        dsa.json_imports
    INTO
        country_count,
        city_count,
        postal_code_count;

    ASSERT country_count = json_count, 'Duplicate country_name found in dsa.json_imports.';
    ASSERT city_count = json_count, 'Duplicate city_name found in dsa.json_imports.';
    ASSERT postal_code_count = json_count, 'Duplicate postal_code found in dsa.json_imports.';
    
END;
$$;

ROLLBACK;
