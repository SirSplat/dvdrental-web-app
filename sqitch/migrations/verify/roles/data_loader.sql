-- Verify dvdrental:roles/data_loader on pg

BEGIN;

SELECT
    1 / COUNT( pg_roles.rolname )
FROM
    pg_catalog.pg_roles
WHERE
    pg_roles.rolname = 'data_loader';

ROLLBACK;
