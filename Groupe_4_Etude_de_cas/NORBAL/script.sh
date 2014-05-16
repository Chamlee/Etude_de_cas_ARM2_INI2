#!/bin/bash

rm -f resultats
echo "==========PARTIE I==========" >> resultats
echo "~~~~~~~~~~~gcc -O2~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
gcc -O2 -c kernel_orig.c -o obj/kernel_orig.o
gcc -o bin/O2orig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/O2orig 500 1000  >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats

echo "~~~~~~~~~~~gcc -O3~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
gcc -O3 -c kernel_orig.c -o obj/kernel_orig.o
gcc -o bin/O3orig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/O3orig 500 1000  >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats

echo "~~~gcc -O3 -march=native~~~~" >> resultats
echo "---------compilation--------" >> resultats
gcc -O3 -march=native -c kernel_orig.c -o obj/kernel_orig.o
gcc -o bin/O3marchorig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/O3marchorig 500 1000 >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats

echo "~~~~~~~~~~icc -O2~~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
icc -O2 -c kernel_orig.c -o obj/kernel_orig.o
icc -o bin/iccO2orig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/iccO2orig 500 1000  >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats

echo "~~~~~~~~~~icc -O3~~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
icc -O3 -c kernel_orig.c -o obj/kernel_orig.o
icc -o bin/iccO3orig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/iccO3orig 500 1000  >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats

echo "~~~~~~~icc -O3 -xHost~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
icc -O3 -xHost -c kernel_orig.c -o obj/kernel_orig.o
icc -o bin/iccO3xorig obj/kernel_orig.o driver.c
echo "---------performance--------" >> resultats
./bin/iccO3xorig 500 1000   >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_orig.o >> resultats


echo "==========PARTIE II=========" >> resultats
echo "~~~~~~~~~performance~~~~~~~~" >> resultats
./bin/O2orig 90 1000 >> resultats
echo "~~~~~~~~~~~analyse~~~~~~~~~~" >> resultats
./bin/maqao cqa ./bin/O2orig loop=0 >> resultats
echo "~~~~~~~~~~~optim 1~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
gcc -O2 -c kernel_op1.c -o obj/kernel_op1.o
gcc -o bin/op1 obj/kernel_op1.o driver.c
echo "---------performance--------" >> resultats
./bin/op1 90 1000   >> resultats
echo "~~~~~~~~~~~analyse~~~~~~~~~~" >> resultats
./bin/maqao cqa ./bin/op1 loop=0 >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_op1.o >> resultats

echo "~~~~~~~~~~~optim 2~~~~~~~~~~" >> resultats
echo "---------compilation--------" >> resultats
gcc -O2 -c kernel_op2.c -o obj/kernel_op2.o
gcc -o bin/op2 obj/kernel_op2.o driver.c
echo "---------performance--------" >> resultats
./bin/op2 90 1000   >> resultats
echo "~~~~~~~~~~~analyse~~~~~~~~~~" >> resultats
./bin/maqao cqa ./bin/op1 loop=0 >> resultats
echo "---------assembleur---------" >> resultats
objdump -d obj/kernel_op2.o >> resultats
