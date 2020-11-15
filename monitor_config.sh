
#! /bin/sh

mqtt_preferences=/home/pi/monitor/mqtt_preferences
ipaddress=$1
user=$2
password=$3
identity=$4

sed -i 's/mqtt_address=.*/mqtt_address='$ipaddress'/' $mqtt_preferences
sed -i 's/mqtt_user=.*/mqtt_user='$user'/' $mqtt_preferences
sed -i 's/mqtt_password=.*/mqtt_password='$password'/' $mqtt_preferences
sed -i "s/mqtt_publisher_identity=.*/mqtt_publisher_identity=\x27"$identity"\x27/" $mqtt_preferences

cat /home/pi/rpiscripts/monitor_config/behavior_preferences > /home/pi/monitor/behavior_preferences
cat /home/pi/rpiscripts/monitor_config/monitor-watcher.sh > /home/pi/monitor/monitor-watcher.sh
cat /home/pi/rpiscripts/monitor_config/system-watcher.sh > /home/pi/monitor/system-watcher.sh
cat /home/pi/rpiscripts/monitor_config/monitor.service > /etc/systemd/system/monitor.service

systemctl daemon-reload
systemctl restart monitor.service

# IP ADDRESS OR HOSTNAME OF MQTT BROKER
# mqtt_address=0.0.0.0

# MQTT BROKER USERNAME
# mqtt_user=username

# MQTT BROKER PASSWORD
# mqtt_password=password

# MQTT PUBLISH TOPIC ROOT
# mqtt_topicpath=monitor

# PUBLISHER IDENTITY
# mqtt_publisher_identity='BleNodexx'

# MQTT PORT
# mqtt_port='1883'

# MQTT CERTIFICATE FILE
# mqtt_certificate_path=''
