float kernel( int n , float a[n][n]){
	int i , j, k ;
	int sizeSum = 4;
	float s[sizeSum];
	float somme = 0.0;
	for( i=0; i < sizeSum ; i++) {
		s[i] = 0.0;
	}
	j=0;
	while(j<n-j-1)
	{
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
		i = 0;
		while(i < (n - (n%sizeSum))) {
			for( k=0; k < sizeSum ; k++) {
				s [k] += a [ n-j-1 ][ i ];
				i++;	
			}
		}
		for(k=n - (n%sizeSum); k < n; k++) {
			somme += a [ n-j-1 ][ k ];
		}
		j++;
	}
	if(j==n-j-1)
	{
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
