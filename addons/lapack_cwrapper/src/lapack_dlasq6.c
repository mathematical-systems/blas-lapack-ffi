/*
 * lapack_dlasq6.c
 *
 *This program is a C interface to dlasq6.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasq6(const int i0, const int n0, const double * z, const int pp, double * dmin, double * dmin1, double * dmin2, double * dn, double * dnm1, double * dnm2 )
{
#ifdef F77_INT
	F77_INT F77_i0=i0, F77_n0=n0, F77_pp=pp;
#else
	#define F77_i0 i0
	#define F77_n0 n0
	#define F77_pp pp
#endif

	f77_dlasq6(&F77_i0, &F77_n0, z, &F77_pp, dmin, dmin1, dmin2, dn, dnm1, dnm2);

#ifdef F77_INT
#endif

}
