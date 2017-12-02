#!/bin/bash
#set -v -x
#test 1
dimensions=$(identify "$1")
dimensions=$(echo "$dimensions" | awk -F"[ ]" '{print $3}')
#echo "$dimensions"
height=$(echo "$dimensions" | awk -F"[x]" '{print $2}')
width=$(echo "$dimensions" | awk -F"[x]" '{print $1}')
echo "$width"  # x -dim
echo "$height"  #y -dim
#allpixs=$(convert "$1" txt: | awk -F"[ ]" '{print $3}')
#echo "$allpixs"
#for i in $allpixs; do
#	#pixs=$(echo $i | awk -F"[ ]" '{print $3}')
#	echo $i
#done
#allpixs=$(echo $allpixs | awk -F"[ ]" '{print $3}')
#echo "$allpixs"



#for ((h=0;h<height;h++))
#	do
#	for ((w=0;w<width;w++))
#		do
#			convert "$1" -format "%[pixel:p{$w,$h}]" info:-
#			echo
#		done
#	done

convert "$1" -format "%[fx:floor(255*u.r)],%[fx:floor(255*u.g)],%[fx:floor(255*u.b)]" txt: | tail -n +2| while read line; do
    VAR=( $line )
	echo ${VAR[3]}   #  2 for hexvalues, 3 for srgb-decimal
	OLDIFS=$IFS
	#IFS="# "
	
	#echo ${VAR[2]}   #  2 for hexvalues, 3 for srgb-decimal
	IFS=$OLDIFS
	#echo $line | awk -F"[ ]" '{print $4}'
done
