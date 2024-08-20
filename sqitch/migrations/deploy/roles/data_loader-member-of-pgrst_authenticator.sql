-- Deploy dvdrental:roles/data_loader-member-of-pgrst_authenticator to pg
-- requires: appschema
-- requires: roles/data_loader
-- requires: roles/pgrst_authenticator

BEGIN;

GRANT data_loader TO pgrst_authenticator;

COMMIT;
