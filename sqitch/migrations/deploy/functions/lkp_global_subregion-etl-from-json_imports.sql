-- Deploy dvdrental:functions/lkp_global_subregion-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region
-- requires: tables/lkp_global_subregion

BEGIN;

CREATE OR REPLACE FUNCTION dsa.lkp_global_subregion_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    FOR _rec IN
        SELECT
            region.region_fk AS region_fk,
            ( subregion->>'subregion_name' )::TEXT AS subregion_name,
            ( subregion->>'subregion_code' )::SMALLINT AS subregion_code
        FROM
            dsa.json_imports
            JOIN dsa.lkp_global_region AS region ON (
                region.region_iso2 = ( json_imports.val->>'region_iso2' )::TEXT
            ),
            json_array_elements(val->'subregions') AS subregion
    LOOP
        INSERT INTO dsa.lkp_global_subregion (
            region_fk,
            subregion_code,
            subregion_name
        ) VALUES (
            _rec.region_fk,
            _rec.subregion_code,
            _rec.subregion_name
        );
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
