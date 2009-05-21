/*
 * lapack_zladiv.c
 *
 *This program is a C interface to zladiv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_zladiv(const void * x, const void * y )
{

	double output;

#ifdef F77_INT
#else
#endif

	f77_zladiv(&output, x, y);

#ifdef F77_INT
#endif

return output;
}
