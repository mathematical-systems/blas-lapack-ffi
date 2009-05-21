/*
 * lapack_dlanv2.c
 *
 *This program is a C interface to dlanv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlanv2(double * a, double * b, double * c, double * d, double * rt1r, double * rt1i, double * rt2r, double * rt2i, double * cs, double * sn )
{
#ifdef F77_INT
#else
#endif

	f77_dlanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn);

#ifdef F77_INT
#endif

}
