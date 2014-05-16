#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


/* NOYAU 
 * 
 * Faire du Loop UNROLL et Loop TILING
 * 
 * */
float kernel( int n , float a[n][n]);

/* READ TIME STAMP */
uint64_t rdtsc(void) {
  uint64_t a, d;
  __asm__ volatile ("rdtsc" : "=a" (a), "=d" (d));
  return (d<<32) | a;
}

float initialize(int size, float a[size][size]) {
	int i,j;
	for ( i = 0; i < size ; i ++){
		for ( j = 0; j < size ; j ++){
			a [ i ][ j ] = (float) rand()/RAND_MAX;
		}
	}
}

int cmpfunc (const void * a, const void * b)
{
   return ( *(int*)a - *(int*)b );
}

int main (int argc, char *argv[]) {
	int r;
	/* Récupération arguments */
	int size = atoi(argv[1]);
	int rept = atoi(argv[2]);
	srand(0);
	
    float *a = malloc(size * size * sizeof *a);
    
	/*Initialize*/
	initialize(size,(float (*)[size]) a);

	/* Warmup */
	printf("Valeur s = %f\n",kernel(size, (float (*)[size]) a)); 
	
	/* Stockage des résultats */
	float results[rept];
	float sum = 0.0;
	float denominateur;
	float numerateur;
	
	/* Répétitions */ 
	for (r=0; r<rept; r++){
		//printf("%d\n",r);
		uint64_t t1 = rdtsc();
		kernel(size, (float (*)[size]) a);
		uint64_t t2 = rdtsc();
		denominateur = t2-t1;
		numerateur = size*size;
		//printf("%.6f\n", denominateur/numerateur);
		results[r]=denominateur/numerateur;
		sum+=denominateur/numerateur;
	}
	//printf("%d\n",r);
	/* Affichage performance */
	qsort(results, rept, sizeof(float), &cmpfunc);
	printf("moy = %.6f\n", (float)sum/(float)rept);
	printf("min = %.6f\n", results[0]);
	printf("max = %.6f\n", results[rept-1]);
	printf("med = %.6f\n", results[rept/2]);
	return 0;
}


