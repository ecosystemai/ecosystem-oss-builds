#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER jupyterhub;
	CREATE DATABASE jupyterhub_users;
	GRANT ALL PRIVILEGES ON DATABASE jupyterhub_users TO jupyterhub;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER superset;
	CREATE DATABASE superset_meta;
	GRANT ALL PRIVILEGES ON DATABASE superset_meta TO superset;
EOSQL