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

bash "$InstallationDirectory/Startup/remove.sh"
bash "$InstallationDirectory/Startup/install.sh"

echo "Need a logout."
