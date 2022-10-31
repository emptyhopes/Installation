#! /bin/bash

temporary=$(mktemp --directory)

git clone --quiet "https://github.com/vinceliuice/McMojave-cursors.git" "$temporary"

cd "$temporary"
"./install.sh"
cd "/"

sudo rm --recursive --force "$temporary"

echo "Install cursors: Success.
