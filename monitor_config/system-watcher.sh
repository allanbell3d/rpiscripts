#!/bin/bash
dmesg|tail -n 20|grep -q "Fixing recursive fault but reboot is needed!"
if [ ${?} -eq 0 ]; then
	/sbin/reboot --no-wall
fi