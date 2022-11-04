#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "../../Variables/variables.sh"

if [[ -d "$BackgroundsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
else
   mkdir "$BackgroundsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/backgrounds/MacOS-Backgrounds" "$BackgroundsDirectory"
fi
