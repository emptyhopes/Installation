#! /bin/bash

temporary=$(mktemp --directory)

git clone --quiet "https://github.com/vinceliuice/WhiteSur-gtk-theme.git" "$temporary/Themes"

echo "Instaling themes..."
"$temporary/Themes/install.sh" --libadwaita --color "Light" --opacity "normal" --nautilus-style "glassy"

echo "Instaling tweaks..."
"$temporary/Themes/tweaks.sh" --firefox "monterey" --dash-to-dock --edit-firefox

sudo rm --recursive --force "$temporary"

echo "Install theme: Success."
