-- Revert dvdrental:roles/webapp_user from pg

BEGIN;

DROP ROLE webapp_user;

COMMIT;
