#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#centquant
#maintainance <chen.bin@uxsoft.com>
# Pull base image.
#Use the local images of ubuntu 14.04
FROM ubuntu:14.04

# Install MongoDB.

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
#VOLUME ["/data/db"]
#RUN mkdir -p /data/db no need

# Define working directory.
WORKDIR /

# Expose ports for each Mongo replica set instance
EXPOSE 27017

# Copy required files over to container
COPY conf/ /conf/
COPY start.sh /start.sh

# Run start shell when container launches
CMD ["sh", "start.sh"]
