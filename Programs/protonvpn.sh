#! /bin/bash

temporary=$(mktemp --directory)

curl --silent --location "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb" >"$temporary/protonvpn.deb"

sudo apt install "$temporary/protonvpn.deb" --yes
sudo apt-get update
sudo apt-get install protonvpn --yes
sudo apt-get install gnome-shell-extension-appindicator --yes

grep '/usr/s\?bin' /etc/systemd/system/display-manager.service
