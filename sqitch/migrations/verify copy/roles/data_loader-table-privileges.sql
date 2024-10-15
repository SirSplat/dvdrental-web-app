-- Verify dvdrental:roles/data_loader-table-privileges on pg

BEGIN;

SELECT pg_catalog.has_table_privilege( 'data_loader', 'rental.country', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'rental.city', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'rental.address', 'SELECT, INSERT' );
SELECT pg_catalog.has_table_privilege( 'data_loader', 'rental.language', 'SELECT, INSERT' );

ROLLBACK;
