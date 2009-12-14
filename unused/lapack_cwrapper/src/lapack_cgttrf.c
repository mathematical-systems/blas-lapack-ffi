/*
 * lapack_cgttrf.c
 *
 *This program is a C interface to cgttrf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgttrf(const int n, void * dl, void * d, void * du, void * du2, int * ipiv, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ipiv ipiv
	#define F77_info info
#endif

	f77_cgttrf(&F77_n, dl, d, du, du2, F77_ipiv, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
