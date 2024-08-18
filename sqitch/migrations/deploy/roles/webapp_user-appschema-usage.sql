-- Deploy dvdrental:roles/webapp_user-appschema-usage to pg
-- requires: appschema
-- requires: roles/webapp_user

BEGIN;

GRANT USAGE ON SCHEMA rental TO webapp_user;

COMMIT;
