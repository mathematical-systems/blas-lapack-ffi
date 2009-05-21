/*
 * lapack_clarcm.c
 *
 *This program is a C interface to clarcm.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clarcm(const int m, const int n, const float * a, const int lda, const float * b, const int ldb, const void * c, const int ldc, float * rwork )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldc=ldc;
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldc ldc
#endif

	f77_clarcm(&F77_m, &F77_n, a, &F77_lda, b, &F77_ldb, c, &F77_ldc, rwork);

#ifdef F77_INT
#endif

}
