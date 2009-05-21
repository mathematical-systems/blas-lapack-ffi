/*
 * lapack_dladiv.c
 *
 *This program is a C interface to dladiv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dladiv(const double a, const double b, const double c, const double d, double * p, double * q )
{
#ifdef F77_INT
#else
#endif

	f77_dladiv(&a, &b, &c, &d, p, q);

#ifdef F77_INT
#endif

}
