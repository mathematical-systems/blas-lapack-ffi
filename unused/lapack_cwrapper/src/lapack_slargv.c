/*
 * lapack_slargv.c
 *
 *This program is a C interface to slargv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slargv(const int n, float * x, const int incx, float * y, const int incy, float * c, const int incc )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx, F77_incy=incy, F77_incc=incc;
#else
	#define F77_n n
	#define F77_incx incx
	#define F77_incy incy
	#define F77_incc incc
#endif

	f77_slargv(&F77_n, x, &F77_incx, y, &F77_incy, c, &F77_incc);

#ifdef F77_INT
#endif

}
