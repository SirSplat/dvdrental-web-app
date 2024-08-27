-- Deploy dvdrental:functions/global_sub_region-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/global_region
-- requires: tables/global_sub_region

BEGIN;

CREATE OR REPLACE FUNCTION dsa.global_sub_region_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    FOR _rec IN
        SELECT
            ( val->>'region_code' )::TEXT AS region_code,
            ( subregion->>'subregion_name' )::TEXT AS subregion_name,
            ( subregion->>'subregion_code' )::SMALLINT AS subregion_code
        FROM
            dsa.json_imports,
            json_array_elements(val->'subregions') as subregion
    LOOP
        INSERT INTO dsa.global_sub_region (
            region_code,
            subregion_code,
            subregion_name
        ) VALUES (
            _rec.region_code,
            _rec.subregion_code,
            _rec.subregion_name
        );
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
