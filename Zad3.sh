#!/bin/bash
IFS="\n"
MENU=1

while [ $MENU -gt 0 ]; do
    /usr/bin/clear

    echo "Menu works";
    echo "D - Pokaz nazwy podkatalogow nalezacych do roota w /proc";
    echo "E - Pokaz dowiazania symboliczne w /usr/lib";
    echo "F - wyjdz";


    read -n 1 opcja
    echo $opcja
    opcja=`echo $opcja | tr "[:upper:]" "[:lower:]"`

    /usr/bin/clear
    case $opcja in
        d)
                PODKATALOGI=`ls -l /proc | grep -e "^d" | awk '{print $9" "$3}' | grep -e "root$" | awk '{print $1}'`

                #ls -l /proc | grep -e "^d" | awk '{print $9" "$3}' | awk -F " " '{print $2}'
                #tasiemiec z linii wyzej dziala w przeciwienstwie do
                #`awk -F " " '{print $2}' $PODKATALOG`

                #for PODKATALOG in $PODKATALOGI
                #do
                        echo "$PODKATALOGI"
                #done
            ;;
        e)
                DOWIAZANIA=`ls -l /usr/lib | grep -e "^l" | awk '{print $9" "$10" "$11}'`
                ILE="0"
                for DOWIAZANIE in $DOWIAZANIA
                do
                        ILE=$(($ILE+1))
                         #echo"$DOWIAZANIA"
                done
                echo "$ILE"
            ;;
        f)
            MENU=0
            ;;
        *)
            echo "ZLA OPCJA"
            ;;
    esac

    sleep 3
done
