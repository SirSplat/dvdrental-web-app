# DSA Schema
docker compose exec sqitch sqitch add dsa-schema/dsa db --template create-schema \
-s schemaname=dsa \
-s schemacomment='Home of all things ETL.' \
-m 'Add dsa schema. Home of all things ETL.'

docker compose exec sqitch sqitch add dsa-schema/tables/json_imports db --template create-table \
-s schemaname=dsa \
-s schemacomment='Home of all things ETL.' \
-s tablename=json_imports \
-s tablecomment='Table to store JSON for use by ETL functions.' \
-s columnname=payload \
-s columntype=json \
-s columncomment='Data in json format to be consumed by ETL functions.' \
-m 'Add dsa.json_imports containing a single json column. Used by ETL functions.'

# App Schema
docker compose exec sqitch sqitch add rental-schema/rental db --template create-schema \
-s schemaname=rental \
-s schemacomment='Home of all things rental.' \
-m 'Add rental schema. Home of all things rental.'

# Audit table columns
docker compose exec sqitch sqitch add tables/ db --template create-table \
-r appschema \
-s schemaname=rental -s tablename=audit_columns -s tablecomment='Audit table containing standardized audit columns that must be included in all rental tables.' \
-s columnname=created_at -s columntype='TIMESTAMP WITH TIME ZONE' -s columnconstraint='DEFAULT clock_timestamp()' -s columncomment='Date and time the row was created.' \
-s columnname=updated_at -s columntype='TIMESTAMP WITH TIME ZONE' -s columnconstraint=NULL -s columncomment='Date and time the row was last updated.' \
-s columnname=deleted_at -s columntype='TIMESTAMP WITH TIME ZONE' -s columnconstraint=NULL -s columncomment='Date and time the row was deleted.' \
-s columnname=created_by -s columntype='TEXT' -s columnconstraint='DEFAULT current_user' -s columncomment='User who created the row.' \
-s columnname=updated_by -s columntype='TEXT' -s columnconstraint=NULL -s columncomment='User who last updated the row.' \
-s columnname=deleted_by -s columntype='TEXT' -s columnconstraint=NULL -s columncomment='User who deleted the row.' \
-m 'Add rental.audit_columns table containing standardized audit columns that must be included in all rental tables.'

# Normal table
docker compose exec sqitch sqitch add tables/ db --template create-table \
-r appschema -r tables/country -r dsaschema -r tables/json_imports \
-s schemaname=rental -s tablename=normal_table -s tablecomment='Test normal table create-table.tmpl.' \
-s columnname=city_fk -s columntype=IDENTITY -s columncomment='City foreign key lookup.' \
-s columnname=country_code -s columntype='SMALLINT NOT NULL' -s columncomment='Used for foreign key from rental.city.country_code to rental.country.country_code.' \
-s columnname=city_name -s columntype='TEXT NOT NULL' -s columncomment='City name.' \
-s tableconstraint=city_pk -s constrainttype='PRIMARY KEY' -s constraintdefinition='country_code, city_name' -s constraintcomment='Primary key on city.' \
-s tableconstraint=city_country_code_fk -s constrainttype='FOREIGN KEY' -s constraintdefinition='( country_code ) REFERENCES rental.country ( country_code )' -s constraintcomment='Foreign key from city.country_code to country.country_code.' \
-s tableconstraint=city_name_not_empty_chk -s constrainttype=CHECK -s constraintdefinition="COALESCE( city_name, '' ) <> ''" -s constraintcomment='City name must not be NULL or empty.' \
-m 'Test normal table create-table.tmpl.'

