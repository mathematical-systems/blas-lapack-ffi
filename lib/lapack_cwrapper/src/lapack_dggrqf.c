/*
 * lapack_dggrqf.c
 *
 *This program is a C interface to dggrqf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dggrqf(const int m, const int p, const int n, double * a, const int lda, double * taua, double * b, const int ldb, double * taub, double * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_p=p, F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_p p
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_dggrqf(&F77_m, &F77_p, &F77_n, a, &F77_lda, taua, b, &F77_ldb, taub, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
