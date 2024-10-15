-- Revert dvdrental:tables/lkp_global_region from pg

BEGIN;

DROP TABLE dsa.lkp_global_region;

COMMIT;
