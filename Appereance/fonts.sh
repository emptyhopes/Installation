#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

sudo apt-get install fonts-firacode

temporary=$(mktemp --directory)
curl --silent --location "https://fonts.google.com/download?family=Roboto" >"$temporary/fonts.zip"

if [[ -d "$FontsDirectory" ]]; then
   unzip -q "$temporary/fonts.zip" -d "$FontsDirectory"
else
   mkdir "$FontsDirectory"
   unzip -q "$temporary/fonts.zip" -d "$FontsDirectory"
fi

sudo rm --recursive --force "$temporary"

echo "Install fonts: Success."
