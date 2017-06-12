#!/bin/bash

# Cleanup for testing
rm -rf ~/repos

# Install Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm google-chrome*.deb

# Install Steam
wget -E http://media.steampowered.com/client/installer/steam.deb
sudo dpkg -i steam.deb
