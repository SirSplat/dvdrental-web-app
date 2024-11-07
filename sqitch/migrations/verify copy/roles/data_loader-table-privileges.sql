-- Verify dvdrental:roles/data_loader-table-privileges on pg

BEGIN;

SELECT pg_catalog.has_table_privilege( 'data_loader', 'dvdrental.country', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'dvdrental.city', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'dvdrental.address', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'dvdrental.language', 'SELECT, INSERT' );

ROLLBACK;
