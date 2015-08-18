#
# zookeeper Dockerfile
#
# 

# Pull base image. 
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

ADD run.sh /run.sh

COPY ./jdk-7u76-linux-x64.rpm /opt/
COPY ./zookeeper.tar.gz /opt/

RUN yum install -y sed grep unzip tar wget file && \
  cd /opt/ && \
  rpm -ivh ./jdk-7u76-linux-x64.rpm && \
  tar -zxvf ./zookeeper.tar.gz && \
  chmod +x /opt/zookeeper/bin/*.sh && \
  rm -f /opt/zookeeper.tar.gz && \
  rm -f /opt/jdk-7u76-linux-x64.rpm && \
  chmod +x /run.sh
  
# Environment Variable
ENV JAVA_HOME /usr/java/default 

ENV JVMFLAGS -Xmx1g

#export port
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper/bin

VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/log", "/opt/zookeeper/zdata"]

CMD ["/run.sh"]
