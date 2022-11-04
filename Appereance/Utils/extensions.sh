#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont user super user."
   exit 1
fi

source "../../Variables/variables.sh"

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
   destination="$LocalDirectoryExtensions/$extension"
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
