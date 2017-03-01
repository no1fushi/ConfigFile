#!/bin/bash

count=`ps aux | grep ruby `

if [ $count = 0 ]; then
	/home/pi/script/disbotstart
	echo "disbot restart" | mail -s "disbot downt" no1fushi@gmail.com
	else
		echo "ok"
fi
