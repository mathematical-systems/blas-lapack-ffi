/*
 * lapack_slasd4.c
 *
 *This program is a C interface to slasd4.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasd4(const int n, const int i, const float * d, const float * z, float * delta, const float rho, float * sigma, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_i=i;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_i i
	#define F77_info info
#endif

	f77_slasd4(&F77_n, &F77_i, d, z, delta, &rho, sigma, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
