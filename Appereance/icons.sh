#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

if [[ -d "$IconsDirectory" ]]; then
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
else
   mkdir "$IconsDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
fi
