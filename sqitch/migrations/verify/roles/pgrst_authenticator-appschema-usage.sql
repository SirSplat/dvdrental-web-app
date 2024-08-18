-- Verify dvdrental:roles/pgrst_authenticator-appschema-usage on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege( 'pgrst_authenticator', 'rental', 'USAGE' );

ROLLBACK;
