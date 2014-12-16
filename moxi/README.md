Dockerfile-moxi
===============

 memcached + integrated proxy
run:
```
docker run -d -p 11311:11311 wjw465150/moxi -z 11311=${ip1}:${port1},${ip2}:${port2},${ip2}:${port2} -u root -v
```

#### [X] Dockerfile
```
#
# Memcached moxi Dockerfile
#
#

# Pull base image.
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

# yum Install dependence.
RUN \
  yum -y install unzip tar wget curl libcurl* file && \
  yum -y install automake autoconf libtool which git gcc-c++ check*

#��װlibevent(https://github.com/libevent/libevent/releases)
COPY ./libevent-1.4.13-stable.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./libevent-1.4.13-stable.tar.gz && \
 cd ./libevent-1.4.13-stable && \
 ./configure --prefix=/usr/local && \
 make uninstall && \
 make clean && \
 make && \
 make install
  
#��װlibconflate(https://github.com/membase/libconflate)
COPY ./libconflate-2.1.1r.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./libconflate-2.1.1r.tar.gz && \
 cd ./libconflate-2.1.1r && \
 mkdir .git && \
 ./config/autorun.sh && \
 ./configure && \
 make && \
 make install
 
#��װlibvbucket(https://github.com/membase/libvbucket)
COPY ./libvbucket-2.1.1r.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./libvbucket-2.1.1r.tar.gz && \
 cd ./libvbucket-2.1.1r && \
 mkdir .git && \
 ./config/autorun.sh && \
 ./configure && \
 make && \
 make install 
 
#��װmemcached(http://memcached.org/)
COPY ./memcached-1.4.21.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./memcached-1.4.21.tar.gz && \
 cd ./memcached-1.4.21 && \
 ./configure --with-libevent=/usr/local/lib/ && \
 make uninstall && \
 make clean && \
 make && \
 make install 

RUN ln -s /usr/local/lib/libevent-1.4.so.2 /usr/lib64/libevent-1.4.so.2

#��װlibmemcached(https://github.com/membase/libmemcached)
COPY ./libmemcached-2.1.1r.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./libmemcached-2.1.1r.tar.gz && \
 cd ./libmemcached-2.1.1r && \
 ./config/autorun.sh  && \
 ./configure --with-memcached && \
 make uninstall && \
 make clean && \
 make && \
 make install

#��װmoxi(https://github.com/membase/moxi)
COPY ./moxi-2.5.0.tar.gz /tmp/

RUN cd /tmp/ && \
 tar zxvf ./moxi-2.5.0.tar.gz && \
 cd ./moxi-2.5.0 && \
 mkdir .git && \
 ./config/autorun.sh && \
 ./configure --with-memcached && \
 make uninstall && \
 make clean && \
 make && \
 make install
 
RUN cd / && rm -rf /tmp/*

# Expose ports.
EXPOSE 11311
  
ENTRYPOINT ["/usr/local/bin/moxi"]
CMD ["-h"]
#runʱ�ɴ������²���:-z 11311=${ip1}:${port1},${ip2}:${port2},${ip2}:${port2} -u root -v
```