# Partitioned table
docker compose exec sqitch sqitch add tables/test_partitioned_table db --template create-table
-r appschema -r tables/country -r dsaschema -r tables/json_imports
-s schemaname=rental -s tablename=test_partitioned_table -s tablecomment='Add rental.city table.'
-s columnname=city_fk -s columntype=IDENTITY -s columncomment='City foreign key lookup.'
-s columnname=country_code -s columntype='SMALLINT NOT NULL' -s columncomment='Used for foreign key from rental.city.country_code to rental.country.country_code.'
-s columnname=city_name -s columntype='TEXT NOT NULL' -s columncomment='City name.'
-s partitiontype=LIST -s partitiondefinition=country_code
-s tableconstraint=city_pk -s constrainttype='PRIMARY KEY' -s constraintdefinition='country_code, city_name' -s constraintcomment='Primary key on city.'
-s tableconstraint=city_country_code_fk -s constrainttype='FOREIGN KEY' -s constraintdefinition='( country_code ) REFERENCES rental.country ( country_code )' -s constraintcomment='Foreign key from city.country_code to country.country_code.'
-s tableconstraint=city_name_not_empty_chk -s constrainttype=CHECK -s constraintdefinition="COALESCE( city_name, '' ) <> ''" -s constraintcomment='City name must not be NULL or empty.'
-m 'Add rental.city partitioned table.'

docker compose exec sqitch sqitch add tables/city db --template create-table -r appschema -r tables/country -r dsaschema -r tables/json_imports -s schemaname=rental -s tablename=city -s tablecomment='Add rental.city table.' -s columnname=city_fk -s columntype=IDENTITY -s columncomment='City foreign key lookup.' -s columnname=country_code -s columntype='SMALLINT NOT NULL' -s columncomment='Used for foreign key from rental.city.country_code to rental.country.country_code.' -s columnname=city_name -s columntype='TEXT NOT NULL' -s columncomment='City name.' -s partitiontype=LIST -s partitiondefinition=country_code -s tableconstraint=city_pk -s constrainttype='PRIMARY KEY' -s constraintdefinition='country_code, city_name' -s constraintcomment='Primary key on city.' -s tableconstraint=city_country_code_fk -s constrainttype='FOREIGN KEY' -s constraintdefinition='( country_code ) REFERENCES rental.country ( country_code )' -s constraintcomment='Foreign key from city.country_code to country.country_code.' -s tableconstraint=city_name_not_empty_chk -s constrainttype=CHECK -s constraintdefinition="COALESCE( city_name, '' ) <> ''" -s constraintcomment='City name must not be NULL or empty.' -m 'Add rental.city partitioned table.'

# Table partitions
docker compose exec sqitch sqitch add tables/partitions/city/city_default db --template create-table
-r appschema -r tables/country -r tables/city -r dsaschema -r tables/json_imports
-s schemaname=rental -s tablename=city_default -s tablecomment='Add rental.city_default partition for rental.city table. This partition should never contain any data.'
-s partitionofschemaname=rental -s partitionoftablename=city -s partitionofcolumnname=country_code
-m 'Add rental.city_default partition table.'

docker compose exec sqitch sqitch add tables/partitions/city/city_default db --template create-table -r appschema -r tables/country -r tables/city -r dsaschema -r tables/json_imports -s schemaname=rental -s tablename=city_default -s tablecomment='Add rental.city_default partition for rental.city table. This partition should never contain any data.' -s partitionofschemaname=rental -s partitionoftablename=city -s partitionofcolumnname=country_code -m 'Add rental.city_default partition table.'


-s partitiontype=LIST -s partitiondefinition=country_code

#-s tableconstraint=city_pk -s constrainttype='PRIMARY KEY' -s constraintdefinition='country_code, city_name' -s constraintcomment='Primary key on city.'
#-s tableconstraint=city_country_code_fk -s constrainttype='FOREIGN KEY' -s constraintdefinition='( country_code ) REFERENCES rental.country ( country_code )' -s constraintcomment='Foreign key from city.country_code to country.country_code.'
#-s tableconstraint=city_name_not_empty_chk -s constrainttype=CHECK -s constraintdefinition="COALESCE( city_name, '' ) <> ''" -s constraintcomment='City name must not be NULL or empty.'




# # Deployment and Rollback.
#     # Do this stuff by hand!
# MVP / POC
# # Initial scope -> logical db to it's own cluster
# # Sqitch & pgtap


