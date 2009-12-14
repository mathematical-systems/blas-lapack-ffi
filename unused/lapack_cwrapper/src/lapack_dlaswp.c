/*
 * lapack_dlaswp.c
 *
 *This program is a C interface to dlaswp.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaswp(const int n, double * a, const int lda, const int k1, const int k2, const int * ipiv, const int incx )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_k1=k1, F77_k2=k2, F77_incx=incx;
	int i_local;
	F77_INT F77_ipiv[incx*1];
	for(i_local=0;i_local<incx*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_k1 k1
	#define F77_k2 k2
	#define F77_ipiv ipiv
	#define F77_incx incx
#endif

	f77_dlaswp(&F77_n, a, &F77_lda, &F77_k1, &F77_k2, F77_ipiv, &F77_incx);

#ifdef F77_INT
#endif

}
