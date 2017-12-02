#!/bin/bash
#set -x -v
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BLACK='\033[0;30m'
YELLOW='\033[1;33m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color


read  width
read  height
echo "Height is $height"
echo "Width is $width"


#N=0
M=0


#set -a colorarray

while read temp
do
OLDIFS=$IFS
IFS=",()"
VAR=( $temp )
r=${VAR[1]}
g=${VAR[2]}
b=${VAR[3]}
IFS=$OLDIFS

#r=$(echo "$temp" | awk -F"[,()]" '{print $2}')
#g=$(echo "$temp" | awk -F"[,()]" '{print $3}')
#b=$(echo "$temp" | awk -F"[,()]" '{print $4}')

#echo "$r $g $b"
if [ $temp == "white" ] || [ $temp == "snow" ]; then
	printf "${NC}0"
elif [ $temp == "grey98" ] || [ $temp == "grey99" ] || [ $temp == "grey2" ] || [ $temp == "grey1" ]; then
	printf "${GRAY}0"
elif [ $temp == "black" ]; then
	printf "${BLACK}0"
elif [ $temp == "LightYellow" ]; then
	printf "${YELLOW}0"
elif [ $r -eq $r ] 2>/dev/null; then
	if [ $r -gt 150 ] && [ $g -gt 150 ]; then
		printf "${YELLOW}0"
	elif [ $r -gt $g ]; then
		if [ $r -gt $b ]; then
			printf "${RED}0"
		else
			printf "${BLUE}0"
		fi
	elif [ $g -gt $b ]; then
		printf "${GREEN}0"
	else
		printf "${BLUE}0"
	fi
else 
	printf "${NC}0"
fi

#if [ $temp == "white" ]; then
#	echo -n "@"
#else
#	echo -n "0"
#fi
#colorarray[$N]=$temp
#N=$((N+1))
M=$((M+1))
if [ $M -eq $width ] ; then
	echo
	M=0
fi
done

# read temp
# colorarray[$N]=$temp
# N=$((N+1))
# read temp
# colorarray[$N]=$temp
# N=$((N+1))


# #read colorarray[0]

# #read colorarray[1]

# #read colorarray[2]

# echo ${colorarray[@]}
# echo ${colorarray[0]}
# echo ${colorarray[1]}
# echo ${colorarray[2]}


# #while read

printf "${NC}"
