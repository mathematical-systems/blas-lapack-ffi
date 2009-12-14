/*
 * lapack_sladiv.c
 *
 *This program is a C interface to sladiv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sladiv(const float a, const float b, const float c, const float d, float * p, float * q )
{
#ifdef F77_INT
#else
#endif

	f77_sladiv(&a, &b, &c, &d, p, q);

#ifdef F77_INT
#endif

}
