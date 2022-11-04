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

bash "$InstallationDirectory/Appereance/Utils/directory.sh"
bash "$InstallationDirectory/Appereance/Utils/extensions.sh"

bash "$InstallationDirectory/Appereance/Browser/firefox.sh"

bash "$InstallationDirectory/Appereance/Desktop/themes.sh"
bash "$InstallationDirectory/Appereance/Desktop/backgrounds.sh"
bash "$InstallationDirectory/Appereance/Desktop/cursors.sh"
bash "$InstallationDirectory/Appereance/Desktop/icons.sh"
bash "$InstallationDirectory/Appereance/Desktop/fonts.sh"

echo "Need a logout."
