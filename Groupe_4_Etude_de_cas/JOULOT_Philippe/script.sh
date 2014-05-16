#!/bin/bash

#Allocation des variables

tailleMatrice=2000
iterations=1000
partie=$2
kernelName="kernel$partie"

#Si le répertoire existe
if [ -d $partie ]; then
	#Nettoyage du répertoire
	echo "$partie - Nettoyage des résultats"
	for line in $(ls $partie)
	do
	sudo rm $partie/$line
	done
else
 echo "Création du dossier $partie"
 mkdir $partie
fi

# $1 nombre d'itérations

##############################################################
# PARTIE 1 : Code originel
##############################################################

###############################
# Compilation O2
###############################

gcc -c -O2 $kernelName.c
gcc -O2 -g test_archi.c $kernelName.o -o testOrigO2

# Meta-repetitions TEST 02
echo "$partie - GCC 02  en cours"
echo "###############################" >> $partie/resultatsGCC02.txt
echo "$partie - GCC 02" >> $partie/resultatsGCC02.txt
echo "###############################" >> $partie/resultatsGCC02.txt
for i in $(seq 1 $1)
do
	./testOrigO2 $tailleMatrice $iterations >> $partie/resultatsGCC02.txt
done

###############################
# Compilation O3
###############################

gcc -c -O3 $kernelName.c
gcc -O2 -g test_archi.c $kernelName.o -o testOrigO3

# Meta-repetitions TEST 03
echo "$partie - GCC 03  en cours"
echo "###############################" >> $partie/resultatsGCC03.txt
echo "$partie - GCC 03" >> $partie/resultatsGCC03.txt
echo "###############################" >> $partie/resultatsGCC03.txt

for i in $(seq 1 $1)
do
	./testOrigO3 $tailleMatrice $iterations >> $partie/resultatsGCC03.txt
done
###############################
# Compilation O3 native
###############################

gcc -c -O3 -march=native $kernelName.c
gcc -O2 -g -march=native test_archi.c $kernelName.o -o testOrigO3March


# Meta-repetitions TEST GCC 03 MARCH=NATIVE
echo "$partie - GCC 03 march en cours"
echo "###############################">>$partie/resultatsGCC03march.txt
echo "$partie - GCC 03 march">>$partie/resultatsGCC03march.txt
echo "###############################">>$partie/resultatsGCC03march.txt

for i in $(seq 1 $1)
do
	./testOrigO3March $tailleMatrice $iterations >> $partie/resultatsGCC03march.txt
done

###############################
# Compilation ICC O2
###############################

icc -c -O2 $kernelName.c
sudo chmod 777 $kernelName.o
gcc -O2 -g test_archi.c $kernelName.o -o testIccO2

# Meta-repetitions TEST ICC 02
echo "$partie - ICC 02 en cours"
echo "###############################" >> $partie/resultatsICC02.txt
echo "$partie - ICC 02" >> $partie/resultatsICC02.txt
echo "###############################" >> $partie/resultatsICC02.txt

for i in $(seq 1 $1)
do
	./testIccO2 $tailleMatrice $iterations >> $partie/resultatsICC02.txt
done

###############################
# Compilation ICC O3
###############################

icc -c -O3 $kernelName.c
gcc -O2 -g test_archi.c $kernelName.o -o testIccO3

# Meta-repetitions TEST ICC 03
echo "$partie - ICC 03 en cours"
echo "###############################" >> $partie/resultatsICC03.txt
echo "$partie - ICC 03" >> $partie/resultatsICC03.txt
echo "###############################" >> $partie/resultatsICC03.txt

for i in $(seq 1 $1)
do
	./testIccO3 $tailleMatrice $iterations >> $partie/resultatsICC03.txt
done

###############################
# Compilation ICC xHost
###############################

icc -c -g -O3 -xHost $kernelName.c
gcc -O2 test_archi.c $kernelName.o -o testIccxHost

# Meta-repetitions TEST ICC 03 xHost
echo "$partie - ICC 03xHost en cours"
echo "###############################">> $partie/resultatsICC03xHost.txt
echo "$partie - ICC 03xHost" >> $partie/resultatsICC03xHost.txt
echo "###############################">> $partie/resultatsICC03xHost.txt

for i in $(seq 1 $1)
do
	./testIccxHost $tailleMatrice $iterations >> $partie/resultatsICC03xHost.txt
done

###############################
#LIKWID PERFCTR
###############################

echo "$partie - LIKWID PERFCTR en cours"
echo "###############################">> $partie/resultats_likwid.txt
echo "$partie - LIKWID PERFCTR" >> $partie/resultats_likwid.txt
echo "###############################">> $partie/resultats_likwid.txt
sudo likwid-perfctr -C 1 -g L2CACHE ./testOrigO2 $tailleMatrice $iterations >> $partie/resultats_likwid.txt

###############################
#MAQAO
###############################
echo "$partie - MAQAO en cours"
echo "###############################">> $partie/resultats_maqao.txt
echo "$partie - MAQAO" >> $partie/resultats_maqao.txt
echo "###############################">> $partie/resultats_maqao.txt
./maqao.intel64/maqao cqa ./testOrigO2 fct=kernel >> $partie/resultats_maqao.txt

###############################
#Générer résumé
###############################

echo "$partie - Génération du résumé complet"
cat $partie/resultatsGCC02.txt >> $partie/resume
cat $partie/resultatsGCC03.txt >> $partie/resume
cat $partie/resultatsGCC03march.txt >> $partie/resume
cat $partie/resultatsICC02.txt >> $partie/resume
cat $partie/resultatsICC03.txt >> $partie/resume
cat $partie/resultatsICC03xHost.txt >> $partie/resume
cat $partie/resultats_likwid.txt >> $partie/resume
cat $partie/resultats_maqao.txt >> $partie/resume

#Désallouer les variables
unset tailleMatrice
