/*
 * lapack_dlaln2.c
 *
 *This program is a C interface to dlaln2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaln2(const long int ltrans, const int na, const int nw, const double smin, const double ca, const double * a, const int lda, const double d1, const double d2, const double * b, const int ldb, const double wr, const double wi, double * x, const int ldx, double * scale, double * xnorm, int * info )
{
#ifdef F77_INT
	F77_INT F77_na=na, F77_nw=nw, F77_lda=lda, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_na na
	#define F77_nw nw
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_ltrans=ltrans;
#else
	#define F77_ltrans ltrans
#endif

	f77_dlaln2(&F77_ltrans, &F77_na, &F77_nw, &smin, &ca, a, &F77_lda, &d1, &d2, b, &F77_ldb, &wr, &wi, x, &F77_ldx, scale, xnorm, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
