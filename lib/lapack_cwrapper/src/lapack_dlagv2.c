/*
 * lapack_dlagv2.c
 *
 *This program is a C interface to dlagv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlagv2(double * a, const int lda, double * b, const int ldb, double * alphar, double * alphai, double * beta, double * csl, double * snl, double * csr, double * snr )
{
#ifdef F77_INT
	F77_INT F77_lda=lda, F77_ldb=ldb;
#else
	#define F77_lda lda
	#define F77_ldb ldb
#endif

	f77_dlagv2(a, &F77_lda, b, &F77_ldb, alphar, alphai, beta, csl, snl, csr, snr);

#ifdef F77_INT
#endif

}
