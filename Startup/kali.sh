#! /bin/bash

sudo apt-get update --yes

sudo apt-get install kali-desktop-core gdm3 gnome-session gnome-shell gnome-shell-extensions gnome-shell-extension-appindicator gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-terminal gnome-tweaks nautilus gnome-text-editor gnome-calculator gnome-bluetooth --yes
sudo apt-get install curl fonts-firacode --yes

sudo apt-get purge --autoremove kali-desktop-xfce xfce4 xfce4-* lightdm kali-tools-top10 --yes

sudo service gdm3 start
