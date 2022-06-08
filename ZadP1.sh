#!/bin/bash

IFS=$'\n'
USERS=`who | awk '{print $1}' | sort | uniq -c`
ALL=`awk 'BEGIN {FS=":";} { print $1" --- " $5" --- " $3 }' /etc/passwd`
i='0'
for USER in $USERS
do
        #echo "$USER"
        A=`awk '{print $2}' <<<$USER`
        C=`awk '{print $1}' <<<$USER`
        #echo "$A" A działa :D
        for ONE in $ALL
        do
                B=`awk '{print $1}' <<<$ONE`
                if [ $A == $B ]
                then
                        echo "$ONE --- $C"
                fi
        done
done
