********************************
Compilation
********************************

Voici un listing des commandes afin d'obtenir les résultats de l'étude:

* bash make.sh

Réalise tous les tests de l'étude en générant un dossier pour chaque optimisation réalisée 
contenant les résultats de chaque option compilation, le résultat likwid sur le cache L2,
 le réultat maqao ainsi qu'un fichier reprenant toutes ces informations.

* bash script.sh $1 $2

$1 est à remplacer par nombre de macro itérations. Le nombre d'itérations réalisée sera 
1000 fois plus important que le paramètre donné en entrée. Passé 1 en paramètre 
est suffisant pour des résultats stables.

$2 correspond au test à réalisé. Ce paramètre prend une valeur parmi Partie1, Partie2Optim1,
Partie2Optim2 ou Partie2Optim3

* bash makeclean.sh

Supprime tous les fichiers générés par make.sh ou script.sh

*********************************
Copyright ISTY 2014
*********************************

Ces programmes ont été réalisés dans le cadre d'une étude de cas encadré par Emmanuel OSERET.
