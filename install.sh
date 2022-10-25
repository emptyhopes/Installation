#!/bin/bash

ROOT_UID=0

BaseURL="https://extensions.gnome.org"

GnomeVersion=$(gnome-shell --version | cut --delimiter=" " --fields="3")

extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")

LocalDirectoryExtensions="$HOME/.local/share/gnome-shell/extensions"
LocalDirectoryCursors="$HOME/.local/share/icons"
LocalDirectoryThemes="$HOME/.themes"
LocalDirectoryIcons="$HOME/.icons"
LocalDirectoryFonts="$HOME/.fonts"

RootDirectoryExtensions="/usr/share/gnome-shell/extensions"

if [[ "$UID" == "$ROOT_UID" ]]; then
   echo "Error: This script must be run as user."
   exit 1
fi

Run() {
   ClearTerminal

   UpdateRepositories
   echo ""
   UpgradeRepositories
   echo ""
   InstallRepositories
   echo ""
   RemoveRepositories
   echo ""

   RemoveDirectory
   echo ""
   MakeDirectory
   echo ""

   DownloadExtensions
   echo ""
   DownloadThemes
   echo ""
   DownloadIcons
   echo ""
   DownloadCursors
   echo ""
   DownloadWallpapers
   echo ""
   DownloadFonts
   echo ""

   SystemSetup
}

ClearTerminal() {
   clear
}

# Убрать
UpdateRepositories() {
   sudo apt update --yes
}

# Убрать
UpgradeRepositories() {
   sudo apt upgrade --yes
   sudo apt dist-upgrade --yes
}

# Убрать
InstallRepositories() {
   sudo apt install dbus-x11 libavutil56 libswresample3 wget curl git net-tools python3 nodejs npm kali-desktop-gnome --yes
}

RemoveRepositories() {
   sudo apt autoremove --yes
}

RemoveDirectory() {
   sudo rm --recursive --force "$LocalDirectoryExtensions"
   echo "Clear $LocalDirectoryExtensions: Success."
   sudo rm --recursive --force "$LocalDirectoryThemes"
   echo "Clear $LocalDirectoryThemes: Success."
   sudo rm --recursive --force "$LocalDirectoryIcons"
   echo "Clear $LocalDirectoryIcons: Success."
   sudo rm --recursive --force "$LocalDirectoryFonts"
   echo "Clear $LocalDirectoryFonts: Success."
   sudo rm --recursive --force "$LocalDirectoryCursors"
   echo "Clear $LocalDirectoryCursors: Success."

   cd "$RootDirectoryExtensions"
   sudo rm --recursive --force *
   echo "Clear $RootDirectoryExtensions: Success."
}

MakeDirectory() {
   mkdir "$LocalDirectoryExtensions"
   mkdir "$LocalDirectoryCursors"
   mkdir "$LocalDirectoryThemes"
   mkdir "$LocalDirectoryIcons"
   mkdir "$LocalDirectoryFonts"
}

DownloadExtensions() {
   for extension in ${extensions[@]}; do
      temporary=$(mktemp --directory)
      destination="$LocalDirectoryExtensions/$extension"
      url=$(GetDownloadURLExtension "$extension")

      trap "sudo rm --recursive --force "$temporary"" SIGHUP SIGINT SIGQUIT SIGTERM

      curl --silent --location "$url" >"$temporary/$extension.zip"
      unzip -q "$temporary/$extension.zip" -d "$destination"
      sudo rm --recursive --force "$temporary"

      echo "Install $extension: Success."

      trap "" SIGHUP SIGINT SIGQUIT SIGTERM
   done
}

GetInformationExtension() {
   echo "$BaseURL/extension-info/?uuid=${1}&shell_version=$GnomeVersion"
}

