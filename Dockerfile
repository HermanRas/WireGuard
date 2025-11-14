FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    docker.io 

RUN mkdir /opt/wg

COPY docker-compose.yml /opt/wg/docker-compose.yml
