#!/usr/bin/bash
set -e

if [ -z $1 ] ; then
	echo "Missing argument"
	exit 1
fi

if [ -z $2 ] ; then 
	echo "Missing argument"
	exit 1
fi

echo $1
echo $2

if [ ! -d $(dirname $1) ] ; then
	mkdir -pv $(dirname $1)
fi

rm -rf $1
touch $1 || { echo 'Cannot create file' ; exit 1; }

echo $2 >> $1

