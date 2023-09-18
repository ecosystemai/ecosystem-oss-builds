docker stop superset && docker rm superset 

docker run -d -p 8080:8088 \
   --name superset --net-alias superset --network ecosystem \
   --env SUPERSET_WEBSERVER_TIMEOUT=800 \
   --env SUPERSET_TIMEOUT=800 \
   --env SUPERSET_HOME=/home \
   --env SECRET_KEY=76598540-83c3-4b74-a9bb-4571535a526c \
   --env SUPERSET_SECRET_KEY=76598540-83c3-4b74-a9bb-4571535a526c \
   -v /Users/jayvanzyl/Documents/Projects/ecosystem-ai-next/ecosystem-server/dependencies/ecosystem-unix-starter/data/ecosystem-unix-starter/superset-master/data:/home \
   -v /Users/jayvanzyl/Desktop/customer.ecosystem.ai/superset-master/data:/data \
   ecosystemai/ecosystem-superset

export FILE=~/Documents/Projects/ecosystem-ai-next/ecosystem-server/dependencies/ecosystem-unix-starter/data/ecosystem-unix-starter/superset-master/data/superset.db
if [ -f "$FILE" ]; then
   echo "Existing Superset database: $FILE"
else
   echo "Setting up new admin user and password."
   docker exec -it superset superset fab create-admin \
               --username admin@ecosystem.ai \
               --firstname Ecosystem \
               --lastname Admin \
               --email admin@ecosystem.ai \
               --password cd486be3-9955-4364-8ccc-a9ab3ffbc168
fi

docker exec -it superset superset db upgrade
docker exec -it superset superset init


# docker exec -it superset superset load_examples
