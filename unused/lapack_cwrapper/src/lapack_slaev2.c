/*
 * lapack_slaev2.c
 *
 *This program is a C interface to slaev2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaev2(const float a, const float b, const float c, float * rt1, float * rt2, float * cs1, float * sn1 )
{
#ifdef F77_INT
#else
#endif

	f77_slaev2(&a, &b, &c, rt1, rt2, cs1, sn1);

#ifdef F77_INT
#endif

}
