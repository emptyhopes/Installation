#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

if [[ -d "$BackgroundsDirectory" ]]; then
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
else
   mkdir "$BackgroundsDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
fi
