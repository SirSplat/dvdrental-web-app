-- Deploy dvdrental:data/lkp_global_subregion-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region
-- requires: tables/lkp_global_subregion
-- requires: functions/lkp_global_subregion-etl-from-json_imports

BEGIN;

SELECT dsa.lkp_global_subregion_etl_from_json_imports();

COMMIT;
