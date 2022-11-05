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

if [[ -d "$AvatarsDirectory" ]]; then
   sudo cp --recursive "$InstallationDirectory/Source/home/.local/share/avatars/Avatar.jpg" "$AvatarsDirectory"
else
   mkdir "$AvatarsDirectory"
   sudo cp --recursive "$InstallationDirectory/Source/home/.local/share/avatars/Avatar.jpg" "$AvatarsDirectory"
fi

echo "Avatars: Done."
