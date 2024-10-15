-- Revert dvdrental:roles/pgrst_anon from pg

BEGIN;

DROP ROLE pgrst_anon;

COMMIT;
