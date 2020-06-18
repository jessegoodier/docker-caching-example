#!/bin/bash
set -e
#remove cache directories before build
sudo rm -rf var/cache/nginx/*
docker build --tag=nginx-cdn .

#check if container exists and remove if so
if [ -n "$( docker container ls --all --quiet --filter name=nginx-cdn )" ]; then
  echo "Container exists, removing"
  docker rm -f nginx-cdn;
fi

#pass the ports and volumes, run interactively to view log output, this is a demo
docker run -it -p 80:80 -p 443:443 -p 8080:8080 --volume $PWD/etc/nginx:/etc/nginx --volume $PWD/var/cache/nginx:/var/cache/nginx --name=nginx-cdn nginx-cdn:latest
