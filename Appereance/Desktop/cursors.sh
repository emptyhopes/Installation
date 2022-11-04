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

if [[ -d "$CursorsDirectory" ]]; then
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Cursors" "$CursorsDirectory"
else
   mkdir "$CursorsDirectory"
   cp --recursive "$InstallationDirectory/Source/home/.local/share/icons/MacOS-Cursors" "$CursorsDirectory"
fi
