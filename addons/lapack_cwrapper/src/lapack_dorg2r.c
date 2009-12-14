/*
 * lapack_dorg2r.c
 *
 *This program is a C interface to dorg2r.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dorg2r(const int m, const int n, const int k, double * a, const int lda, const double * tau, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_k=k, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_k k
	#define F77_lda lda
	#define F77_info info
#endif

	f77_dorg2r(&F77_m, &F77_n, &F77_k, a, &F77_lda, tau, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
