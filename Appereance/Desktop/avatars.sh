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

if [[ -d "$AvatarsDiretory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/avatars/Avatars.jpg" "$AvatarsDiretory"
else
   mkdir "$AvatarsDiretory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/avatars/Avatars.jpg" "$AvatarsDiretory"
fi

echo "Avatars: Done."
