#! /bin/bash

sudo apt-get update
sudo apt-get install gdm3 gnome-session gnome-shell gnome-shell-extensions gnome-shell-extension-dashtodock gnome-tweaks nautilus gnome-text-editor gnome-calculator gnome-system-monitor gnome-terminal evince kali-desktop-core --yes

sudo dpkg-reconfigure gdm3

sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager

sudo service gdm3 start
