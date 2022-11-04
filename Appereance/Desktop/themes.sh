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

if [[ -d "$ThemesDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes" "$ThemesDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes-hdpi" "$ThemesDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes-xhdpi" "$ThemesDirectory"
else
   mkdir "$ThemesDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes" "$ThemesDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes-hdpi" "$ThemesDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/themes/MacOS-Themes-xhdpi" "$ThemesDirectory"
fi
