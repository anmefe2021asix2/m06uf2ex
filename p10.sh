#!/bin/bash

clear

if [[ $EUID -ne 0 ]]; then
   echo "Només pot ser executat com a usuari root" 
   exit 1
fi

echo -n "Introdueix un nom del grup del sistema: "
read grup

cat /etc/group | grep "$grup" | grep -o -E '[0-9]+'

if [[ $? -ne 0 ]]; then
    echo "El grup ${grup} no existeix al sistema"
    exit 5
fi
exit 10
