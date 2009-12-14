/*
 * lapack_zgelsx.c
 *
 *This program is a C interface to zgelsx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgelsx(const int m, const int n, const int nrhs, void * a, const int lda, void * b, const int ldb, int * jpvt, const double rcond, int * rank, void * work, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_nrhs=nrhs, F77_lda=lda, F77_ldb=ldb;
	int i_local;
	F77_INT F77_jpvt[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_jpvt[i_local]=(F77_INT) jpvt[i_local];
	}
	F77_INT F77_rank[1];
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_jpvt jpvt
	#define F77_rank rank
	#define F77_info info
#endif

	f77_zgelsx(&F77_m, &F77_n, &F77_nrhs, a, &F77_lda, b, &F77_ldb, F77_jpvt, &rcond, F77_rank, work, rwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		jpvt[i_local]=(int) F77_jpvt[i_local];
	}

	rank[0]=(int) F77_rank[0];
	info[0]=(int) F77_info[0];
#endif

}
