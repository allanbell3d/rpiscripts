# Script to install Home Assistant supervised in raspberry

apt-get install -y software-properties-common apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat
systemctl disable ModemManager
systemctl stop ModemManager
curl -fsSL get.docker.com | sh
yes | curl -sL "https://raw.githubusercontent.com/Kanga-Who/home-assistant/master/supervised-installer.sh" | sed 's@answer\s<\s/dev/tty@answer@g' | bash -s -- -m raspberrypi4
exit

