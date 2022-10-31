#! /bin/bash

# System
gsettings set org.gnome.desktop.interface clock-show-date "true"
gsettings set org.gnome.desktop.interface clock-show-seconds "true"
gsettings set org.gnome.desktop.interface clock-show-weekday "true"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"
gsettings set org.gnome.mutter center-new-windows "true"

echo "Settings up system: Success."

# Dash to dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts "false"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash "false"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "true"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity "0.30"
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide "false"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "40"

echo "Settings up dash to dock: Success."

# Appearance
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Light"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Light"
gsettings set org.gnome.desktop.interface cursor-theme "McMojave-cursors"

gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"

gsettings set org.gnome.desktop.interface font-name "Roboto 10"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Medium 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 10"

echo "Settings up appearance: Success."
