-- Deploy dvdrental:roles/webapp_user to pg

BEGIN;

CREATE ROLE webapp_user WITH LOGIN PASSWORD 'mysecretpassword';
COMMENT ON ROLE webapp_user IS 'Role for web application access to the database.';

COMMIT;
