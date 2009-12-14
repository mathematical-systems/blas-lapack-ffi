/*
 * lapack_sptts2.c
 *
 *This program is a C interface to sptts2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sptts2(const int n, const int nrhs, const float * d, const float * e, float * b, const int ldb )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb;
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
#endif

	f77_sptts2(&F77_n, &F77_nrhs, d, e, b, &F77_ldb);

#ifdef F77_INT
#endif

}
