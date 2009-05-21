/*
 * lapack_dlapy2.c
 *
 *This program is a C interface to dlapy2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_dlapy2(const double x, const double y )
{

	double output;

#ifdef F77_INT
#else
#endif

	f77_dlapy2(&output, &x, &y);

#ifdef F77_INT
#endif

return output;
}
