#! /bin/bash

if [[ "$(whoami)" == "root" ]]; then
   echo "Dont use super user."
   exit 1
fi

source "/home/$(whoami)/Downloads/installation/variables.sh"

if [[ -d "$FirefoxDirectory" ]]; then
    cp --recursive "/home/$user/Downloads/installation/Source/home/.mozilla/firefox/firefox-theme" "$FirefoxDirectory/firefox-theme"
else
    echo "Open firefox and start script."
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
