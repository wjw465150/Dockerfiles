#!/bin/sh

/opt/zookeeper/bin/zkServer.sh start

# infinite loop
while :; do echo "Running zookeeper ..."; sleep 5; done
