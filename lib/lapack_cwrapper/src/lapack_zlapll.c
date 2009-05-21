/*
 * lapack_zlapll.c
 *
 *This program is a C interface to zlapll.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlapll(const int n, void * x, const int incx, void * y, const int incy, double * ssmin )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx, F77_incy=incy;
#else
	#define F77_n n
	#define F77_incx incx
	#define F77_incy incy
#endif

	f77_zlapll(&F77_n, x, &F77_incx, y, &F77_incy, ssmin);

#ifdef F77_INT
#endif

}
