#! /bin/bash

temporary=$(mktemp --directory)

git clone --quiet "https://github.com/vinceliuice/WhiteSur-wallpapers.git" "$temporary/Wallpapers"

sudo "$temporary/Wallpapers/install-gnome-backgrounds.sh" --theme "monterey" --screen "4k"

sudo rm --recursive --force "$temporary"

echo "Install wallpapers: Success."
