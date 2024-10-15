-- Revert dvdrental:roles/pgrst_authenticator from pg

BEGIN;

DROP ROLE pgrst_authenticator;

COMMIT;
