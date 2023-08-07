docker run --rm -it -p 8084:8084 \
   --net-alias ecosystem-worker-presto --network ecosystem --name ecosystem-worker-presto \
   -v /Users/jayvanzyl/Documents/Projects/ecosystem-ai-next/ecosystem-server/dependencies/ecosystem-unix-starter/ecosystem-unix-starter/30-run-presto/etc:/app/etc \
   ecosystemai/ecosystem-worker-presto
