/*
 * lapack_dlapy3.c
 *
 *This program is a C interface to dlapy3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_dlapy3(const double x, const double y, const double z )
{

	double output;

#ifdef F77_INT
#else
#endif

	f77_dlapy3(&output, &x, &y, &z);

#ifdef F77_INT
#endif

return output;
}
