#! /bin/bash

sudo apt-get install protonvpn
sudo apt-get install gnome-shell-extension-appindicator gir1.2-appindicator3-0.1

grep '/usr/s\?bin' /etc/systemd/system/display-manager.service
