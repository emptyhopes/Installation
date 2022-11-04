#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

if [[ -f "/home/$(whoami)/Downloads/installation/Variables/variables.sh" ]]; then
   source "/home/$(whoami)/Downloads/installation/Variables/variables.sh"
else
   echo "File variables not found."
   exit 1
fi

if [[ -d "$FirefoxDirectory" ]]; then
    cp --recursive "$InstallationDirectory/Source/home/.mozilla/firefox/firefox-theme" "$FirefoxDirectory/firefox-theme"
else
    echo "Open firefox firstly and start script."
    exit 1
fi

for default in "$FirefoxDirectory/"*"default"*; do

    if [[ -f "$default/prefs.js" ]]; then

       if [[ -d "$default/chrome" ]]; then
          ln -sf "$FirefoxDirectory/firefox-theme/Monterey" "$default/chrome"
          ln -sf "$FirefoxDirectory/firefox-theme/userChrome.css" "$default/chrome"

       else
          mkdir "$default/chrome"
          ln -sf "$FirefoxDirectory/firefox-theme/Monterey" "$default/chrome"
          ln -sf "$FirefoxDirectory/firefox-theme/userChrome.css" "$default/chrome"

       fi

       echo "user_pref(\"toolkit.legacyUserProfileCustomizations.stylesheets\", true);" >> "$default/prefs.js"
       echo "user_pref(\"browser.tabs.drawInTitlebar\", true);" >> "$default/prefs.js"
       echo "user_pref(\"browser.uidensity\", 0);" >> "$default/prefs.js"
       echo "user_pref(\"layers.acceleration.force-enabled\", true);" >> "$default/prefs.js"
       echo "user_pref(\"mozilla.widget.use-argb-visuals\", true);" >> "$default/prefs.js"

    fi

done
