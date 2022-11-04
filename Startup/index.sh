#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

bash "$InstallationDirectory/Startup/remove.sh"
bash "$InstallationDirectory/Startup/install.sh"

