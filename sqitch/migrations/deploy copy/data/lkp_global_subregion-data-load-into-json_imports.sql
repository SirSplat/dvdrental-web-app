-- Deploy dvdrental:data/lkp_global_subregion to pg
-- requires: dsaschema
-- requires: tables/json_imports

BEGIN;

TRUNCATE TABLE dsa.json_imports;
\COPY dsa.json_imports ( val ) FROM '/mnt/input/lkp_global-subregions.txt';

COMMIT;