GetDownloadURLExtension() {
   echo "$BaseURL$(curl --silent --location "$(GetInformationExtension $1)" | sed --expression 's/.*"download_url": "\([^"]*\)".*/\1/')"
}

DownloadThemes() {
   temporary=$(mktemp --directory)

   trap "sudo rm --recursive --force $temporary" SIGHUP SIGINT SIGQUIT SIGTERM

   git clone --quiet "https://github.com/vinceliuice/WhiteSur-gtk-theme.git" "$temporary/Themes"

   echo "Instaling themes..."
   "$temporary/Themes/install.sh" --libadwaita --color "Light" --opacity "normal" --nautilus-style "glassy"

   echo "Instaling tweaks..."
   "$temporary/Themes/tweaks.sh" --firefox "monterey" --dash-to-dock --edit-firefox

   sudo rm --recursive --force "$temporary"

   trap "" SIGHUP SIGINT SIGQUIT SIGTERM

   echo "Install theme: Success."
}

DownloadIcons() {
   temporary=$(mktemp --directory)

   trap "sudo rm --recursive --force $temporary" SIGHUP SIGINT SIGQUIT SIGTERM

   git clone --quiet "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "$temporary/Icons"

   "$temporary/Icons/install.sh" --theme "default"

   sudo rm --recursive --force "$temporary"

   trap "" SIGHUP SIGINT SIGQUIT SIGTERM

   echo "Install icons: Success."
}

DownloadCursors() {
   temporary=$(mktemp --directory)

   trap "sudo rm --recursive --force $temporary" SIGHUP SIGINT SIGQUIT SIGTERM

   git clone --quiet "https://github.com/vinceliuice/McMojave-cursors.git" "$temporary"

   cd "$temporary"
   "./install.sh"
   cd "/"

   sudo rm --recursive --force "$temporary"

   trap "" SIGHUP SIGINT SIGQUIT SIGTERM

   echo "Install cursors: Success."
}

DownloadWallpapers() {
   temporary=$(mktemp --directory)

   trap "sudo rm --recursive --force $temporary" SIGHUP SIGINT SIGQUIT SIGTERM

   git clone --quiet "https://github.com/vinceliuice/WhiteSur-wallpapers.git" "$temporary/Wallpapers"

   sudo "$temporary/Wallpapers/install-gnome-backgrounds.sh" --theme "monterey" --screen "4k"

   sudo rm --recursive --force "$temporary"

   trap "" SIGHUP SIGINT SIGQUIT SIGTERM

   echo "Install wallpapers: Success."
}

DownloadFonts() {
   temporary=$(mktemp --directory)

   trap "sudo rm --recursive --force $temporary" SIGHUP SIGINT SIGQUIT SIGTERM

   curl --silent --location "https://fonts.google.com/download?family=Roboto" >"$temporary/fonts.zip"

   unzip -q "$temporary/fonts.zip" -d "$LocalDirectoryFonts"

   sudo rm --recursive --force "$temporary"

   trap "" SIGHUP SIGINT SIGQUIT SIGTERM

   echo "Install fonts: Success."
}

SystemSetup() {
   # System
   gsettings set org.gnome.desktop.interface clock-show-date "true"
   gsettings set org.gnome.desktop.interface clock-show-seconds "true"
   gsettings set org.gnome.desktop.interface clock-show-weekday "true"

   gsettings set org.gnome.desktop.interface show-battery-percentage "true"

   gsettings set org.gnome.mutter center-new-windows "true"

   echo "Settings system: Success."

   # Dash to dock
   gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts "false"
   gsettings set org.gnome.shell.extensions.dash-to-dock show-trash "false"

   gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "true"
   gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity "0.30"

   gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup "true"
   gsettings set org.gnome.shell.extensions.dash-to-dock intellihide "false"

   gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
   gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "40"

   echo "Settings dash to dock: Success."

   # Appearance
   gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"
   gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Light"
   gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Light"
   gsettings set org.gnome.desktop.interface cursor-theme "McMojave-cursors"

   gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"
   gsettings set org.gnome.desktop.screensaver picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"

   gsettings set org.gnome.desktop.interface font-name "Roboto 10"
   gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
   gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Medium 10"
   gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 10"

   echo "Settings appearance: Success."
}

Run
