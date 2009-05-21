/*
 * lapack_slaln2.c
 *
 *This program is a C interface to slaln2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaln2(const long int ltrans, const int na, const int nw, const float smin, const float ca, const float * a, const int lda, const float d1, const float d2, const float * b, const int ldb, const float wr, const float wi, float * x, const int ldx, float * scale, float * xnorm, int * info )
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

	f77_slaln2(&F77_ltrans, &F77_na, &F77_nw, &smin, &ca, a, &F77_lda, &d1, &d2, b, &F77_ldb, &wr, &wi, x, &F77_ldx, scale, xnorm, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
