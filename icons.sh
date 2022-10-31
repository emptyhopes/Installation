#! /bin/bash

temporary=$(mktemp --directory)

git clone --quiet "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "$temporary/Icons"

"$temporary/Icons/install.sh" --theme "default"

sudo rm --recursive --force "$temporary"

echo "Install icons: Success."

