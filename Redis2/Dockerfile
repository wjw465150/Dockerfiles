#
# redis2 Dockerfile
#
#

# Pull base image.
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

ADD run.sh /run.sh 

COPY ./redis-2.8.23.tar.gz /opt/

RUN yum -y install sed grep unzip tar wget gcc make file && \
  cd /opt/ && \
  tar -zxvf ./redis-2.8.23.tar.gz && \
  cd redis-2.8.23 && \
  make PREFIX=/opt/redis install && \
  mkdir -p /opt/redis && \
  mkdir -p /opt/redis/log && \
  mkdir -p /opt/redis/db && \
  rm -rf /opt/redis-2.8.23/ && \
  rm -f /opt/redis-2.8.23.tar.gz && \
  chmod +x /run.sh

COPY ./redis.conf /opt/redis/db/redis.conf 

# Environment Variable

#export port
EXPOSE 6379

WORKDIR /opt/redis

CMD ["/run.sh"]
