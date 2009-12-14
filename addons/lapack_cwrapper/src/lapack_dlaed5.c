/*
 * lapack_dlaed5.c
 *
 *This program is a C interface to dlaed5.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaed5(const int i, const double * d, const double * z, double * delta, const double rho, double * dlam )
{
#ifdef F77_INT
	F77_INT F77_i=i;
#else
	#define F77_i i
#endif

	f77_dlaed5(&F77_i, d, z, delta, &rho, dlam);

#ifdef F77_INT
#endif

}
