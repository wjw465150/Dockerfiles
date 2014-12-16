#!/bin/sh

# set the user/pass
#htpasswd -cb /opt/nginx/conf/.htpasswd ${USER} ${PASSWORD}

# replace variables at runtime
sed -i "s/SERVER_NAME/${SERVER_NAME}/g" /opt/nginx/conf/nginx.conf
sed -i "s/SERVER_NAME/${SERVER_PORT}/g" /opt/nginx/conf/nginx.conf
sed -i "s/UPSTREAM_ADDRESS/${UPSTREAM_ADDRESS}/g" /opt/nginx/conf/nginx.conf
sed -i "s/UPSTREAM_PORT/${UPSTREAM_PORT}/g" /opt/nginx/conf/nginx.conf

# start the thing
ulimit -SHn 51200
/opt/nginx/sbin/nginx -c /opt/nginx/conf/nginx.conf
