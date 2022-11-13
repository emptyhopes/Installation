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

if [[ -d "$ETCDefaultDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/$ETCDefaultDirectory/grub" "$ETCDefaultDirectory/grub"
else
   mkdir "$ETCDefaultDirectory"
   cp --recursive "$InstallationDirectory/Source/$ETCDefaultDirectory/grub" "$ETCDefaultDirectory/grub"
fi

echo "Fix sound: Done."

