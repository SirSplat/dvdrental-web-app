-- Deploy dvdrental:tables/lkp_global_subregion to pg
-- requires: dsaschema
-- requires: tables/lkp_global_region

BEGIN;

CREATE TABLE dsa.lkp_global_subregion (
    subregion_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    region_fk SMALLINT NOT NULL,
    subregion_code SMALLINT NOT NULL,
    subregion_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING COMMENTS INCLUDING DEFAULTS,
    CONSTRAINT lkp_global_subregion_fk UNIQUE ( subregion_fk ),
    CONSTRAINT lkp_global_subregion_pkey PRIMARY KEY ( region_fk, subregion_code ),
    CONSTRAINT lkp_global_subregion_region_fk FOREIGN KEY ( region_fk ) REFERENCES dsa.lkp_global_region ( region_fk ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT lkp_global_subregion_code_not_empty_chk CHECK ( subregion_code <> 0 ),
    CONSTRAINT lkp_global_subregion_name_not_empty_chk CHECK ( BTRIM( subregion_name ) <> '' )
);

COMMENT ON TABLE dsa.lkp_global_subregion IS 'Subregions of the world';

COMMENT ON COLUMN dsa.lkp_global_subregion.subregion_fk IS 'Foreign key for lkp_global_subregion';
COMMENT ON COLUMN dsa.lkp_global_subregion.region_fk IS 'Foreign key for lkp_global_region';
COMMENT ON COLUMN dsa.lkp_global_subregion.subregion_code IS 'ISO 3166-2 alpha-2 subregion code';
COMMENT ON COLUMN dsa.lkp_global_subregion.subregion_name IS 'Name of the subregion';

COMMENT ON CONSTRAINT lkp_global_subregion_fk ON dsa.lkp_global_subregion IS 'Unique constraint on dsa.lkp_global_subregion';
COMMENT ON CONSTRAINT lkp_global_subregion_pkey ON dsa.lkp_global_subregion IS 'Primary key constraint on dsa.lkp_global_subregion';
COMMENT ON CONSTRAINT lkp_global_subregion_region_fk ON dsa.lkp_global_subregion IS 'Foreign key constraint on dsa.lkp_global_subregion to dsa.lkp_global_region.region_fk';
COMMENT ON CONSTRAINT lkp_global_subregion_code_not_empty_chk ON dsa.lkp_global_subregion IS 'Check constraint on dsa.lkp_global_subregion';
COMMENT ON CONSTRAINT lkp_global_subregion_name_not_empty_chk ON dsa.lkp_global_subregion IS 'Check constraint on dsa.lkp_global_subregion';

COMMIT;
