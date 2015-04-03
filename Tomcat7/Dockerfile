#
# tomcat7 Dockerfile
#
# 

# Pull base image. 
FROM centos:centos6

MAINTAINER wjw465150 <wjw465150@gmail.com>

ADD run.sh /run.sh
  
COPY ./jdk-7u76-linux-x64.rpm /tmp/  
COPY ./apr-1.5.1.tar.gz /tmp/
COPY ./apr-util-1.5.4.tar.gz /tmp/  
COPY ./tomcat-native-1.1.32-src.tar.gz /tmp/  
COPY ./tomcat7.tar.gz /opt/  

RUN yum -y install sed grep unzip tar wget gcc make file openssl openssl-devel && \ 
rpm -ivh ./tmp/jdk-7u76-linux-x64.rpm && \
cd /tmp/ && \
  tar -zxvf apr-1.5.1.tar.gz && \
  cd ./apr-1.5.1  && \
  ./configure && \
  make && \
  make install && \
cd /tmp/ && \
  tar -zxvf apr-util-1.5.4.tar.gz && \
  cd ./apr-util-1.5.4 && \
  ./configure --with-apr=/usr/local/apr && \
  make && \
  make install && \
cd /tmp/ && \
  tar -zxvf ./tomcat-native-1.1.32-src.tar.gz && \
  cd ./tomcat-native-1.1.32-src/jni/native/ && \
  export JAVA_HOME=/usr/java/default && \
  ./configure --with-apr=/usr/local/apr --with-ssl=yes && \
  make && \
  make install && \
groupadd www -g 58 && \
  useradd -u 58 -g www www  && \ 
  cd /opt/ && \
  tar -zxvf ./tomcat7.tar.gz && \
  mkdir /opt/tomcat7/temp && \
  chown -R www:www /opt/tomcat7 && \
  chmod +x /opt/tomcat7/bin/tomcat && \
  chmod +x /opt/tomcat7/wrapper_home/sbin/wrapper* && \
chmod +x /*.sh && \
  rm -rf /tmp/*  && \
  rm -f /opt/tomcat7.tar.gz

# Environment Variable    
ENV JAVA_HOME /usr/java/default
 
ENV JVM_Xms -Xms512m
ENV JVM_Xmx -Xmx1g
ENV JVM_ReservedCodeCacheSize -XX:ReservedCodeCacheSize=96m
ENV JVM_MaxPermSize -XX:MaxPermSize=512m
 
ENV SPRING_profiles -Dspring.profiles.active=production
 
ENV JMX_User tomcat
ENV JMX_Password tomcat

#export port
EXPOSE 8080 8443 8005 5678

WORKDIR /opt/tomcat7

CMD ["/run.sh"]
