-- Deploy dvdrental:data/city-execute-etl-from-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports
-- requires: functions/city-etl-from-json_imports
-- requires: appschema
-- requires: tables/country
-- requires: tables/city

BEGIN;

SELECT * FROM dsa.city_etl_from_json_imports();

COMMIT;