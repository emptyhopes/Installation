#! /bin/bash

sudo apt-get install docker.io docker-compose --yes

sudo systemctl enable docker --now

sudo usermod -aG docker $USER

echo "Install docker: Success."
