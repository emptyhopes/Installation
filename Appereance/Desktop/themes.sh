#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "../../Variables/variables.sh"

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
