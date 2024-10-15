-- Deploy dvdrental:functions/city-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: appschema
-- requires: tables/country
-- requires: tables/city

BEGIN;

CREATE OR REPLACE FUNCTION dsa.city_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    FOR _rec IN
        SELECT DISTINCT
            country.country_fk AS country_fk,
            ( val->>'city_name' )::TEXT AS city_name
        FROM
            dsa.json_imports
            JOIN rental.country ON (
                country.country_name = ( val->>'country_name' )::TEXT AND
                country.iso2 = ( val->>'iso2' )::TEXT AND
                country.iso3 = ( val->>'iso3' )::TEXT
            )
    LOOP
        INSERT INTO rental.city (
            country_fk,
            city_name
        ) VALUES (
            _rec.country_fk,
            _rec.city_name
        );
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
