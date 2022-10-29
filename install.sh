#!/bin/bash

ROOT_UID=0

LocalDirectoryExtensions="$HOME/.local/share/gnome-shell/extensions"
LocalDirectoryBackgrounds="$HOME/.local/share/backgrounds"
LocalDirectoryThemes="$HOME/.local/share/themes"
LocalDirectoryCursors="$HOME/.local/share/icons"
LocalDirectoryIcons="$HOME/.local/share/icons"
LocalDirectoryFonts="$HOME/.local/share/fonts"

RootDirectoryExtensions="/usr/share/gnome-shell/extensions"
RootDirectoryBackgrounds="/usr/share/share/backgrounds"
RootDirectoryThemes="/usr/share/share/themes"
RootDirectoryCursors="/usr/share/share/icons"
RootDirectoryIcons="/usr/share/share/icons"
RootDirectoryFonts="/usr/share/share/fonts"

if [[ "$UID" == "$ROOT_UID" ]]; then
   echo "Error: This script must be run as user."
   exit 1
fi

Run() {
   ClearTerminal

   InstallTelegram
   InstallVisualStudioCode

   InstallRepositories
   RemoveRepositories
   CleanRepositories
   UpdateRepositories
   UpgradeRepositories
   AutoremoveRepositories

   RemoveDirectory
   MakeDirectory

   DownloadExtensions
   #DownloadThemes
   #DownloadIcons
   #DownloadCursors
   #DownloadWallpapers
   DownloadFonts

   SystemSetup
}

ClearTerminal() {
   clear
}

InstallTelegram() {
   temporary=$(mktemp --directory)
   curl --location "https://telegram.org/dl/desktop/linux" >"$temporary/telegram.tar.xz"
   cd "$temporary"
   tar --extract --file "telegram.tar.xz"
   sudo mv "$temporary/Telegram" "/opt"
   sudo rm --recursive --force "$temporary"
   echo "Install telegram: Success."
}

InstallVisualStudioCode() {
   temporary=$(mktemp --directory)
   curl --silent --location "https://az764295.vo.msecnd.net/stable/d045a5eda657f4d7b676dedbfa7aab8207f8a075/code_1.72.2-1665614327_amd64.deb" >"$temporary/visualstudiocode.deb"
   sudo apt install "$temporary/visualstudiocode.deb" --yes
   echo "Install visual studio code: Success."
}

InstallRepositories() {
   sudo apt install curl git net-tools python3 nodejs npm kali-desktop-gnome --yes
}

RemoveRepositories() {
   sudo apt purge --autoremove polkitd catfish cherrytree engrampa king-phisher lightdm lightdm-gtk-* mate-calc mousepad onboard parole pulseaudio pulseaudio-* qt5ct qterminal ristretto thunar tex-* zutty --yes
}

CleanRepositories() {
   sudo apt clean --yes
}

UpdateRepositories() {
   sudo apt update --yes
}

UpgradeRepositories() {
   sudo apt upgrade --yes
   sudo apt dist-upgrade --yes
}

AutoremoveRepositories() {
   sudo apt autoremove --yes
}

RemoveDirectory() {
   # Local
   sudo rm --recursive --force "$LocalDirectoryExtensions"
   echo "Clear $LocalDirectoryExtensions: Success."
   sudo rm --recursive --force "$LocalDirectoryBackgrounds"
   echo "Clear $LocalDirectoryBackgrounds: Success."
   sudo rm --recursive --force "$LocalDirectoryThemes"
   echo "Clear $LocalDirectoryThemes: Success."
   sudo rm --recursive --force "$LocalDirectoryCursors"
   echo "Clear $LocalDirectoryCursors: Success."
   sudo rm --recursive --force "$LocalDirectoryIcons"
   echo "Clear $LocalDirectoryIcons: Success."
   sudo rm --recursive --force "$LocalDirectoryFonts"
   echo "Clear $LocalDirectoryFonts: Success."

   # Root
   sudo rm --recursive --force "$RootDirectoryExtensions"
   echo "Clear $RootDirectoryExtensions: Success."
   sudo rm --recursive --force "$RootDirectoryBackgrounds"
   echo "Clear $RootDirectoryBackgrounds: Success."
   sudo rm --recursive --force "$RootDirectoryThemes"
   echo "Clear $RootDirectoryThemes: Success."
   sudo rm --recursive --force "$RootDirectoryCursors"
   echo "Clear $RootDirectoryCursors: Success."
   sudo rm --recursive --force "$RootDirectoryIcons"
   echo "Clear $RootDirectoryIcons: Success."
   sudo rm --recursive --force "$RootDirectoryFonts"
   echo "Clear $RootDirectoryFonts: Success."
}

