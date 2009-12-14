/*
 * lapack_cgtsv.c
 *
 *This program is a C interface to cgtsv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgtsv(const int n, const int nrhs, void * dl, void * d, void * du, void * b, const int ldb, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_info info
#endif

	f77_cgtsv(&F77_n, &F77_nrhs, dl, d, du, b, &F77_ldb, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
