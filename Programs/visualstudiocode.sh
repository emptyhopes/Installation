#! /bin/bash

temporary=$(mktemp --directory)
curl --silent --location "https://az764295.vo.msecnd.net/stable/d045a5eda657f4d7b676dedbfa7aab8207f8a075/code_1.72.2-1665614327_amd64.deb" >"$temporary/visualstudiocode.deb"
sudo apt install "$temporary/visualstudiocode.deb" --yes
echo "Install visual studio code: Success."
