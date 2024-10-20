-- Verify dvdrental:triggers/language_audit_columns_trg on pg

BEGIN;

SELECT
    1 / COUNT( pg_trigger.tgname )
FROM
    pg_catalog.pg_trigger
WHERE
    pg_trigger.tgname = 'language_audit_columns_trg';

SELECT
    1 / COUNT( pg_catalog.obj_description( pg_trigger.oid, 'pg_trigger' ) )
FROM
    pg_catalog.pg_trigger
WHERE
    pg_trigger.tgname = 'language_audit_columns_trg';

COMMIT;