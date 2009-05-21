/*
 * lapack_slapy3.c
 *
 *This program is a C interface to slapy3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_slapy3(const float x, const float y, const float z )
{

	float output;

#ifdef F77_INT
#else
#endif

	f77_slapy3(&output, &x, &y, &z);

#ifdef F77_INT
#endif

return output;
}
