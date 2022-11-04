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

# Local
sudo rm --recursive --force "$ExtensionsLocalDirectory" | echo "Clear $ExtensionsLocalDirectory: Success."
sudo rm --recursive --force "$BackgroundsLocalDirectory" | echo "Clear $BackgroundsLocalDirectory: Success."
sudo rm --recursive --force "$ThemesLocalDirectory" | echo "Clear $ThemesLocalDirectory: Success."
sudo rm --recursive --force "$CursorsLocalDirectory" | echo "Clear $CursorsLocalDirectory: Success."
sudo rm --recursive --force "$IconsLocalDirectory" | echo "Clear $IconsLocalDirectory: Success."
sudo rm --recursive --force "$FontsLocalDirectory" | echo "Clear $FontsLocalDirectory: Success."

# Root
cd "$ExtensionsRootDirectory" && sudo rm * --recursive --force | echo "Clear $ExtensionsRootDirectory: Success."
