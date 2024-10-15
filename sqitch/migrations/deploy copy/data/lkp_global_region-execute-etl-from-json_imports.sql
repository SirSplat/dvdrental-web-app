-- Deploy dvdrental:data/lkp_global_region-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region
-- requires: functions/lkp_global_region-etl-from-json_imports

BEGIN;

SELECT dsa.lkp_global_region_etl_from_json_imports();

COMMIT;
