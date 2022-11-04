#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

if [[ -f "/home/$(whoami)/Downloads/installation/Variables/variables.sh" ]]; then
   source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"
else
   echo "File variables not found."
   exit 1
fi

if [[ -d "$BackgroundsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
else
   mkdir "$BackgroundsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
fi
