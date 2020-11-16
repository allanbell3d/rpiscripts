sudo timedatectl set-timezone Asia/Dubai
# sudo raspi-config nonint do_hostname blenode
sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
sudo rpi-eeprom-update -a
sudo reboot
