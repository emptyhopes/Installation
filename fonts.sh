#! /bin/bash

sudo apt-get install fonts-firacode

temporary=$(mktemp --directory)

curl --silent --location "https://fonts.google.com/download?family=Roboto" >"$temporary/fonts.zip"

unzip -q "$temporary/fonts.zip" -d "$LocalDirectoryFonts"

sudo rm --recursive --force "$temporary"

echo "Install fonts: Success."
