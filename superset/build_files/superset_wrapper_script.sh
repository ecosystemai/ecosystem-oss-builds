#!/bin/bash
# export PGPASSWORD='password'
# if [ "$( psql -p 5432 -h ecosystem-postgres -U postgres -XtAc "SELECT 1 FROM pg_database WHERE datname='superset_meta'" )" = '1' ]
# then
#     echo "Database superset_meta already exists."
# else
#     echo "Database superset_meta does not exist."
#     echo "Setting up default superset_meta database."    
# 	psql -p 5432 -h ecosystem-postgres -U postgres -c 'create database superset_meta with owner postgres;'
# 	psql -p 5432 -h ecosystem-postgres -U postgres superset_meta < /app/superset_meta.sql
# fi

sh /usr/bin/run-server.sh