/*
 * lapack_slar2v.c
 *
 *This program is a C interface to slar2v.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slar2v(const int n, float * x, float * y, float * z, const int incx, const float * c, const float * s, const int incc )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx, F77_incc=incc;
#else
	#define F77_n n
	#define F77_incx incx
	#define F77_incc incc
#endif

	f77_slar2v(&F77_n, x, y, z, &F77_incx, c, s, &F77_incc);

#ifdef F77_INT
#endif

}
