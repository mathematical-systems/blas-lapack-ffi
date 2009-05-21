/*
 * lapack_dgetrf.c
 *
 *This program is a C interface to dgetrf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgetrf(const int m, const int n, double * a, const int lda, int * ipiv, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_ipiv[m*n];
	for(i_local=0;i_local<m*n;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ipiv ipiv
	#define F77_info info
#endif

	f77_dgetrf(&F77_m, &F77_n, a, &F77_lda, F77_ipiv, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<m*n;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
