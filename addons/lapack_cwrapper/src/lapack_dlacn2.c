/*
 * lapack_dlacn2.c
 *
 *This program is a C interface to dlacn2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlacn2(const int n, double * v, double * x, int * isgn, double * est, int * kase, int * isave )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_isgn[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_isgn[i_local]=(F77_INT) isgn[i_local];
	}
	F77_INT F77_kase[1];
	F77_INT F77_isave[3*1];
	for(i_local=0;i_local<3*1;i_local++) {
		F77_isave[i_local]=(F77_INT) isave[i_local];
	}
#else
	#define F77_n n
	#define F77_isgn isgn
	#define F77_kase kase
	#define F77_isave isave
#endif

	f77_dlacn2(&F77_n, v, x, F77_isgn, est, F77_kase, F77_isave);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		isgn[i_local]=(int) F77_isgn[i_local];
	}

	kase[0]=(int) F77_kase[0];
	for(i_local=0;i_local<3*1;i_local++) {
		isave[i_local]=(int) F77_isave[i_local];
	}

#endif

}
