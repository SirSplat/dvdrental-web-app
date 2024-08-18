-- Verify dvdrental:roles/webapp_user-member-of-pgrst_authenticator on pg

BEGIN;

SELECT
    1 / COUNT( pg_auth_members.member )
FROM
    pg_catalog.pg_auth_members
WHERE
    roleid::regrole::text = 'webapp_user' AND
    member::regrole::text = 'pgrst_authenticator';

ROLLBACK;
