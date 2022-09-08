docker run --rm -it -p 8084:8084 --net-alias ecosystem-worker-presto --network ecosystem \
   -v ~/ecosystem-unix-starter/04_config_ecosystem_presto/etc:/app/etc \
   ecosystemai/ecosystem-worker-presto
