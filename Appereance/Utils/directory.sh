#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

# Local
sudo rm --recursive --force "$ExtensionsLocalDirectory" | echo "Clear $ExtensionsLocalDirectory: Success."
sudo rm --recursive --force "$BackgroundsLocalDirectory" | echo "Clear $BackgroundsLocalDirectory: Success."
sudo rm --recursive --force "$ThemesLocalDirectory" | echo "Clear $ThemesLocalDirectory: Success."
sudo rm --recursive --force "$CursorsLocalDirectory" | echo "Clear $CursorsLocalDirectory: Success."
sudo rm --recursive --force "$IconsLocalDirectory" | echo "Clear $IconsLocalDirectory: Success."
sudo rm --recursive --force "$FontsLocalDirectory" | echo "Clear $FontsLocalDirectory: Success."

# Root
cd "$ExtensionsRootDirectory" && sudo rm * --recursive --force | echo "Clear $ExtensionsRootDirectory: Success."
cd "$BackgroundsRootDirectory" && sudo rm * --recursive --force | echo "Clear $BackgroundsRootDirectory: Success."
cd "$ThemesRootDirectory" && ls | grep --invert-match Default | sudo xargs rm --recursive --force | echo "Clear $ThemesRootDirectory: Success."
cd "$CursorsRootDirectory" && ls | grep --invert-match Adwaita | sudo xargs rm --recursive --force | echo "Clear $CursorsRootDirectory: Success."
cd "$IconsRootDirectory" && ls | grep --invert-match Adwaita | sudo xargs rm --recursive --force | echo "Clear $IconsRootDirectory: Success."
cd "$FontsRootDirectory" && sudo rm * --recursive --force | echo "Clear $FontsRootDirectory: Success."
