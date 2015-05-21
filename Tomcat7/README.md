Dockerfile-Tomcat7
=============================

Dockerfile For Tomcat7

### To run:
#### [1] specify the environment either by creating a file with contents like so:  
```
JVM_Xms=-Xms512m
JVM_Xmx=-Xmx1g
JVM_ReservedCodeCacheSize=-XX:ReservedCodeCacheSize=96m
JVM_MaxPermSize=-XX:MaxPermSize=512m

SPRING_profiles=-Dspring.profiles.active=production

JMX_Host=192.168.2.12
JMX_Port=5678
JMX_User=tomcat
JMX_Password=tomcat
```  

#### [2]save that file somewhere (like `.env`). Then:
```
docker run -d -p 8080:8080 -p 8443:8443 -p 5678:5678 --env-file=./.env --name tomcat7 wjw465150/tomcat7
```

#### [3] or by specifying the variables as part of the `docker run` command:  
```  
docker run -d -p 8080:8080 -p 8443:8443 -p 5678:5678 -e JVM_Xms=-Xms256m -e JMX_Host=192.168.2.12 -e JMX_Port=5678 -e JMX_User=jmx -e JMX_Password=jmx -v /opt/ROOT_webapps:/opt/tomcat7/webapps --name tomcat7 wjw465150/tomcat7
```  
### Notes:
#### [1] Environment Variable:  
```
ENV JVM_Xms -Xms512m
ENV JVM_Xmx -Xmx1g
ENV JVM_ReservedCodeCacheSize -XX:ReservedCodeCacheSize=96m
ENV JVM_MaxPermSize -XX:MaxPermSize=512m
 
ENV SPRING_profiles -Dspring.profiles.active=production
 
ENV JMX_Host 0.0.0.0
ENV JMX_Port 5678
ENV JMX_User tomcat
ENV JMX_Password tomcat
```  

#### [2] Ports:
```
EXPOSE 8080 8443
```  
