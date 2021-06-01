# ElasticBeanstalk Amazon Linux 2 + PHP7.4 FPM + Nginx

- No DB/caching by design
- Barebones example only
- PHP configuration: `/.ebextensions/01_php_ini.config`
- Nginx configuration: `/.platform/nginx/nginx.conf`
- Document Root `/public`

## Docker for local development

- Change HTTP port as you see fit: `/docker-compose.yml`

First time
```
docker compose build
```

Up
```
docker compose up
```

Bash into docker instance (may need to change the name, see `docker ps`)
```
docker exec -it -u ec2-user eb-al2-php74-nginx-docker_devbox_1 bash
```

Shut down after you are done
```
docker compose down
```