#! /bin/bash

Colour='\033[1;31m'
less='\033[0m'

version='5.14.23'

echo -e "${Colour}\n\nThe system will now upgrade all the software and firmware, as well as clean up old/unused packages.\n\n${less}"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y

echo -e "${Colour}\n\nThe UniFi controller with version $version is downloading now.\n\n${less}"
wget http://dl.ui.com/unifi/$version/unifi_sysvinit_all.deb -O unifi_$version\_sysvinit_all.deb

echo -e "${Colour}\n\nBefore installing the UniFi Controller, it will first install OpenJDK 8.\n\n${less}"
sudo apt-get install openjdk-8-jre-headless -y

echo -e "${Colour}\n\nIn order to fix an issue which can cause a slow start for the UniFi controller, haveged is installed.\n\n${less}"
sudo apt-get install haveged -y

echo -e "${Colour}\n\nThe UniFi controller will be installed now.\n\n${less}"
sudo dpkg -i unifi_$version\_sysvinit_all.deb; sudo apt-get install -f -y
