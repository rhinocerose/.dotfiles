#!/bin/bash
# pacman -S --noconfirm docker docker-compose
# export DOCKER_HOST=127.0.0.1:237
# systemctl enable docker
# systemctl start docker
git clone https://github.com/open-eats/OpenEats.git "$HOME"/OpenEats
cd "$HOME"/OpenEats || exit
ln -sfn "$HOME"/.dotfiles/.config/openeats/docker-prod.override.yml "$HOME"/OpenEats/docker-prod.override.yml
ln -sfn "$HOME"/.dotfiles/.config/openeats/env_prod.list "$HOME"/OpenEats/env_prod.list
./quick-start.py
docker-compose -f docker-prod.yml run --rm --entrypoint 'python manage.py createsuperuser' api
