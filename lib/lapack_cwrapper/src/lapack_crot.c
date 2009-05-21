/*
 * lapack_crot.c
 *
 *This program is a C interface to crot.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_crot(const int n, void * cx, const int incx, void * cy, const int incy, const float c, const void * s )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx, F77_incy=incy;
#else
	#define F77_n n
	#define F77_incx incx
	#define F77_incy incy
#endif

	f77_crot(&F77_n, cx, &F77_incx, cy, &F77_incy, &c, s);

#ifdef F77_INT
#endif

}
