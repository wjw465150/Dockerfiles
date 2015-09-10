#!/bin/sh

#echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
#echo "net.core.somaxconn = 1024" >> /etc/sysctl.conf
#sysctl -p

/opt/redis/bin/redis-server /opt/redis/db/redis.conf

# infinite loop
#while :; do echo "Running Hbase ..."; sleep 5; done
