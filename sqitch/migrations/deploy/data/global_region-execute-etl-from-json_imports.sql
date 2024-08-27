-- Deploy dvdrental:data/global_region-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/global_region
-- requires: functions/global_region-etl-from-json_imports

BEGIN;

SELECT dsa.global_region_etl_from_json_imports();

COMMIT;
