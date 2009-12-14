/*
 * lapack_dlas2.c
 *
 *This program is a C interface to dlas2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlas2(const double f, const double g, const double h, double * ssmin, double * ssmax )
{
#ifdef F77_INT
#else
#endif

	f77_dlas2(&f, &g, &h, ssmin, ssmax);

#ifdef F77_INT
#endif

}
