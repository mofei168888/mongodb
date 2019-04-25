#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir /data/db/db-001

# Run mongo replica sets using config files
mongod --config /conf/mongo.conf


# Run mongo as the running process, this is required to keep the docker process running
mongo