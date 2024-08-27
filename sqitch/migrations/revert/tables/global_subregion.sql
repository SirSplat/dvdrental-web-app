-- Revert dvdrental:tables/global_subregion from pg

BEGIN;

DROP TABLE dsa.global_subregion;

COMMIT;
