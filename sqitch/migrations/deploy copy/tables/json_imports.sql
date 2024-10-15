-- Deploy dvdrental:tables/json_imports-create to pg
-- requires: dsaschema

BEGIN;

CREATE TABLE dsa.json_imports ( val json );
COMMENT ON TABLE dsa.json_imports IS 'Landing table for json data to be processed by ETL. Only accessable for dbo role.';
COMMENT ON COLUMN dsa.json_imports.val IS 'JSON data, to be processed by ETL';

COMMIT;
