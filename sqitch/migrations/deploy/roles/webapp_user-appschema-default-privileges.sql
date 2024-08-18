-- Deploy dvdrental:roles/webapp_user-appschema-default-privileges to pg
-- requires: appschema
-- requires: roles/webapp_user-appschema-usage

BEGIN;

ALTER DEFAULT PRIVILEGES
    FOR ROLE dbo
    IN SCHEMA rental
    GRANT
        SELECT,
        INSERT,
        DELETE,
        UPDATE
    ON TABLES
    TO webapp_user;

COMMIT;
