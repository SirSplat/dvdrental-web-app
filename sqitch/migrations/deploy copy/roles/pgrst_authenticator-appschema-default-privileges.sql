-- Deploy dvdrental:roles/pgrst_authenticator-appschema-default-privileges to pg
-- requires: appschema
-- requires: roles/pgrst_anon
-- requires: roles/pgrst_authenticator-appschema-usage

BEGIN;

ALTER DEFAULT PRIVILEGES
    FOR ROLE dbo
    IN SCHEMA rental
    GRANT SELECT
    ON TABLES
    TO pgrst_authenticator;

COMMIT;
