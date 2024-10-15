-- Deploy dvdrental:data/country-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: tables/lkp_global_region
-- requires: tables/lkp_global_subregion
-- requires: functions/country-etl-from-json_imports
-- requires: appschema
-- requires: tables/country

BEGIN;

SELECT * FROM dsa.country_etl_from_json_imports();

COMMIT;
