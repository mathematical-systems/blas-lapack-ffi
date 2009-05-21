/*
 * lapack_slapy2.c
 *
 *This program is a C interface to slapy2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_slapy2(const float x, const float y )
{

	float output;

#ifdef F77_INT
#else
#endif

	f77_slapy2(&output, &x, &y);

#ifdef F77_INT
#endif

return output;
}
