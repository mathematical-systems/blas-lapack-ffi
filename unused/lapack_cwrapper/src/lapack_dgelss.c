/*
 * lapack_dgelss.c
 *
 *This program is a C interface to dgelss.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgelss(const int m, const int n, const int nrhs, double * a, const int lda, double * b, const int ldb, double * s, const double rcond, int * rank, double * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_nrhs=nrhs, F77_lda=lda, F77_ldb=ldb, F77_lwork=lwork;
	int i_local;
	F77_INT F77_rank[1];
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_rank rank
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_dgelss(&F77_m, &F77_n, &F77_nrhs, a, &F77_lda, b, &F77_ldb, s, &rcond, F77_rank, work, &F77_lwork, F77_info);

#ifdef F77_INT
	rank[0]=(int) F77_rank[0];
	info[0]=(int) F77_info[0];
#endif

}
