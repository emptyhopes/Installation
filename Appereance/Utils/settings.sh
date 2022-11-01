#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont user super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

# System

gsettings set org.gnome.desktop.interface color-scheme "default"
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent "true"
gsettings set org.gnome.desktop.interface clock-show-date "true"
gsettings set org.gnome.desktop.interface clock-show-seconds "true"
gsettings set org.gnome.desktop.interface clock-show-weekday "true"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"
gsettings set org.gnome.mutter center-new-windows "true"

echo "Settings up system: Success."

# Dash to dock

#gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts "false"
#gsettings set org.gnome.shell.extensions.dash-to-dock show-trash "false"
#gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "true"
#gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity "0.30"
#gsettings set org.gnome.shell.extensions.dash-to-dock intellihide "false"
#gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
#gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "40"

#echo "Settings up dash to dock: Success."

# Terminal

#gsettings set org.gnome.Terminal.Legacy.Profile:/:0/ default-size-columns 120

#gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 120
#gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 30
#gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-transparency-percent 30
#gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false
#gsettings get org.gnome.Terminal.Legacy.Profile:/:0/ font

#echo "Settings up terminal: Success."

# Appearance

gsettings set org.gnome.desktop.interface icon-theme "MacOS-Icons"
gsettings set org.gnome.desktop.interface gtk-theme "MacOS-Themes"
gsettings set org.gnome.shell.extensions.user-theme name "MacOS-Themes"
gsettings set org.gnome.desktop.interface cursor-theme "MacOS-Cursors"

gsettings set org.gnome.desktop.background picture-uri "file:///home/$user/.local/share/backgrounds/MacOS-Backgrounds/MacOS.xml"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///home/$user/.local/share/backgrounds/MacOS-Backgrounds/MacOS.xml"

gsettings set org.gnome.desktop.interface font-name "Roboto 10"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Medium 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 10"

echo "Settings up appearance: Success."
