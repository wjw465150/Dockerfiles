#!/bin/bash

export CATALINA_HOME=/opt/tomcat7

chown -R www:www /opt/tomcat7

echo "=> Update tomcat-users.xml file with Environment Variable:JMX_User,JMX_Password"
echo '<?xml version="1.0" encoding="utf-8"?>' > ${CATALINA_HOME}/conf/tomcat-users.xml

echo '<tomcat-users>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '  <role rolename="manager"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '  <role rolename="jmx"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '  ' >> ${CATALINA_HOME}/conf/tomcat-users.xml

echo "  <user username=\"${JMX_User}\" password=\"${JMX_Password}\" roles=\"manager,jmx\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml

echo '</tomcat-users>' >> ${CATALINA_HOME}/conf/tomcat-users.xml 
echo "=> Done!"

echo "========================================================================"
echo "You can now configure to this Tomcat server using:"
echo ""
echo "    ${JMX_User}:${JMX_Password}"
echo ""
echo "========================================================================"

exec su www -c "${CATALINA_HOME}/bin/tomcat console"
