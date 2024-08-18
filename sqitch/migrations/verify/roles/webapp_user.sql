-- Verify dvdrental:roles/webapp_user on pg

BEGIN;

SELECT
    1 / COUNT( pg_roles.rolname )
FROM
    pg_catalog.pg_roles
WHERE
    pg_roles.rolname = 'webapp_user';

ROLLBACK;
