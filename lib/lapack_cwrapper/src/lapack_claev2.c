/*
 * lapack_claev2.c
 *
 *This program is a C interface to claev2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claev2(const void * a, const void * b, const void * c, float * rt1, float * rt2, float * cs1, void * sn1 )
{
#ifdef F77_INT
#else
#endif

	f77_claev2(a, b, c, rt1, rt2, cs1, sn1);

#ifdef F77_INT
#endif

}
