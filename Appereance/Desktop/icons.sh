#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "../../Variables/variables.sh"

if [[ -d "$IconsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
else
   mkdir "$IconsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Icons" "$IconsDirectory"
fi
