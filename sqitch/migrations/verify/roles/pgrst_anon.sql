-- Verify dvdrental:roles/pgrst_anon on pg

BEGIN;

SELECT
    1 / COUNT( pg_roles.rolname )
FROM
    pg_catalog.pg_roles
WHERE
    pg_roles.rolname = 'pgrst_anon';

ROLLBACK;