MakeDirectory() {
   mkdir "$LocalDirectoryExtensions"
   mkdir "$LocalDirectoryCursors"
   mkdir "$LocalDirectoryThemes"
   mkdir "$LocalDirectoryIcons"
   mkdir "$LocalDirectoryFonts"
}

DownloadExtensions() {
   BaseURL="https://extensions.gnome.org"
   GnomeVersion=$(gnome-shell --version | cut --delimiter=" " --fields="3")
   extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")
   for extension in ${extensions[@]}; do
      temporary=$(mktemp --directory)
      destination="$LocalDirectoryExtensions/$extension"
      url=$(GetDownloadURLExtension "$extension")
      curl --silent --location "$url" >"$temporary/$extension.zip"
      unzip -q "$temporary/$extension.zip" -d "$destination"
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

# DownloadThemes() {
#    temporary=$(mktemp --directory)
#    git clone --quiet "https://github.com/vinceliuice/WhiteSur-gtk-theme.git" "$temporary/Themes"
#    echo "Instaling themes..."
#    "$temporary/Themes/install.sh" --libadwaita --color "Light" --opacity "normal" --nautilus-style "glassy"
#    echo "Instaling tweaks..."
#    "$temporary/Themes/tweaks.sh" --firefox "monterey" --dash-to-dock --edit-firefox
#    sudo rm --recursive --force "$temporary"
#    echo "Install theme: Success."
# }

# DownloadIcons() {
#    temporary=$(mktemp --directory)
#    git clone --quiet "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "$temporary/Icons"
#    "$temporary/Icons/install.sh" --theme "default"
#    sudo rm --recursive --force "$temporary"
#    echo "Install icons: Success."
# }

# DownloadCursors() {
#    temporary=$(mktemp --directory)
#    git clone --quiet "https://github.com/vinceliuice/McMojave-cursors.git" "$temporary"
#    cd "$temporary"
#    "./install.sh"
#    cd "/"
#    sudo rm --recursive --force "$temporary"
#    echo "Install cursors: Success."
# }

# DownloadWallpapers() {
#    temporary=$(mktemp --directory)
#    git clone --quiet "https://github.com/vinceliuice/WhiteSur-wallpapers.git" "$temporary/Wallpapers"
#    sudo "$temporary/Wallpapers/install-gnome-backgrounds.sh" --theme "monterey" --screen "4k"
#    sudo rm --recursive --force "$temporary"
#    echo "Install wallpapers: Success."
# }

DownloadFonts() {
   temporary=$(mktemp --directory)
   curl --silent --location "https://fonts.google.com/download?family=Roboto" >"$temporary/fonts.zip"
   unzip -q "$temporary/fonts.zip" -d "$LocalDirectoryFonts"
   sudo rm --recursive --force "$temporary"
   echo "Install fonts: Success."
}

SystemSetup() {
   # System
   gsettings set org.gnome.desktop.interface clock-show-date "true"
   gsettings set org.gnome.desktop.interface clock-show-seconds "true"
   gsettings set org.gnome.desktop.interface clock-show-weekday "true"
   gsettings set org.gnome.desktop.interface show-battery-percentage "true"
   gsettings set org.gnome.mutter center-new-windows "true"
   echo "Settings up system: Success."

   # Dash to dock
   gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts "false"
   gsettings set org.gnome.shell.extensions.dash-to-dock show-trash "false"
   gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "true"
   gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity "0.30"
   gsettings set org.gnome.shell.extensions.dash-to-dock intellihide "false"
   gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
   gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "40"
   echo "Settings up dash to dock: Success."

   # Appearance
   #gsettings set org.gnome.desktop.interface icon-theme "WhiteSur"
   #gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Light"
   #gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Light"
   #gsettings set org.gnome.desktop.interface cursor-theme "McMojave-cursors"

   #gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"
   #gsettings set org.gnome.desktop.screensaver picture-uri "file:///usr/share/backgrounds/Monterey/Monterey-timed.xml"

   gsettings set org.gnome.desktop.interface font-name "Roboto 10"
   gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
   gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Medium 10"
   gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 10"
   echo "Settings up appearance: Success."
}

Run
