#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#centquant
#maintainance <chen.bin@uxsoft.com>
# Pull base image.
FROM ubuntu:latest

# Install MongoDB.

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install gnupg -y

RUN cd /source/  wget "https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.0/multiverse/binary-amd64/mongodb-org-server_4.0.9_amd64.deb"

RUN dpkg -i  mongodb-org-server_4.0.9_amd64.deb


# Define mountable directories.
#VOLUME ["/data/db"]
RUN mkdir -p /data/da

# Define working directory.
WORKDIR /

# Expose ports for each Mongo replica set instance
EXPOSE 27017

# Copy required files over to container
COPY conf/ /conf/
COPY start.sh /start.sh

# Run start shell when container launches
CMD ["sh", "start.sh"]
