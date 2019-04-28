#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#centquant
#maintainance <chen.bin@uxsoft.com>
# Pull base image.
#Use the local images of ubuntu 14.04
FROM ubuntu:16.04

# Install MongoDB.

RUN \
  apt-get update && \
  apt-get install -y wget && \
  mkdir -p /data && \
  cd /data && \
  wget https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.0/multiverse/binary-amd64/mongodb-org-server_4.0.9_amd64.deb && \
  dpkg -i mongodb-org-server_4.0.9_amd64.deb && \
  apt-get install -f && \
  dpkg -i mongodb-org-server_4.0.9_amd64.deb && \
  wget https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.0/multiverse/binary-amd64/mongodb-org-shell_4.0.9_amd64.deb && \
  dpkg -i mongodb-org-shell_4.0.9_amd64.deb

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
