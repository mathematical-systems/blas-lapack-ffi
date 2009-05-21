/*
 * lapack_clacgv.c
 *
 *This program is a C interface to clacgv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clacgv(const int n, void * x, const int incx )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx;
#else
	#define F77_n n
	#define F77_incx incx
#endif

	f77_clacgv(&F77_n, x, &F77_incx);

#ifdef F77_INT
#endif

}
