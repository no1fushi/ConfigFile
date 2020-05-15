#!/usr/bin/bash
cd `dirname $0`
echo -n Target file extension : 
read target
echo -n Conversion file extension : 
read conv

mkdir -p converted-${conv}

IFS=$'\n'
for FILE in *.webm;do
	FILENAME=`echo ${FILE} | sed 's/\.[^\.]*$//'`
	ffmpeg -i ${FILENAME}.${target} converted-${conv}/${FILENAME}.${conv}
done

