/*
 * lapack_dlaev2.c
 *
 *This program is a C interface to dlaev2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaev2(const double a, const double b, const double c, double * rt1, double * rt2, double * cs1, double * sn1 )
{
#ifdef F77_INT
#else
#endif

	f77_dlaev2(&a, &b, &c, rt1, rt2, cs1, sn1);

#ifdef F77_INT
#endif

}
