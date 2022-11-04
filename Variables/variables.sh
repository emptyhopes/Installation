#! /bin/bash

user=$("whoami")

Extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "blur-my-shell@aunetx")

LocalDirectoryExtensions="/home/$user/.local/share/gnome-shell/extensions"
LocalDirectoryBackgrounds="/home/$user/.local/share/backgrounds"
LocalDirectoryThemes="/home/$user/.local/share/themes"
LocalDirectoryCursors="/home/$user/.local/share/icons"
LocalDirectoryIcons="/home/$user/.local/share/icons"
LocalDirectoryFonts="/home/$user/.local/share/fonts"

RootDirectoryExtensions="/usr/share/gnome-shell/extensions"
RootDirectoryBackgrounds="/usr/share/backgrounds"
RootDirectoryThemes="/usr/share/themes"
RootDirectoryCursors="/usr/share/icons"
RootDirectoryIcons="/usr/share/icons"
RootDirectoryFonts="/usr/share/fonts"

ExtensionsDirectory="/home/$user/.local/share/gnome-shell/extensions"
FirefoxDirectory="/home/$user/.mozilla/firefox"
ThemesDirectory="/home/$user/.local/share/themes"
IconsDirectory="/home/$user/.local/share/icons"
CursorsDirectory="/home/$user/.local/share/icons"
FontsDirectory="/home/$user/.local/share/fonts"
BackgroundsDirectory="/home/$user/.local/share/backgrounds"
