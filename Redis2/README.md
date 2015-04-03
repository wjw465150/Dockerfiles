Dockerfile-redis2
=============================

Dockerfile For redis2

### To run:
start a redis instance  
```bash
docker run -d -p 6379:6379 -v /opt/docker-volumes/redis2/db:/opt/redis/db -v /opt/docker-volumes/redis2/log/:/opt/redis/log --name redis2 wjw465150/redis2
```
>  note:`redis.conf` is in `/opt/redis/db`path!  

