#!/bin/bash

DZIEN=`date +"%d"`
DZIEN=`expr $DZIEN - 1`
#echo "$DZIEN"
MIESIAC=`date +"%m"`
MIESIAC=`expr $MIESIAC + 0`
NDATA="$DZIEN:$MIESIAC"
DATA=`date +"%d:%m"`
OSOBY=`tabgen | awk  'BEGIN{FS = "[ \t]+"};{print $2":"$3}'`
X="0"

for OSOBA in $OSOBY
do
        #echo "$OSOBA"
        if [ $OSOBA == $NDATA ]
        then
                X=$(($X+1))
                #echo "$OSOBA"
        fi
done

#echo "$DZIEN"
echo "Dzisiaj mamy $DATA. Wczoraj urodziny mialo $X osob."
