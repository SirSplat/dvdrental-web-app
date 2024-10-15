-- Deploy dvdrental:functions/language-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: appschema
-- requires: tables/language

BEGIN;

CREATE OR REPLACE FUNCTION dsa.kanguage_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    select 1;
    -- FOR _rec IN
    --     SELECT
    --         subregion.subregion_fk AS subregion_fk,
    --         ( val->>'country_code' )::SMALLINT AS country_code,
    --         ( val->>'iso2' )::TEXT AS iso2,
    --         ( val->>'iso3' )::TEXT AS iso3,
    --         ( val->>'country_name' )::TEXT AS country_name
    --     FROM
    --         dsa.json_imports
    --         JOIN dsa.lkp_global_subregion AS subregion ON (
    --             subregion.subregion_code = ( val->>'sub-region-code' )::SMALLINT
    --         )
    -- LOOP
    --     INSERT INTO rental.country (
    --         subregion_fk,
    --         country_code,
    --         iso2,
    --         iso3,
    --         country_name
    --     ) VALUES (
    --         _rec.subregion_fk,
    --         _rec.country_code,
    --         _rec.iso2,
    --         _rec.iso3,
    --         _rec.country_name
    --     );
    -- END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
