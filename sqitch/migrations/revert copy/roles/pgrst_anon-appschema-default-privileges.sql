-- Revert dvdrental:roles/pgrst_anon-appschema-default-privileges from pg

BEGIN;

ALTER DEFAULT PRIVILEGES
    FOR ROLE dbo
    IN SCHEMA dvdrental
    REVOKE ALL PRIVILEGES
    ON TABLES
    FROM pgrst_anon;

COMMIT;
