********************************
Compilation
********************************

Voici un listing des commandes afin d'obtenir les r�sultats de l'�tude:

* bash make.sh

R�alise tous les tests de l'�tude en g�n�rant un dossier pour chaque optimisation r�alis�e 
contenant les r�sultats de chaque option compilation, le r�sultat likwid sur le cache L2,
 le r�ultat maqao ainsi qu'un fichier reprenant toutes ces informations.

* bash script.sh $1 $2

$1 est � remplacer par nombre de macro it�rations. Le nombre d'it�rations r�alis�e sera 
1000 fois plus important que le param�tre donn� en entr�e. Pass� 1 en param�tre 
est suffisant pour des r�sultats stables.

$2 correspond au test � r�alis�. Ce param�tre prend une valeur parmi Partie1, Partie2Optim1,
Partie2Optim2 ou Partie2Optim3

* bash makeclean.sh

Supprime tous les fichiers g�n�r�s par make.sh ou script.sh

*********************************
Copyright ISTY 2014
*********************************

Ces programmes ont �t� r�alis�s dans le cadre d'une �tude de cas encadr� par Emmanuel OSERET.
