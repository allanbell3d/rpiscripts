# Script to install Home Assistant supervised in raspberry

apt-get install -y software-properties-common apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat
systemctl disable ModemManager
systemctl stop ModemManager
curl -fsSL get.docker.com | sh

# curl -sL "https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh" | bash -s -- -m raspberrypi4

# Start of modified version
wget https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh
sed -i 's@answer\s<\s/dev/tty@answer@g' supervised-installer.sh
yes | bash supervised-installer.sh -s -- -m raspberrypi4
# End of modified version

rm supervised-installer.sh
exit

