#!/bin/bash
pacman -S --noconfirm docker docker-compose
export DOCKER_HOST=127.0.0.1:237
systemctl enable docker
systemctl start docker

mkdir -pv /mnt/Movies
mkdir -pv /mnt/TV
mkdir -pv /mnt/plexconfig
mkdir -pv /mnt/TV2

sudo docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /mnt/plexconfig:/config \
  -v /mnt/TV/tv:/tv \
  -v /mnt/TV2:/tv2 \
  -v /mnt/Movies:/movies \
  --restart unless-stopped \
  linuxserver/plex

sudo docker start plex
