# Script to install Home Assistant supervised in raspberry
sudo apt-get install -y software-properties-common apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat
sudo systemctl disable ModemManager
sudo systemctl stop ModemManager
sudo curl -fsSL get.docker.com | sh
sudo curl -sL "https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh" | bash -s -- -m raspberrypi4

