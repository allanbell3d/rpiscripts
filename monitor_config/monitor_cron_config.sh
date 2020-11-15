#! /bin/sh

blenode=$1

minute=0
if [[ ${blenode} == 1 ]]
  then minute=0
elif [ ${blenode} == 2 ]
  then minute=10
elif [ ${blenode} -eq 3 ]
  then minute=20
elif [ ${blenode} -eq 4 ]
  then minute=30
elif [ ${blenode} -eq 5 ]
  then minute=40
elif [ ${blenode} -eq 6 ]
  then minute=50
elif [ ${blenode} -eq 7 ]
  then minute=5
elif [ ${blenode} -eq 8 ]
  then minute=15
elif [ ${blenode} -eq 9 ]
  then minute=25
fi

(crontab -l ; echo "* * * * * sudo /home/pi/monitor/monitor-watcher.sh") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "* * * * * sudo /home/pi/monitor/system-watcher.sh") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -

(crontab -l ; echo "$minute 4 */2 * * sudo reboot") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "$minute 2 * * * sudo systemctl restart monitor.service") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
(crontab -l ; echo "$minute 14 * * * sudo systemctl restart monitor.service") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
