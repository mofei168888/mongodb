#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir -p /data/db/db-001
#mkdir -p /path/to


# Run mongo replica sets using config files
mongod --config /conf/mongo.conf  --fork


# Run mongo as the running process, this is required to keep the docker process running
cd /var/log/mongodb/
ls -al
cat logpath=/var/log/mongodb/mongodb-db-001.log
mongo