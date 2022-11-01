#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

ClearDirectory() {

   # Local
   
   sudo rm --recursive --force "$LocalDirectoryExtensions" | echo "Clear $LocalDirectoryExtensions: Success."
   sudo rm --recursive --force "$LocalDirectoryBackgrounds" | echo "Clear $LocalDirectoryBackgrounds: Success."
   sudo rm --recursive --force "$LocalDirectoryThemes" | echo "Clear $LocalDirectoryThemes: Success."
   sudo rm --recursive --force "$LocalDirectoryCursors" | echo "Clear $LocalDirectoryCursors: Success."
   sudo rm --recursive --force "$LocalDirectoryIcons" | echo "Clear $LocalDirectoryIcons: Success."
   sudo rm --recursive --force "$LocalDirectoryFonts" | echo "Clear $LocalDirectoryFonts: Success."

   # Root

   cd "$RootDirectoryThemes" | ls | grep (-v) --value Default | xargs sudo rm --recursive --force

   sudo rm --recursive --force "$RootDirectoryExtensions" | echo "Clear $RootDirectoryExtensions: Success."
   sudo rm --recursive --force "$RootDirectoryBackgrounds" | echo "Clear $RootDirectoryBackgrounds: Success."
   sudo rm --recursive --force "$RootDirectoryThemes" | echo "Clear $RootDirectoryThemes: Success."
   sudo rm --recursive --force "$RootDirectoryCursors" | echo "Clear $RootDirectoryCursors: Success."
   sudo rm --recursive --force "$RootDirectoryIcons" | echo "Clear $RootDirectoryIcons: Success."
   sudo rm --recursive --force "$RootDirectoryFonts" | echo "Clear $RootDirectoryFonts: Success."

}

ClearDirectory
