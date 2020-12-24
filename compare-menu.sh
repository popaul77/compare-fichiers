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

clear
source compare-fonction.sh
source couleurs

echo ""
echo -e "$(ColorOrange '[ _____ [ Comparaison de deux fichiers ] _____ ]') "
echo ""
echo -e "$(ColorOrange '[ il est necessaire que les deux fichiers a comparer soient dans le même dossier ]')"
echo ""
## Fonctions communes
fichiers12
echo ""
menage
tri

# Fonctions du menu

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
echo -ne " Menu Comparaison fichier_1 fichier_2
        $(ColorGreen '1)') Seulement dans fichier_2
        $(ColorGreen '2)') Dans fichier_1 et dans fichier_2 ou inversement
        $(ColorGreen '3)') Seulement dans fichier_1
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
echo -e "$(ColorRed '[ Un fichier paquets.txt sera créé dans: ]')$DIR"
echo ""
until [ "$a" = "0" ]; do
    menu
done
