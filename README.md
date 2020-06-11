# docker-caching-example

To use:
edit etc/nginx/conf.d/cdn.conf with your specific needs. especially the server in the upstream.

Then:

sudo rm -rf var/cache/nginx/* #remove cache directories before build
docker build --tag=nginx-cacher .
docker run -p 80:80 -p 443:443 -p 8080:8080 -v $PWD/etc/nginx:/etc/nginx -v $PWD/var/cache/nginx:/var/cache/nginx -it --name=nginx-cacher nginx-cacher:latest