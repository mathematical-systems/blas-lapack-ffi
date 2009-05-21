/*
 * lapack_dgeequ.c
 *
 *This program is a C interface to dgeequ.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgeequ(const int m, const int n, const double * a, const int lda, double * r, double * c, double * rowcnd, double * colcnd, double * amax, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_info info
#endif

	f77_dgeequ(&F77_m, &F77_n, a, &F77_lda, r, c, rowcnd, colcnd, amax, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
