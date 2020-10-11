# need to specify schema before running this script. Example: export SCHEMA=public
# need to specify database before running this script. Example export DB=postgres
# need to specify connection string  before running this script. Example export CONN=postgres://postgres:password@35.223.122.146:5432/postgres
 

psql $CONN -Atc "select tablename from pg_tables where schemaname='$SCHEMA'" $DB |\
  while read TBL; do
    psql $CONN -c "COPY (SELECT * FROM $SCHEMA.$TBL) TO STDOUT WITH CSV HEADER" $DB > $TBL.csv
  done
