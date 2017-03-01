#!/bin/bash

count=`ps aux | grep ruby `

if [ $count = 0 ]; then
	command
	echo "body" | mail -s "sub" mail@mail.com
	else
		echo "ok,green"
fi
