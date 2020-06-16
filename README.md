# docker-caching-example

To use:
1. edit etc/nginx/conf.d/cdn.conf with your specific needs. especially the server in the upstream.
2. add repo keys to base folder

In my demo I build an excessively large image site (like retail would have) <https://github.com/jessegoodier/docker-backend-site-for-CDN-demo>

Then:
#remove cache directories before build
sudo rm -rf var/cache/nginx/*

docker run -it -p 80:80 -p 443:443 -p 8080:8080 --volume $PWD/etc/nginx:/etc/nginx --volume $PWD/var/cache/nginx:/var/cache/nginx --name=nginx-cdn nginx-cdn:latest
