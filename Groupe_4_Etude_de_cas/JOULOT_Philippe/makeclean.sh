rm *.o
if [ -d Partie1 ]; then
rm -R Partie1
fi
if [ -d Partie2Optim1 ]; then
rm -R Partie2Optim1
fi
if [ -d Partie2Optim2 ]; then
rm -R Partie2Optim2
fi
if [ -d Partie2Optim3 ]; then
rm -R Partie2Optim3
fi
rm -R testIcc*
rm -R testOrig*
rm -R *~

