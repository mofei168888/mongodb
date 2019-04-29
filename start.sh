#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir -p /data/db/db-001

# Run mongo replica sets using config files
mongod --config /conf/mongo.conf  --fork --bind_ip_all

# Run mongo as the running process, this is required to keep the docker process running
mongo