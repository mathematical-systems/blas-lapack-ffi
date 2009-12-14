/*
 * lapack_dlae2.c
 *
 *This program is a C interface to dlae2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlae2(const double a, const double b, const double c, double * rt1, double * rt2 )
{
#ifdef F77_INT
#else
#endif

	f77_dlae2(&a, &b, &c, rt1, rt2);

#ifdef F77_INT
#endif

}
