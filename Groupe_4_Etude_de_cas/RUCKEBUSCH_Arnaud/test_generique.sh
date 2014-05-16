# Meta-repetitions
if [ -e $1 ]; then
	rm -f $1
fi

for i in $(seq 1 31)
do
	./test 200 100 >> tri_des_resultats_tmp.txt
done

#TRI DES RESULTATS

sort tri_des_resultats_tmp.txt > $1
rm -f tri_des_resultats_tmp.txt

#MAQAO

echo "###############################
######### ANALYSE MAQAO #######
###############################" >> $1

./maqao cqa ./test fct=kernel uarch=SANDY_BRIDGE >> $1

#LIKWID

sudo modprobe msr
sudo chmod 777 /dev/cpu/*/msr

echo "###############################
######## ANALYSE LIKWID #######
###############################" >> $1

sudo likwid-perfctr -C 1 -g L2CACHE ./test 200 100 >> $1

echo "###############################
######## ANALYSE BINAIRE #######
###############################" >> $1

objdump -d test >> $1

