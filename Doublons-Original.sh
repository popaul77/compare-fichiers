#!/bin/bash
# Ce script compare deux fichiers generés par les commandes
# dpkg -l > buster.txt et dpkg -l > sid.txt
# qui fournissent la liste des paquets installés sur une distribution debian
#
#
# Je cherche a savoir ce qui n'est pas installé sur les machines en question.
#
############################################################################
## saisir lors du lancement le noms des deux fichiers a comparer et a trier.
# le resultat est dans le fichier "paquets.txt"
# il sera possible d'enlever les "echo" qui ont servi au deboggage
# JPG pour popaul77.org
#############################################################################


SID="$1"
BUSTER="$2"

echo $1
echo $2

awk '{ print $2 }' $SID > /tmp/$SID
awk '{ print $2 }' $BUSTER > /tmp/$BUSTER

echo /tmp/$SID
echo /tmp/$BUSTER

sort /tmp/$SID > /tmp/$SID"-1"
sort /tmp/$BUSTER > /tmp/$BUSTER"-1"

echo /tmp/$SID"-1"
echo /tmp/$BUSTER"-1"

# -3 on cherche ce qui n'est ni dans A ni dans B
# voir le man pour exemple
comm -3 /tmp/$SID"-1" /tmp/$BUSTER"-1" > final.txt

## on enleve les tabulations qui trainent
# on pourrait PIPER | la commande sed a la commande comm
# comm -3 /tmp/$SID"-1" /tmp/$BUSTER"-1" | sed -r "s/\t//ig" > paquets.txt
sed -r "s/\t//ig" < final.txt > paquets.txt

rm final.txt
