/*
 * lapack_claqp2.c
 *
 *This program is a C interface to claqp2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claqp2(const int m, const int n, const int offset, void * a, const int lda, int * jpvt, void * tau, float * vn1, float * vn2, void * work )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_offset=offset, F77_lda=lda;
	int i_local;
	F77_INT F77_jpvt[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_jpvt[i_local]=(F77_INT) jpvt[i_local];
	}
#else
	#define F77_m m
	#define F77_n n
	#define F77_offset offset
	#define F77_lda lda
	#define F77_jpvt jpvt
#endif

	f77_claqp2(&F77_m, &F77_n, &F77_offset, a, &F77_lda, F77_jpvt, tau, vn1, vn2, work);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		jpvt[i_local]=(int) F77_jpvt[i_local];
	}

#endif

}
