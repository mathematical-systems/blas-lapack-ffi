/*
 * lapack_cgeequ.c
 *
 *This program is a C interface to cgeequ.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgeequ(const int m, const int n, const void * a, const int lda, float * r, float * c, float * rowcnd, float * colcnd, float * amax, int * info )
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

	f77_cgeequ(&F77_m, &F77_n, a, &F77_lda, r, c, rowcnd, colcnd, amax, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
