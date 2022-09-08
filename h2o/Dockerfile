# Dockerfile
#
# docker build -t ecosystemai/ecosystem-worker-h2o:3.37.0.5718 .
#
# docker push ecosystemai/ecosystem-worker-h2o:3.37.0.5718
#

FROM debian:stable

WORKDIR /app

COPY ./h2o-3.36.0.4 .

RUN apt-get update -y && \
    apt-get install -y libcurl4 && \
    apt-get install -y gettext-base && \
    apt-get install -y gnupg && \
    apt-get install -y openjdk-17-jre && \
    apt install -y gcc &&  \
    apt-get install -y python3-pip python-dev

RUN mkdir -p /data
RUN chmod -R 775 /data

COPY ./h2o-docker-start.sh ./h2o-docker-start.sh
COPY ./presto-jdbc-0.270.jar .
COPY ./h2o-3.36.0.4/mysql-connector-java-8.0.28.jar .

RUN chmod 755 *sh


EXPOSE 54321

# Run the Spring boot application
# ENTRYPOINT ["java", "-Xmx16g", "-cp", "app:/app/h2o.jar:/app/mysql-connector-java-8.0.28.jar","water.H2OApp", "-name", "ecosystem"]

ENTRYPOINT ["/bin/bash", "h2o-docker-start.sh"]

