#!/bin/bash
# Ce script compare deux fichiers generés par les commandes
# dpkg -l > buster.txt et dpkg -l > sid.txt
# qui fournissent la liste des paquets installés sur une distribution debian
#
#
# Je cherche a savoir ce qui n'est pas installé sur les machines en question.
#
#
## saisir lors du lancement le noms des deux fichiers a comparer et a trier.
# le resultat est dans le fichier "paquets.txt"
# il sera possible d'enlever les "echo" qui ont servi au deboggage
# JPG pour popaul77.org

SID="$1"
BUSTER="$2"

source compare-fonctions.sh
source couleurs


menage

tri

comm-1

comm-2

comm-3

# Fonctions menu

incorrect_selection() {
  echo $(ColorRed 'Incorrect_selection! Try again.')
}

press_enter() {
  echo ""
  echo -n " Press Enter to continue "
  read
  clear
}

# Menu

menu(){
echo -ne " My First Menu
        $(ColorGreen '1)') Seulement dans fichier_1
        $(ColorGreen '2)') Seulement dans fichier_2
        $(ColorGreen '3)') Dans fichier_1 et dans fichier_2
        $(ColorGreen '0)') Exit
        $(ColorBlue 'Choose an option:') "

        read a
        case $a in
	        1) comm-1 ; menu ;;
	        2) comm-2 ; menu ;;
	        3) comm-3 ; menu ;;
		      0) exit 0 ;;
          * ) clear ; incorrect_selection ; press_enter ;;
		      #*) echo -e $red "Wrong option." $clear; "Wrong Command." ;;
        esac
}

# Call the menu function

until [ "$a" = "0" ]; do
    menu
done