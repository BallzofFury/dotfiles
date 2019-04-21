#!/bin/bash

# Adding PPAs
sudo add-apt-repository -y ppa:geary-team/releases ppa:pmjdebruijn/darktable-release ppa:serge-rider/dbeaver-ce ppa:dhor/myway ppa:webupd8team/atom ppa:lutris-team/lutris ppa:snwh/ppa ppa:libreoffice/ppa ppa:inkscape.dev/stable

# Adding other sources
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

# Installing
sudo apt -y update
sudo apt -y install spotify-client geary darktable dbeaver-ce gpick gimp htop atom vim lutris paper-icon-theme arc-theme libreoffice inkscape
