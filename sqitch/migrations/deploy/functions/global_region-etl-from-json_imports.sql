-- Deploy dvdrental:functions/global_region-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/global_region

BEGIN;

CREATE OR REPLACE FUNCTION dsa.global_region_etl_from_json_imports()
RETURNS VOID
AS $$
DECLARE
    _rec RECORD;
BEGIN
    FOR _rec IN
        SELECT
            ( val->>'region_name' )::TEXT AS region_name,
            ( val->>'region_code' )::TEXT AS region_code
        FROM
            dsa.json_imports
    LOOP
        INSERT INTO dsa.global_region (
            region_name,
            region_code
        ) VALUES (
            _rec.region_name,
            _rec.region_code
        );
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
