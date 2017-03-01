#!/bin/bash

count=`ps aux | grep ruby |wc -l`

if [ $count = 0 ]; then
	/home/pi/script/disbotstart
	echo "disbot restart" | mail -s "disbot downt" no1fushi@gmail.com
	else
		:
fi
