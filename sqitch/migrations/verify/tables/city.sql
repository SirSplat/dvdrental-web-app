-- Verify dvdrental:tables/city on pg

BEGIN;

SELECT
    1 / COUNT( tables.table_name )
FROM
    information_schema.tables
WHERE
    tables.table_schema = 'rental' AND
    tables.table_name = 'city';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_class.oid, 'pg_class' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
WHERE
    pg_class.relname = 'city';

ROLLBACK;
