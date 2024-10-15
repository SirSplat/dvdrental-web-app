-- Revert dvdrental:functions/language-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.language_etl_from_json_imports();

COMMIT;
