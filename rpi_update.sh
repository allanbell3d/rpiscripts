#!/bin/sh
sudo timedatectl set-timezone Asia/Dubai
sudo raspi-config nonint do_wifi_country US
# sudo raspi-config nonint do_hostname blenode
sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
sudo apt-get -y install git
sudo rpi-eeprom-update -a
echo:
echo Update finished, rebooting


