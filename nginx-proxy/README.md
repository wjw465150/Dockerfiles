Dockerfile-nginx-proxy
=============================

Dockerfile For nginx-proxy

Usage:
```bash
docker run -d -e SERVER_NAME=proxy.yy.com -e SERVER_PORT=80 -e UPSTREAM_ADDRESS=192.168.2.114 -e UPSTREAM_PORT=8080 -p 80:80 -v /var/log:/var/log --name proxy wjw465150/nginx-proxy
```
