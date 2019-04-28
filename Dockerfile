#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#centquant
#maintainance <chen.bin@uxsoft.com>
# Pull base image.
#Use the local images of ubuntu 14.04
FROM ubuntu:16.04

# Install MongoDB. 4.0.9

RUN \
  apt-get update && \
  apt-key update && \
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
  echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
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
