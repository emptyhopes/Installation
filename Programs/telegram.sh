#! /bin/bash

temporary=$(mktemp --directory)

curl --location "https://telegram.org/dl/desktop/linux" >"$temporary/telegram.tar.xz"

cd "$temporary"
tar --extract --file "telegram.tar.xz"

sudo mv "$temporary/Telegram" "/opt"

sudo rm --recursive --force "$temporary"

/opt/Telegram/Telegram

echo "Install telegram: Success."
