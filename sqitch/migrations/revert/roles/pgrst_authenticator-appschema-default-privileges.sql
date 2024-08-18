-- Revert dvdrental:roles/pgrst_authenticator-appschema-default-privileges from pg

BEGIN;

ALTER DEFAULT PRIVILEGES
    FOR ROLE dbo
    IN SCHEMA rental
    REVOKE ALL PRIVILEGES
    ON TABLES
    FROM pgrst_authenticator;

COMMIT;
