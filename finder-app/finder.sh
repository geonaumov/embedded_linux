#!/usr/bin/bash
set -e
echo "Argument 1: $(realpath $1)"
echo "Argument 2: $2"

#export filesdir = $1
#export searchstr = $2

if [ -z $1 ]
then 
	echo "Invalid argument"
	exit 1
fi

if [ -z $2 ]
then 
	echo "Invalid argument"
	exit 1
fi

if [ -d $(realpath $2) ]
then 	
	echo "Directory missing"
	exit 1
fi

NUM1=0
NUM2=0

for file in $(find $(realpath $1)) ; do
	if [ -f $file ]
	then
		RES1=$(grep $2 $file | cut -d " " -f 1 | sort | uniq | wc -l)
		RES2=$(grep $2 $file | sort | wc -l)
		NUM1=$(($NUM1+$RES1))
		NUM2=$(($NUM2+$RES2))
	fi
done 

#echo $FILES
#NUM1=$(echo $FILES | uniq | wc -l)
#NUM2=$(echo $FILES | wc -l)

echo "The number of files are $NUM1 and the number of matching lines are $NUM2"
