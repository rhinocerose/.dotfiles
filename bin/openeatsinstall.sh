#!/bin/bash
sudo apt install -y docker docker-compose
export DOCKER_HOST=127.0.0.1:237
sudo systemctl enable docker
sudo systemctl start docker
git clone https://github.com/open-eats/OpenEats.git ~/OpenEats

cd ~/OpenEats
cp docs/samples/sample_docker_prod_override.yml docker-prod.override.yml
cp docs/samples/sample_env_file.list env_prod.list
sudo ./quick-start.py
sudo docker-compose -f docker-prod.yml run --rm --entrypoint 'python manage.py createsuperuser' api
