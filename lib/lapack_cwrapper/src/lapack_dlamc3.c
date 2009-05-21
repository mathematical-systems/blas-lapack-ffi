/*
 * lapack_dlamc3.c
 *
 *This program is a C interface to dlamc3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_dlamc3(const double a, const double b )
{

	double output;

#ifdef F77_INT
#else
#endif

	f77_dlamc3(&output, &a, &b);

#ifdef F77_INT
#endif

return output;
}
