#! /bin/bash

# Remove

sudo service lightdm stop

sudo apt-get purge --autoremove kali-desktop-xfce xfce4 xfce4-* lightdm kali-tools-top10 --yes
sudo apt-get purge --autoremove qt5ct qt5-* yelp yelp-xsl kali-tweaks --yes
