/*
 * lapack_zggglm.c
 *
 *This program is a C interface to zggglm.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zggglm(const int n, const int m, const int p, void * a, const int lda, void * b, const int ldb, void * d, void * x, void * y, void * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_m=m, F77_p=p, F77_lda=lda, F77_ldb=ldb, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_m m
	#define F77_p p
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_zggglm(&F77_n, &F77_m, &F77_p, a, &F77_lda, b, &F77_ldb, d, x, y, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
