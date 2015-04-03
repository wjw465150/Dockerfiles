#
# zookeeper Dockerfile
#
# 

# Pull base image. 
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

RUN yum install -y java-1.7.0-openjdk wget tar && \
wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -zxvf - -C /opt && \
    mv /opt/zookeeper-3.4.6 /opt/zookeeper && \
    cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg && \
    mkdir -p /tmp/zookeeper

ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk.x86_64

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
