/*
 * lapack_dlaein.c
 *
 *This program is a C interface to dlaein.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaein(const long int rightv, const long int noinit, const int n, const double * h, const int ldh, const double wr, const double wi, double * vr, double * vi, double * b, const int ldb, double * work, const double eps3, const double smlnum, const double bignum, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldh=ldh, F77_ldb=ldb;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldh ldh
	#define F77_ldb ldb
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_rightv=rightv, F77_noinit=noinit;
#else
	#define F77_rightv rightv
	#define F77_noinit noinit
#endif

	f77_dlaein(&F77_rightv, &F77_noinit, &F77_n, h, &F77_ldh, &wr, &wi, vr, vi, b, &F77_ldb, work, &eps3, &smlnum, &bignum, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
