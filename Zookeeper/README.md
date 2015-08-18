Dockerfile-zookeeper
=============================

Dockerfile For zookeeper

Usage:
```bash
docker run --privileged=true -d -p 2181:2181 -p 2888:2888 -p 3888:3888 \
 -e JVMFLAGS=-Xmx1g \
 -v /etc/localtime:/etc/localtime:ro \
 -v /opt/docker-volumes/zookeeper/conf:/opt/zookeeper/conf \
 -v /opt/docker-volumes/zookeeper/log:/opt/zookeeper/log \
 -v /opt/docker-volumes/zookeeper/zdata:/opt/zookeeper/zdata \
 --name zookeeper wjw465150/zookeeper
```
