/*
 * lapack_slanv2.c
 *
 *This program is a C interface to slanv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slanv2(float * a, float * b, float * c, float * d, float * rt1r, float * rt1i, float * rt2r, float * rt2i, float * cs, float * sn )
{
#ifdef F77_INT
#else
#endif

	f77_slanv2(a, b, c, d, rt1r, rt1i, rt2r, rt2i, cs, sn);

#ifdef F77_INT
#endif

}
