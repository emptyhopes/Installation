#! /bin/bash

sudo apt-get install docker.io --yes

sudo systemctl enable docker --now

sudo usermod -aG docker $USER
