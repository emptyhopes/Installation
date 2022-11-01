#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

if [[ -d "$ThemesDirectory" ]]; then
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes" "$ThemesDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes-hdpi" "$ThemesDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes-xhdpi" "$ThemesDirectory"
else
   mkdir "$ThemesDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes" "$ThemesDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes-hdpi" "$ThemesDirectory"
   cp --recursive "/home/$user/Downloads/installation/Source/home/.local/share/themes/MacOS-Themes-xhdpi" "$ThemesDirectory"
fi
