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
   sudo cp --recursive "$InstallationDirectory/Source/$ETCDefaultDirectory/grub" "$ETCDefaultDirectory/grub"
   sudo grub-mkconfig -o /boot/grub/grub.cfg
else
   mkdir "$ETCDefaultDirectory"
   sudo cp --recursive "$InstallationDirectory/Source/$ETCDefaultDirectory/grub" "$ETCDefaultDirectory/grub"
   sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "Fix sound: Done."

