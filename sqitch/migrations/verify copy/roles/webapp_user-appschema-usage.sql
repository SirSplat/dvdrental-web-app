-- Verify dvdrental:roles/webapp_user-appschema-usage on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege( 'webapp_user', 'rental', 'USAGE' );

ROLLBACK;
