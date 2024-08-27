-- Revert dvdrental:tables/lkp_global_subregion from pg

BEGIN;

DROP TABLE dsa.lkp_global_subregion;

COMMIT;
