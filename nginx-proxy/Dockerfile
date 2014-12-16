#
# nginx-proxy Dockerfile
#
#

# Pull base image.
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

# Install dependence.
RUN \
  yum -y install gcc make file && \
  yum -y install tar pcre-devel pcre-staticopenssl openssl-devel httpd-tools

RUN \
  groupadd www -g 58 && \
  useradd -u 58 -g www www  

COPY ./nginx-1.4.6.tar.gz /tmp/
  
RUN cd /tmp/ && \
  tar zxvf ./nginx-1.4.6.tar.gz && \
  cd ./nginx-1.4.6 && \
  ./configure --user=www --group=www --prefix=/opt/nginx \
  --with-pcre \
  --with-http_stub_status_module \
  --with-http_ssl_module \
  --with-http_addition_module  \
  --with-http_realip_module \
  --with-http_flv_module && \
  make && \
  make install

RUN rm -rf /tmp/*

VOLUME ["/var/log"]

# Expose ports.
EXPOSE 80

ENV SERVER_NAME localhost
ENV SERVER_PORT 80
ENV UPSTREAM_ADDRESS 192.168.1.100
ENV UPSTREAM_PORT 8080

ADD nginx.conf /opt/nginx/conf/
ADD nginx.crt /opt/nginx/conf/
ADD nginx.key /opt/nginx/conf/
ADD run.sh /

RUN chmod +x /run.sh

CMD /run.sh

