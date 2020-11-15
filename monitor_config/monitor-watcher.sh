#!/bin/bash
LAST_ACTIVITY=$(date --date="$(journalctl -u monitor -n 1 -o short-iso --utc --quiet|awk '{ print $1 }')" +"%s")

ELAPSED=$(echo "$(date +"%s") - ${LAST_ACTIVITY}"|bc)

if [ ${ELAPSED} -gt 300 ]; then
	systemctl restart monitor
fi