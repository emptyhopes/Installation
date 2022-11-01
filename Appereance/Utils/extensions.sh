#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont user super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

DownloadExtensions() {
   BaseURL="https://extensions.gnome.org"
   GnomeVersion=$(gnome-shell --version | cut --delimiter=" " --fields="3")
   extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")

   for extension in ${extensions[@]}; do
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
}

GetInformationExtension() {
   echo "$BaseURL/extension-info/?uuid=${1}&shell_version=$GnomeVersion"
}

GetDownloadURLExtension() {
   echo "$BaseURL$(curl --silent --location "$(GetInformationExtension $1)" | sed --expression 's/.*"download_url": "\([^"]*\)".*/\1/')"
}

DownloadExtensions
