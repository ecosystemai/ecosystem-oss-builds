docker run --name ecosystem-postgres -p 5432:5432 -e POSTGRES_PASSWORD=password -v postgres.conf:/etc/postgresql/postgresql.conf -e PGDATA=/var/lib/postgresql/data/pgdata -v "C:/Users/Ramsay/Documents/GitHub/ecosystem-workers/ecosystem-postgres/postgres_data:/var/lib/postgresql/data" -d --network ecosystem --net-alias ecosystem-postgres ecosystemai/ecosystem-postgres