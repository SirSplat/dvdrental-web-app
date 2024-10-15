-- Deploy dvdrental:roles/pgrst_anon-member-of-pgrst_authenticator to pg
-- requires: roles/pgrst_anon
-- requires: roles/pgrst_authenticator

BEGIN;

GRANT pgrst_anon TO pgrst_authenticator;

COMMIT;
