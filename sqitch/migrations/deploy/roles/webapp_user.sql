-- Deploy dvdrental:roles/webapp_user to pg

BEGIN;

CREATE ROLE webapp_user WITH LOGIN PASSWORD 'mysecretpassword';

COMMIT;
