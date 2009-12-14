/*
 * lapack_slag2.c
 *
 *This program is a C interface to slag2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slag2(const float * a, const int lda, const float * b, const int ldb, const float safmin, float * scale1, float * scale2, float * wr1, float * wr2, float * wi )
{
#ifdef F77_INT
	F77_INT F77_lda=lda, F77_ldb=ldb;
#else
	#define F77_lda lda
	#define F77_ldb ldb
#endif

	f77_slag2(a, &F77_lda, b, &F77_ldb, &safmin, scale1, scale2, wr1, wr2, wi);

#ifdef F77_INT
#endif

}
