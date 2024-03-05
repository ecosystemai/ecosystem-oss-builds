# ecosystem_server
# presto://ecosystem-worker-presto:8084/local

docker network create ecosystem
docker compose -f docker-compose--superset-presto-ecosystem.yml down
docker compose -f docker-compose--superset-presto-ecosystem.yml pull
docker compose -f docker-compose--superset-presto-ecosystem.yml up -d
