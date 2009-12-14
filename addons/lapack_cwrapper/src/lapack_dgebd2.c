/*
 * lapack_dgebd2.c
 *
 *This program is a C interface to dgebd2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgebd2(const int m, const int n, double * a, const int lda, double * d, double * e, double * tauq, double * taup, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_info info
#endif

	f77_dgebd2(&F77_m, &F77_n, a, &F77_lda, d, e, tauq, taup, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
