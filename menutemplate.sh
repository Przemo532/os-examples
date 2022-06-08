#!/bin/bash

MENU=1

while [ $MENU -gt 0 ]; do
    /usr/bin/clear

    echo "Menu works";
    echo "1 - to";
    echo "2 - tamto";
    echo "q - wyjdz";


    read -n 1 opcja
    echo $opcja
    opcja=`echo $opcja | tr "[:upper:]" "[:lower:]"`

    /usr/bin/clear
    case $opcja in
        1)
            echo "hej"
            ;;
        2)
            echo "tamto"
            ;;
        q)
            MENU=0
            ;;
        *)
            echo "ZLA OPCJA"
            ;;
    esac

    sleep 2
done
