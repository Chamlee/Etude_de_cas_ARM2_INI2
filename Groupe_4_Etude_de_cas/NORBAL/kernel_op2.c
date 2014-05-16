float kernel( int n , float a[n][n]){
	int i , j, k ;
	int sizeSum = 4;
	float s[sizeSum];
	float somme = 0.0;
	for( i=0; i < sizeSum ; i++) {
		s[i] = 0.0;
	}
	
	for ( j = 0; j < n ; j ++){
		i = 0;
		while(i < (n - (n%sizeSum))) {
			for( k=0; k < sizeSum ; k++) {
				s [k] += a [ j ][ i ];
				i++;	
			}
		}
		for(k=n - (n%sizeSum); k < n; k++) {
			somme += a [ j ][ k ];
		}
	}
	for( i=0; i < sizeSum ; i++) {
		somme += s[i];
	}
	return somme ;
}
