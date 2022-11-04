#! /bin/bash

user=$("whoami")

Extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")

InstallationDirectory="/home/$user/Downloads/installation"
LocalMozillaDirectory="/home/$user/.mozilla"
LocalShareDirectory="/home/$user/.local/share"
RootShareDirectory="/usr/share"

ExtensionsLocalDirectory="$LocalShareDirectory/gnome-shell/extensions"
BackgroundsLocalDirectory="$LocalShareDirectory/backgrounds"
ThemesLocalDirectory="$LocalShareDirectory/themes"
CursorsLocalDirectory="$LocalShareDirectory/icons"
IconsLocalDirectory="$LocalShareDirectory/icons"
FontsLocalDirectory="$LocalShareDirectory/fonts"

ExtensionsRootDirectory="$RootShareDirectory/gnome-shell/extensions"
BackgroundsRootDirectory="$RootShareDirectory/backgrounds"
ThemesRootDirectory="$RootShareDirectory/themes"
CursorsRootDirectory="$RootShareDirectory/icons"
IconsRootDirectory="$RootShareDirectory/icons"
FontsRootDirectory="$RootShareDirectory/fonts"

FirefoxDirectory="$LocalMozillaDirectory/firefox"
ExtensionsDirectory="$LocalShareDirectory/gnome-shell/extensions"
BackgroundsDirectory="$LocalShareDirectory/backgrounds"
ThemesDirectory="$LocalShareDirectory/themes"
CursorsDirectory="$LocalShareDirectory/icons"
IconsDirectory="$LocalShareDirectory/icons"
FontsDirectory="$LocalShareDirectory/fonts"
GnomeShellDirectory="$RootShareDirectory/gnome-shell"
