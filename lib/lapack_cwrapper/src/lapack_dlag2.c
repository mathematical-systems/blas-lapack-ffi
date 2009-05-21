/*
 * lapack_dlag2.c
 *
 *This program is a C interface to dlag2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlag2(const double * a, const int lda, const double * b, const int ldb, const double safmin, double * scale1, double * scale2, double * wr1, double * wr2, double * wi )
{
#ifdef F77_INT
	F77_INT F77_lda=lda, F77_ldb=ldb;
#else
	#define F77_lda lda
	#define F77_ldb ldb
#endif

	f77_dlag2(a, &F77_lda, b, &F77_ldb, &safmin, scale1, scale2, wr1, wr2, wi);

#ifdef F77_INT
#endif

}
