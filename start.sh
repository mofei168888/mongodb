#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir -p /data/db/db-001
mkdir -p /path/to
apt-get update
apt-get install copy
copy conf/keyfile /path/to

# Run mongo replica sets using config files
mongod --config /conf/mongo.conf  --fork --auth


# Run mongo as the running process, this is required to keep the docker process running
