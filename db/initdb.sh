#!/bin/bash
set -e

psql -v ON_ERROR_STP=1 --username "dbo" --dbname "dvdrental" <<-ESQL

ESQL

