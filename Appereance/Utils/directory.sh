#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"

# Local
sudo rm --recursive --force "$LocalDirectoryExtensions" | echo "Clear $LocalDirectoryExtensions: Success."
sudo rm --recursive --force "$LocalDirectoryBackgrounds" | echo "Clear $LocalDirectoryBackgrounds: Success."
sudo rm --recursive --force "$LocalDirectoryThemes" | echo "Clear $LocalDirectoryThemes: Success."
sudo rm --recursive --force "$LocalDirectoryCursors" | echo "Clear $LocalDirectoryCursors: Success."
sudo rm --recursive --force "$LocalDirectoryIcons" | echo "Clear $LocalDirectoryIcons: Success."
sudo rm --recursive --force "$LocalDirectoryFonts" | echo "Clear $LocalDirectoryFonts: Success."

# Root
cd "$RootDirectoryExtensions" && sudo rm * --recursive --force | echo "Clear $RootDirectoryExtensions: Success."
cd "$RootDirectoryBackgrounds" && sudo rm * --recursive --force | echo "Clear $RootDirectoryBackgrounds: Success."
cd "$RootDirectoryThemes" && ls | grep --invert-match Default | sudo xargs rm --recursive --force | echo "Clear $RootDirectoryThemes: Success."
cd "$RootDirectoryCursors" && ls | grep --invert-match Adwaita | sudo xargs rm --recursive --force | echo "Clear $RootDirectoryCursors: Success."
cd "$RootDirectoryIcons" && ls | grep --invert-match Adwaita | sudo xargs rm --recursive --force | echo "Clear $RootDirectoryIcons: Success."
cd "$RootDirectoryFonts" && sudo rm * --recursive --force | echo "Clear $RootDirectoryFonts: Success."
