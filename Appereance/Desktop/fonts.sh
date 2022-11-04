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

temporary=$(mktemp --directory)
curl --silent --location "https://fonts.google.com/download?family=Roboto" >"$temporary/fonts.zip"

if [[ -d "$FontsDirectory" ]]; then
   unzip -q "$temporary/fonts.zip" -d "$FontsDirectory"
else
   mkdir "$FontsDirectory"
   unzip -q "$temporary/fonts.zip" -d "$FontsDirectory"
fi

sudo rm --recursive --force "$temporary"

echo "Fonts: Done."
