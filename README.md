# docker-caching-example
docker build --tag=docker-nginx-plus-caching-example .

docker run -p 80:80 -p 443:443 -p 8080:8080 $PWD/etc/nginx:/etc/nginx -v $PWD/var/cache/nginx:/var/cache/nginx -it docker-nginx-plus-caching-example