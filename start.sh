#!/bin/bash
#centquant mongodb Rep Set

# Create database directories
mkdir -p /data/db/db-001
mkdir -p /path/to
touch keyfile

# Run mongo replica sets using config files
mongod --config /conf/mongo.conf  --fork --bind_ip_all

# Run mongo as the running process, this is required to keep the docker process running
mongo
use admin
db.createUser(
  {
    user: "uxsoft",
    pwd: "soFt10",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }]
  }）
