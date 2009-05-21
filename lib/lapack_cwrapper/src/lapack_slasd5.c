/*
 * lapack_slasd5.c
 *
 *This program is a C interface to slasd5.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasd5(const int i, const float * d, const float * z, float * delta, const float rho, float * dsigma, float * work )
{
#ifdef F77_INT
	F77_INT F77_i=i;
#else
	#define F77_i i
#endif

	f77_slasd5(&F77_i, d, z, delta, &rho, dsigma, work);

#ifdef F77_INT
#endif

}
