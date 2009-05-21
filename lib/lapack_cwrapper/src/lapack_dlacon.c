/*
 * lapack_dlacon.c
 *
 *This program is a C interface to dlacon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlacon(const int n, double * v, double * x, int * isgn, double * est, int * kase )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_isgn[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_isgn[i_local]=(F77_INT) isgn[i_local];
	}
	F77_INT F77_kase[1];
#else
	#define F77_n n
	#define F77_isgn isgn
	#define F77_kase kase
#endif

	f77_dlacon(&F77_n, v, x, F77_isgn, est, F77_kase);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		isgn[i_local]=(int) F77_isgn[i_local];
	}

	kase[0]=(int) F77_kase[0];
#endif

}
