-- Revoke dvdrental:roles/webapp_user-appschema-default-privileges to pg

BEGIN;

ALTER DEFAULT PRIVILEGES
    FOR ROLE dbo
    IN SCHEMA dvdrental
    REVOKE ALL PRIVILEGES
    ON TABLES
    FROM webapp_user;

COMMIT;
