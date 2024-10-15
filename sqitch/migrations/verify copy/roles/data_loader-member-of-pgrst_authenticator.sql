-- Verify dvdrental:roles/data_loader-member-of-pgrst_authenticator on pg

BEGIN;

SELECT
    1 / COUNT( pg_auth_members.member )
FROM
    pg_catalog.pg_auth_members
WHERE
    roleid::regrole::text = 'data_loader' AND
    member::regrole::text = 'pgrst_authenticator';

ROLLBACK;
