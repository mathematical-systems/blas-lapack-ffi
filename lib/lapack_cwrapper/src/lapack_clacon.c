/*
 * lapack_clacon.c
 *
 *This program is a C interface to clacon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clacon(const int n, void * v, void * x, float * est, int * kase )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_kase[1];
#else
	#define F77_n n
	#define F77_kase kase
#endif

	f77_clacon(&F77_n, v, x, est, F77_kase);

#ifdef F77_INT
	kase[0]=(int) F77_kase[0];
#endif

}
