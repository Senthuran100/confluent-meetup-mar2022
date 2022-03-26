#!/bin/bash

#stop java app
pkill -f 'java.*customer-data-sink'

docker-compose down
