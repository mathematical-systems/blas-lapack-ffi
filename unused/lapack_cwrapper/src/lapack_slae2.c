/*
 * lapack_slae2.c
 *
 *This program is a C interface to slae2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slae2(const float a, const float b, const float c, float * rt1, float * rt2 )
{
#ifdef F77_INT
#else
#endif

	f77_slae2(&a, &b, &c, rt1, rt2);

#ifdef F77_INT
#endif

}
