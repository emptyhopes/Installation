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

# System

gsettings set org.gnome.desktop.interface color-scheme "default"
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent "true"
gsettings set org.gnome.desktop.interface clock-show-date "true"
gsettings set org.gnome.desktop.interface clock-show-seconds "true"
gsettings set org.gnome.desktop.interface clock-show-weekday "true"
gsettings set org.gnome.desktop.interface show-battery-percentage "true"
gsettings set org.gnome.mutter center-new-windows "true"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click "true"
gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"

echo "Settings up system: Success."

# Appearance

gsettings set org.gnome.shell disable-user-extensions false

for extension in ${Extensions[@]}; do
   gnome-extensions enable $extension
done

gsettings set org.gnome.desktop.interface icon-theme "MacOS-Icons"
gsettings set org.gnome.desktop.interface gtk-theme "MacOS-Themes"
gsettings set org.gnome.shell.extensions.user-theme name "MacOS-Themes"
gsettings set org.gnome.desktop.interface cursor-theme "MacOS-Cursors"

gsettings set org.gnome.desktop.background picture-uri "file:///$BackgroundsDirectory/MacOS-Backgrounds/MacOS.png"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///$BackgroundsDirectory/MacOS-Backgrounds/MacOS.png"

gsettings set org.gnome.desktop.interface font-name "Roboto 10"
gsettings set org.gnome.desktop.interface document-font-name "Roboto 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Medium 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 10"

sudo cp "$AvatarsDirectory/Avatar.jpg" "/home/$user/.face"

echo "Settings up appearance: Success."

# Terminal

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}

gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns "130"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows "32"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-transparent-background "true"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-transparency-percent "30"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors "false"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scroll-on-keystroke "true"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scroll-on-output "false"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-is-bright "true"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollback-unlimited "true"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" audible-bell "true"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color "#D0CFCC"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color "#171421"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#171421', '#c01c28', '#26a269', '#a2734c', '#12488b', '#a347ba', '#2aa1b3', '#d0cfcc', '#5e5c64', '#f66151', '#33da7a', '#e9ad0c', '#2a7bde', '#c061cb', '#33c7de', '#ffffff']"

echo "Settings up terminal: Success."

# Dash to dock

gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts "false"
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash "false"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed "true"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity "0.30"
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide "false"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "44"
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor "true"
gsettings set org.gnome.shell.extensions.dash-to-dock workspace-agnostic-urgent-windows "false"
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted "false"
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys "false"
gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup "true"
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors "true"
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme "false"
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style "DOTS"

echo "Settings up dash to dock: Success."
