-- Deploy dvdrental:functions/country-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region
-- requires: tables/lkp_global_subregion
-- requires: appschema
-- requires: tables/country

BEGIN;

CREATE OR REPLACE FUNCTION dsa.country_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
--    INSERT INTO dsa.lkp_global_region (
--        region_code,
--        region_name,
--        region_iso2
--    )
--    SELECT DISTINCT
--        ( region.val->>'region_iso_numeric' )::SMALLINT AS region_code,
--        region.val->>'region_name' AS region_name,
--        region.val->>'region_code' AS region_iso2
--    FROM
--        dsa.json_imports AS region;
--
--    INSERT INTO dsa.lkp_global_subregion (
--        region_fk,
--        subregion_code,
--        subregion_name
--    )
--    SELECT DISTINCT
--        region.region_fk AS region_fk,
--        ( subregion.val->>'subregion_code' )::SMALLINT AS subregion_code,
--        subregion.val->>'subregion_name' AS subregion_name
--    FROM
--        dsa.json_imports AS subregion
--        JOIN dsa.lkp_global_region AS region ON (
--            region.region_code = ( subregion.val->>'region_iso_numeric' )::SMALLINT
--        );

/*
    May want to consider some sort of linking/mapping table between subregion
        and country at some point in the future
*/

    INSERT INTO rental.country (
        country_code,
        iso2,
        iso3,
        country_name
    )
    SELECT DISTINCT
        ( countries.val->>'country_code' )::SMALLINT AS country_code,
        countries.val->>'iso2' AS iso2,
        countries.val->>'iso3' AS iso3,
        countries.val->>'country_name' AS country_name
    FROM
        dsa.json_imports AS countries;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
