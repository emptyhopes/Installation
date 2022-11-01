#! /bin/bash

sudo apt-get update
sudo apt-get install gnome-session gnome-terminal --yes

sudo dpkg-reconfigure gdm3

sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager

sudo service gdm3 start
