#!/bin/bash

# Nettoyage de l'extraction
function menage() {
awk '{ print $2 }' $SID > /tmp/$SID
awk '{ print $2 }' $BUSTER > /tmp/$BUSTER
}

# On met en ordre
function tri() {
sort /tmp/$SID > /tmp/$SID"-1"
sort /tmp/$BUSTER > /tmp/$BUSTER"-1"
}

# On cherche ce qui n'est ni dans A ni dans B et on enleve les tabulations
function comm-3() {
comm -3 /tmp/$SID"-1" /tmp/$BUSTER"-1" | sed -r "s/\t//ig" > paquets.txt
}

#On cherche ce qui est dans B et pas dans A et on enleve les tabulations
function comm-2() {
comm -2 /tmp/$SID"-1" /tmp/$BUSTER"-1" | sed -r "s/\t//ig" > paquets.txt
}

#On cherche ce qui est dans A et pas dans B et on enleve les tabulations
function comm-1() {
comm -1 /tmp/$SID"-1" /tmp/$BUSTER"-1" | sed -r "s/\t//ig" > paquets.txt
}

############################################################################

function checkuid()
{
  if [ "$UID" -ne "$1" ]

    then
          echo -e "${RED} [ ERROR ]" "${NC} you must be root to install the server"
          exit 0

    else
          echo -e "${GREEN} [ OK ]" "${NC} UID ok, install in progress..."

fi
}

function espace_disque()
{
for disk in $(df |grep dev |grep -v tmpfs |grep -v udev| awk -F" " '{print $1}' | cut -d/ -f3)
    do
      echo $disk

        space_use=$(df -Th | grep "$disk" | awk -F" " '{print $4 "/" $5}' | cut -d% -f1)

      echo $space_use
}
