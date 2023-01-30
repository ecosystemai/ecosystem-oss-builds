docker run -t -p 5432:5432 \
   --name ecosystem-postgres --network ecosystem --net-alias ecosystem-postgres \
   -e POSTGRES_PASSWORD=password \
   -v postgres.conf:/etc/postgresql/postgresql.conf \
   -e PGDATA=/var/lib/postgresql/data/pgdata \
   -v ~/data/postgres_data:/var/lib/postgresql/data \
   ecosystemai/ecosystem-postgres
