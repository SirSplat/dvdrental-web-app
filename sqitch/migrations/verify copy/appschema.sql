-- Verify dvdrental:appschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege( current_user, 'rental', 'USAGE' );

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_namespace.oid, 'pg_namespace' ) )
FROM
    pg_catalog.pg_namespace
WHERE
    pg_namespace.nspname = 'rental';

ROLLBACK;
