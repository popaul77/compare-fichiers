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
<<<<<<< HEAD
=======

#On cherche les fichiers a comparer
function fichiers12(){
  echo -e "${ColorGreen} Les deux fichiers sont dans le même dossier YES/NO"
    read -p "Etes vous sur ? " -n 1 -r

    echo ""

      if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
      fi

  echo -e "${ColorGreen} Entrer le chemin relatif du dossier contenant les dossiers a comparer."
    read Enter
      DIR=$HOME/$Enter
        cd $DIR

  echo -e "${ColorGreen} Entrer le nom du  fichier 1."
    read SID

  echo -e "${ColorGreen} Entrer le nom du fichier 2."
    read BUSTER
}
>>>>>>> Dev-sources-fichiers
