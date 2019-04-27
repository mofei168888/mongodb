#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir -p /data/db/db-001

# Run mongo replica sets using config files
mongod --config /conf/mongo.conf  --fork
