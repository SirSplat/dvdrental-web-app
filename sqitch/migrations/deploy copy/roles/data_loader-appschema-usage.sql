-- Deploy dvdrental:roles/data_loader-appschema-usage to pg
-- requires: appschema
-- requires: roles/data_loader

BEGIN;

GRANT USAGE ON SCHEMA rental TO data_loader;

COMMIT;
