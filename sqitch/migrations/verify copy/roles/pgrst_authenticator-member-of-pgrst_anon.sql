-- Verify dvdrental:roles/pgrst_authenticator-member-of-pgrst_anon on pg

BEGIN;

SELECT
    1 / COUNT( pg_auth_members.member )
FROM
    pg_catalog.pg_auth_members
WHERE
    roleid::regrole::text = 'pgrst_anon' AND
    member::regrole::text = 'pgrst_authenticator';

ROLLBACK;
