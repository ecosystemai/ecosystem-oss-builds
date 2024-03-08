# ecosystem_server
# presto://ecosystem-worker-presto:8084/local

# when there's a fresh install, the following directories need to be created
mkdir -p ecosystem_superset/postgres/pg_notify
mkdir -p ecosystem_superset/postgres/pg_tblspc  
mkdir -p ecosystem_superset/postgres/pg_twophase
mkdir -p ecosystem_superset/postgres/pg_xact
mkdir -p ecosystem_superset/postgres/pg_stat_tmp
mkdir -p ecosystem_superset/postgres/pg_replslot
mkdir -p ecosystem_superset/postgres/pg_serial
mkdir -p ecosystem_superset/postgres/pg_snapshots
mkdir -p ecosystem_superset/postgres/pg_subtrans
mkdir -p ecosystem_superset/postgres/pg_logical
mkdir -p ecosystem_superset/postgres/pg_logical/snapshots
mkdir -p ecosystem_superset/postgres/pg_logical/mappings
mkdir -p ecosystem_superset/postgres/pg_logical/replorigin
mkdir -p ecosystem_superset/postgres/pg_logical/replorigin_checkpoint
mkdir -p ecosystem_superset/postgres/pg_stat
mkdir -p ecosystem_superset/postgres/pg_multixact
mkdir -p ecosystem_superset/postgres/pg_commit_ts
mkdir -p ecosystem_superset/postgres/pg_clog
mkdir -p ecosystem_superset/postgres/pg_dynshmem
mkdir -p ecosystem_superset/postgres/pg_notify

docker network create ecosystem
docker compose -f docker-compose--superset-presto-ecosystem.yml down
docker compose -f docker-compose--superset-presto-ecosystem.yml pull
docker compose -f docker-compose--superset-presto-ecosystem.yml up -d
