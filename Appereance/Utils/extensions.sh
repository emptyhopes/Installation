#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont user super user."
   exit 1
fi

if [[ -f "/home/$(whoami)/Downloads/installation/Variables/variables.sh" ]]; then
   source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"
else
   echo "File variables not found."
   exit 1
fi

BaseURL="https://extensions.gnome.org"
GnomeVersion=$(gnome-shell --version | cut --delimiter=" " --fields="3")

GetInformationExtension() {
   echo "$BaseURL/extension-info/?uuid=${1}&shell_version=$GnomeVersion"
}

GetDownloadURLExtension() {
   echo "$BaseURL$(curl --silent --location "$(GetInformationExtension $1)" | sed --expression 's/.*"download_url": "\([^"]*\)".*/\1/')"
}

for extension in ${Extensions[@]}; do
   temporary=$(mktemp --directory)
   destination="$ExtensionsDirectory/$extension"
   url=$(GetDownloadURLExtension "$extension")

   curl --silent --location "$url" >"$temporary/$extension.zip"

   if [[ -d "$ExtensionsDirectory" ]]; then
      unzip -q "$temporary/$extension.zip" -d "$destination"
   else
      mkdir "$ExtensionsDirectory"
      unzip -q "$temporary/$extension.zip" -d "$destination"
   fi

   sudo rm --recursive --force "$temporary"

   echo "Install $extension: Success."
done
