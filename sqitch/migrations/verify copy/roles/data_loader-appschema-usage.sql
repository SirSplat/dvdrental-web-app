-- Verify dvdrental:roles/data_loader-appschema-usage on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege( 'data_loader', 'rental', 'USAGE' );

ROLLBACK;
