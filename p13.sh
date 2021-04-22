#!/bin/bash

clear

if [[ $EUID -ne 0 ]]; then
   echo "Només pot ser executat com a usuari root" 
   exit 1
fi

clear
echo
echo -n "Escriu una adreça de correu electrònic: "
read correu
email='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$'

if [[ $correu =~ $email ]]
then
	echo $correu >> /etc/blackmail.list
	echo "L'adreça de correu electrònic s'ha afegit a /etc/blackmail.list"
else
	echo "L'adreça de correu electrònic és incorrecte"
	exit 5
fi
exit 0
