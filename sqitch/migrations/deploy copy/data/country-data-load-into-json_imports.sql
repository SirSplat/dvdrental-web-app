-- Deploy dvdrental:data/country-data-load-into-json_imports to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
\COPY dsa.json_imports (val) FROM '/mnt/input/region-subregion-country.txt';

COMMIT;
