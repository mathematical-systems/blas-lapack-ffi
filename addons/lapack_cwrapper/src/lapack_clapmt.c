/*
 * lapack_clapmt.c
 *
 *This program is a C interface to clapmt.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clapmt(const long int forwrd, const int m, const int n, void * x, const int ldx, int * k )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_ldx=ldx;
	int i_local;
	F77_INT F77_k[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_k[i_local]=(F77_INT) k[i_local];
	}
#else
	#define F77_m m
	#define F77_n n
	#define F77_ldx ldx
	#define F77_k k
#endif

#ifdef F77_LOG
	F77_LOG F77_forwrd=forwrd;
#else
	#define F77_forwrd forwrd
#endif

	f77_clapmt(&F77_forwrd, &F77_m, &F77_n, x, &F77_ldx, F77_k);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		k[i_local]=(int) F77_k[i_local];
	}

#endif

#ifdef F77_LOG
#endif

}
