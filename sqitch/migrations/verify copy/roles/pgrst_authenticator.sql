-- Verify dvdrental:roles/pgrst_authenticator on pg

BEGIN;

SELECT
    1 / COUNT( pg_roles.rolname )
FROM
    pg_catalog.pg_roles
WHERE
    pg_roles.rolname = 'pgrst_authenticator';

SELECT
    1 / COUNT(  pg_catalog.shobj_description( pg_roles.oid, 'pg_authid' ) )
FROM
    pg_catalog.pg_roles
WHERE
    pg_roles.rolname = 'pgrst_authenticator';

ROLLBACK;
