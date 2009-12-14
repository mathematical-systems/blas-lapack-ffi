/*
 * lapack_izmax1.c
 *
 *This program is a C interface to izmax1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

int lapack_izmax1(const int n, const void * cx, const int incx )
{

	int output;

#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx;
#else
	#define F77_n n
	#define F77_incx incx
#endif

	f77_izmax1(&output, &F77_n, cx, &F77_incx);

#ifdef F77_INT
#endif

return output;
}
