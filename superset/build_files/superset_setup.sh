docker run -d -p 8080:8088 --name superset --network ecosystem -e CONFIG_PATH_ENV_VAR=/app/superset/superset_config.py ecosystemai/ecosystem-superset

# First run only Prepares database and creates default user.
# docker exec -it superset superset db upgrade
# docker exec -it superset superset init
# docker exec -it superset superset fab create-admin \
#              --username admin \
#              --firstname Superset \
#              --lastname Admin \
#              --email admin@superset.com \
#              --password admin