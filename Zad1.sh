#!/bin/bash
#IFS='/n'

if [ -f "$3" ]
then
        rm $3
fi

if [ $# -lt 3 ]
then
        echo "Podano za malo parametrow. Uprasza sie o podanie co najmniej 3 argumentow"
else
        #echo "Aktualna 2: $2"
        PLIKI=`ls -l /$2 | grep -e "^-" | awk '{print $NF}'`
        #`find /etc -type f -ls -readable`
        #`ls -lr /$2 | grep -e "^-" | awk '{print $NF}'`
        #echo "$PLIKI"
        SUMA="0"
        KONTROLKA="0"
        for PLIK in $PLIKI
        do
                ROZSZERZENIE=`ls /$2/$PLIK | awk -F "." '{print $NF}'`
                #echo "$ROZSZERZENIE i $1"
                if [ $ROZSZERZENIE == $1 ]
                then
                KONTROLKA=$(($KONTROLKA+1))
                MDATA=`date -r /$2/$PLIK`
                echo "" 1>> $3
                echo "lp $KONTROLKA. ------- $PLIK ------ data ostatniej modyfikacji: $MDATA " 1>> $3
                head -n 5 /$2/$PLIK 2> /dev/null 1>> $3
                LINIJKI=`cat /$2/$PLIK  2> /dev/null | wc -l`
                #if [ ${#LINIJKI} -gt 0 ]
                #then
                        SUMA=$(( $SUMA + $LINIJKI ))
                        #echo "$PLIK"
                #fi
                fi
        done
        echo "-------" 1>> $3
        echo "Suma linijek w plikach spelniajacych warunki = $SUMA" 1>> $3
        #echo "Kontrolka: $KONTROLKA"
        #echo "$3"
fi
