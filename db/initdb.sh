#!/bin/bash
set -e

psql -v ON_ERROR_STP=1 --username "dbo" --dbname "dvdrental" <<-ESQL
    CREATE SCHEMA dsa;
    COMMENT ON SCHEMA dsa IS 'Home of all things ETL.';

    CREATE SCHEMA rental;
    COMMENT ON SCHEMA rental IS 'Home of all things application.';

    CREATE ROLE pgrst_authenticator WITH LOGIN ENCRYPTED PASSWORD '${POSTGREST_DB_PASSWORD}';
    GRANT USAGE ON SCHEMA rental TO pgrst_authenticator;
    ALTER DEFULT PRIVILEGES IN SCHEMA rental GRANT SELECT ON TABLES TO pgrst_authenticator;
    COMMENT ON ROLE pgrst_authenticator IS 'Role for PostgREST';

    CREATE ROLE pgrst_anon WITH NOLOGIN;
    GRANT USAGE ON SCHEMA rental TO pgrst_anon;
    ALTER DEFULT PRIVILEGES IN SCHEMA rental GRANT SELECT ON TABLES TO pgrst_anon;
    COMMENT ON ROLE pgrst_anon IS 'Role for PostgREST anonymous users';
ESQL

