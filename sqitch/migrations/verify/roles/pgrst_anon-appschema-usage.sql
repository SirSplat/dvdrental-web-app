-- Verify dvdrental:roles/pgrst_anon-appschema-usage on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege( 'pgrst_anon', 'rental', 'USAGE' );

ROLLBACK;
