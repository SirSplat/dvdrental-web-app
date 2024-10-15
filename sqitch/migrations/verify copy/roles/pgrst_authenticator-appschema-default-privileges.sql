-- Verify dvdrental:roles/pgrst_authenticator-appschema-default-privileges on pg

BEGIN;

SELECT
    1 / COUNT( pg_roles.rolname )
FROM
    pg_catalog.pg_default_acl
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_default_acl.defaclnamespace AND
        pg_namespace.nspname = 'rental'
    )
    LEFT JOIN LATERAL pg_catalog.aclexplode( pg_default_acl.defaclacl ) AS a ON ( a.privilege_type = 'SELECT' ) -- true
    LEFT JOIN pg_catalog.pg_roles ON (
        pg_roles.oid = a.grantee AND
        pg_roles.rolname = 'pgrst_authenticator'
    );

ROLLBACK;
