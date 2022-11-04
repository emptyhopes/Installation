#! /bin/bash

user=$("whoami")

Extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")

InstallationDirectory="/home/$user/Downloads/installation"
LocalMozillaDirectory="/home/$user/.mozilla"
LocalShareDirectory="/home/$user/.local/share"
RootShareDirectory="/usr/share"

LocalDirectoryExtensions="$LocalShareDirectory/gnome-shell/extensions"
LocalDirectoryBackgrounds="$LocalShareDirectory/backgrounds"
LocalDirectoryThemes="$LocalShareDirectory/themes"
LocalDirectoryCursors="$LocalShareDirectory/icons"
LocalDirectoryIcons="$LocalShareDirectory/icons"
LocalDirectoryFonts="$LocalShareDirectory/fonts"

RootDirectoryExtensions="$RootShareDirectory/gnome-shell/extensions"
RootDirectoryBackgrounds="$RootShareDirectory/backgrounds"
RootDirectoryThemes="$RootShareDirectory/themes"
RootDirectoryCursors="$RootShareDirectory/icons"
RootDirectoryIcons="$RootShareDirectory/icons"
RootDirectoryFonts="$RootShareDirectory/fonts"

ExtensionsDirectory="$LocalShareDirectory/gnome-shell/extensions"
FirefoxDirectory="$LocalMozillaDirectory/firefox"
ThemesDirectory="$LocalShareDirectory/themes"
IconsDirectory="$LocalShareDirectory/icons"
CursorsDirectory="$LocalShareDirectory/icons"
FontsDirectory="$LocalShareDirectory/fonts"
BackgroundsDirectory="$LocalShareDirectory/backgrounds"
