# Dockerfile
#

# FROM openjdk:11 

# WORKDIR /app

# COPY ./presto-server-0250 .

# RUN apt-get update && \
#     apt-get install libcurl4 -y && \
#     apt-get install -y wget && \
#     apt-get install -y gnupg && \
#     apt-get install -y locales

# RUN apt-get update -y && apt-get install -y python3-pip python-dev

# # RUN mkdir -p /data
# # RUN chmod -R 775 /data

# COPY ./presto-docker-start.sh ./presto-docker-start.sh
# RUN chmod 755 *sh

# EXPOSE 8084

# ENTRYPOINT ["/bin/bash", "presto-docker-start.sh"]


####################################################
FROM ubuntu:22.04
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y libcurl4 && \
    apt-get install -y wget && \
    apt-get install -y gettext-base && \
    apt-get install -y gnupg && \
    apt-get install -y default-jdk && \
    apt-get install -y python3-pip python3 python-is-python3 && \
    apt-get install -y nginx && \
    apt-get install -y openssh-server && \
    apt-get clean
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir requests && \
    apt update -y && apt upgrade -y

WORKDIR /app

COPY ./presto/presto-server-0.285.1 /app
COPY ./presto-docker-start.sh /app/presto-docker-start.sh
RUN chmod 755 *sh
EXPOSE 8084
ENTRYPOINT ["/bin/bash", "presto-docker-start.sh"]
