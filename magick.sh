#!/bin/bash
dimensions=$(identify "$1")
dimensions=$(echo "$dimensions" | awk -F"[ ]" '{print $3}')
echo "$dimensions"
height=$(echo "$dimensions" | awk -F"[x]" '{print $2}')
width=$(echo "$dimensions" | awk -F"[x]" '{print $1}')
echo "$height"
echo "$width"

for ((h=0;h<height;h++))
	do
	for ((w=0;w<width;w++))
		do
			convert example.png -format "%[pixel:p{$w,$h}]" info:-
		done
		echo
	done



