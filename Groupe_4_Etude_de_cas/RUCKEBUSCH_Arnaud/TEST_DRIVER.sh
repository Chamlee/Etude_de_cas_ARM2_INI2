##################### PARTIE I #####################


##################
######GCC O2######
##################
gcc -c -O2 kernel.c
gcc -O0 test_archi.c kernel.o -o test

./test_generique.sh resultatsGCCO2.txt

##################
######GCC O3######
##################
gcc -c -O2 kernel.c
gcc -O0 test_archi.c kernel.o -o test

./test_generique.sh resultatsGCCO3.txt

##################
######GCC O3 march######
##################
gcc -c -O3 -march=native kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsGCCO3_march.txt

##################
######GCC Ofast######
##################
gcc -c -Ofast kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsGCCOfast.txt

#Intel Compiler
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/lib/ia32
PATH=$PATH:/opt/intel/bin

##################
######ICC O2######
##################
icc -c -g -O2 kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsICCO2.txt

##################
######ICC O3######
##################
icc -c -g -O3 kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsICCO3.txt

##################
###ICC O3 xHost####
##################
icc -c -O3 -g -xHost kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsICCO3_xHost.txt

##################
####ICC 0fast#####
##################
icc -c -g -Ofast kernel.c
gcc -O0 test_archi.c kernel.o -o test
./test_generique.sh resultatsICCOfast.txt


##################### PARTIE II #####################

##################
#####OPTI 1#######
##################
gcc -c -O2 kernel_opti1.c
gcc -O0 test_archi.c kernel_opti1.o -o test

./test_generique.sh resultatsGCCO2_opti1.txt

##################
#####OPTI 1#######
##################
icc -c -g -O2 kernel_opti1.c
gcc -O0 test_archi.c kernel_opti1.o -o test

./test_generique.sh resultatsGCCO2_opti1_ICCVERSION.txt

##################
#####OPTI 2#######
##################

gcc -c -O2 kernel_opti2.c
gcc -O0 test_archi.c kernel_opti2.o -o test

./test_generique.sh resultatsGCCO2_opti2.txt





