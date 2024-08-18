-- Deploy dvdrental:tables/json_imports-create to pg
-- requires: appschema

BEGIN;

CREATE TABLE rental.json_imports ( val json );
COMMENT ON TABLE rental.json_imports IS 'Landing table for json data to be processed by ETL ie. country, language etc...';
COMMENT ON COLUMN rental.json_imports.val IS 'JSON data, to be processed by ETL';

COMMIT;
