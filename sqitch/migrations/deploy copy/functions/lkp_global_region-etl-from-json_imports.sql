-- Deploy dvdrental:functions/lkp_global_region-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region

BEGIN;

CREATE OR REPLACE FUNCTION dsa.lkp_global_region_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    FOR _rec IN
        SELECT
            ( val->>'region_name' )::TEXT AS region_name,
            ( val->>'region_code' )::SMALLINT AS region_code,
            ( val->>'region_iso2' )::TEXT AS region_iso2
        FROM
            dsa.json_imports
    LOOP
        INSERT INTO dsa.lkp_global_region (
            region_name,
            region_code,
            region_iso2
        ) VALUES (
            _rec.region_name,
            _rec.region_code,
            _rec.region_iso2
        );
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
