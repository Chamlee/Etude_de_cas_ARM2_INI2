#!/bin/bash


#lancement pour la partie 1 et les 2 optims faites pour la partie 2
list="Partie1 Partie2Optim1 Partie2Optim2 Partie2Optim3"   
for element in $list    
do   
	bash script.sh 1 $element
done
