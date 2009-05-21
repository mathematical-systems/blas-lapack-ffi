/*
 * lapack_slagv2.c
 *
 *This program is a C interface to slagv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slagv2(float * a, const int lda, float * b, const int ldb, float * alphar, float * alphai, float * beta, float * csl, float * snl, float * csr, float * snr )
{
#ifdef F77_INT
	F77_INT F77_lda=lda, F77_ldb=ldb;
#else
	#define F77_lda lda
	#define F77_ldb ldb
#endif

	f77_slagv2(a, &F77_lda, b, &F77_ldb, alphar, alphai, beta, csl, snl, csr, snr);

#ifdef F77_INT
#endif

}
