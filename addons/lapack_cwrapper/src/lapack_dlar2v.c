/*
 * lapack_dlar2v.c
 *
 *This program is a C interface to dlar2v.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlar2v(const int n, double * x, double * y, double * z, const int incx, const double * c, const double * s, const int incc )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx, F77_incc=incc;
#else
	#define F77_n n
	#define F77_incx incx
	#define F77_incc incc
#endif

	f77_dlar2v(&F77_n, x, y, z, &F77_incx, c, s, &F77_incc);

#ifdef F77_INT
#endif

}
