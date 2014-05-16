float kernel( int n , float a[n][n]){
	int i , j ;
	float s = 0.0;
	for ( i = 0; i < n ; i ++){
		for ( j = 0; j < n ; j ++){
			s += a [ i ][ j ];
		}
	}
	return s ;
}


