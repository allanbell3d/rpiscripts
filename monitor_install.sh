sudo apt-get install pi-bluetooth -y

# get repo key
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key

#add repo
sudo apt-key add mosquitto-repo.gpg.key

#download appropriate lists file 
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-buster.list

#update caches and install 
apt-cache search mosquitto
#sudo apt-get -y update
sudo apt update -y
sudo apt-get -y install -f libmosquitto-dev mosquitto mosquitto-clients libmosquitto1
sudo apt-get install bluez-hcidump
sudo apt-get install bc
cd ~

#clone this repo
git clone git://github.com/andrewjfreyer/monitor

#Execute monitor
cd monitor/
echo y | sudo bash monitor.sh #echo y to accept and install as service

