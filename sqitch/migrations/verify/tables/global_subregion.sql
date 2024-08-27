-- Verify dvdrental:tables/global_subregion on pg

BEGIN;

SELECT
    1 / COUNT( tables.table_name )
FROM
    information_schema.tables
WHERE
    tables.table_schema = 'dsa' AND
    tables.table_name = 'global_subregion';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_class.oid, 'pg_class' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'dsa'
    )
WHERE
    pg_class.relname = 'global_subregion';

ROLLBACK;
