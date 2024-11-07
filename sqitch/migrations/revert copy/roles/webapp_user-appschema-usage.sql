-- Revoke dvdrental:roles/webapp_user-appschema-usage to pg

BEGIN;

REVOKE ALL ON SCHEMA dvdrental FROM webapp_user;

COMMIT;
