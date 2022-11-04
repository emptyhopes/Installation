#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

bash "$InstallationDirectory/Appereance/Utils/directory.sh"
bash "$InstallationDirectory/Appereance/Utils/extensions.sh"

bash "$InstallationDirectory/Appereance/Browser/firefox.sh"

bash "$InstallationDirectory/Appereance/Desktop/themes.sh"
bash "$InstallationDirectory/Appereance/Desktop/backgrounds.sh"
bash "$InstallationDirectory/Appereance/Desktop/cursors.sh"
bash "$InstallationDirectory/Appereance/Desktop/icons.sh"
bash "$InstallationDirectory/Appereance/Desktop/fonts.sh"
