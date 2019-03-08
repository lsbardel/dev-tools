#/bin/bash

wget -O /tmp/wallpaper.jpg https://unsplash.it/2560/1440/?random
gsettings set org.gnome.desktop.background picture-uri file:///tmp/wallpaper.jpg