-- Deploy dvdrental:data/global_subregion-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/global_region
-- requires: tables/global_subregion
-- requires: functions/global_subregion-etl-from-json_imports

BEGIN;

SELECT dsa.global_subregion_etl_from_json_imports();

COMMIT;
