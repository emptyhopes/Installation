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

if [[ -d "$IconsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
else
   mkdir "$IconsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
fi
