#! /bin/bash

# Gnome

sudo apt-get update --yes

sudo apt-get install kali-desktop-core gdm3 gnome-session gnome-shell gnome-shell-extensions gnome-shell-extension-appindicator gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-terminal gnome-tweaks nautilus

sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-session-manager

sudo service gdm3 start
