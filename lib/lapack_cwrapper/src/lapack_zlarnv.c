/*
 * lapack_zlarnv.c
 *
 *This program is a C interface to zlarnv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlarnv(const int idist, int * iseed, const int n, void * x )
{
#ifdef F77_INT
	F77_INT F77_idist=idist, F77_n=n;
	int i_local;
	F77_INT F77_iseed[4*1];
	for(i_local=0;i_local<4*1;i_local++) {
		F77_iseed[i_local]=(F77_INT) iseed[i_local];
	}
#else
	#define F77_idist idist
	#define F77_iseed iseed
	#define F77_n n
#endif

	f77_zlarnv(&F77_idist, F77_iseed, &F77_n, x);

#ifdef F77_INT
	for(i_local=0;i_local<4*1;i_local++) {
		iseed[i_local]=(int) F77_iseed[i_local];
	}

#endif

}
