#!  /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

if [[ -d "$CursorsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Cursors" "$CursorsDirectory"
else
   mkdir "$CursorsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Cursors" "$CursorsDirectory"
fi
