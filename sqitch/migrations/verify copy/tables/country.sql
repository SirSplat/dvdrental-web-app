-- Verify dvdrental:tables/country on pg

BEGIN;

SELECT
    1 / COUNT( tables.table_name )
FROM
    information_schema.tables
WHERE
    tables.table_schema = 'rental' AND
    tables.table_name = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_class.oid, 'pg_class' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.col_description( pg_class.oid, pg_attribute.attnum ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_attribute ON (
        pg_attribute.attrelid = pg_class.oid AND
        pg_attribute.attnum > 0 AND
        pg_attribute.attname = 'country_code'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.col_description( pg_class.oid, pg_attribute.attnum ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_attribute ON (
        pg_attribute.attrelid = pg_class.oid AND
        pg_attribute.attnum > 0 AND
        pg_attribute.attname = 'iso2'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.col_description( pg_class.oid, pg_attribute.attnum ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_attribute ON (
        pg_attribute.attrelid = pg_class.oid AND
        pg_attribute.attnum > 0 AND
        pg_attribute.attname = 'iso3'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.col_description( pg_class.oid, pg_attribute.attnum ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_attribute ON (
        pg_attribute.attrelid = pg_class.oid AND
        pg_attribute.attnum > 0 AND
        pg_attribute.attname = 'country_name'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'p' AND
        pg_constraint.conname = 'country_pk'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'c' AND
        pg_constraint.conname = 'country_iso2_length_chk'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'c' AND
        pg_constraint.conname = 'country_iso2_not_empty_chk'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'c' AND
        pg_constraint.conname = 'country_iso3_length_chk'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'c' AND
        pg_constraint.conname = 'country_iso3_not_empty_chk'
    )
WHERE
    pg_class.relname = 'country';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_constraint.oid, 'pg_constraint' ) )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace AND
        pg_namespace.nspname = 'rental'
    )
    JOIN pg_catalog.pg_constraint ON (
        pg_constraint.conrelid = pg_class.oid AND
        pg_constraint.connamespace = pg_namespace.oid AND
        pg_constraint.contype = 'c' AND
        pg_constraint.conname = 'country_name_not_empty_chk'
    )
WHERE
    pg_class.relname = 'country';

ROLLBACK;
