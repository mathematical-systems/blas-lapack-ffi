/*
 * lapack_slamc3.c
 *
 *This program is a C interface to slamc3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_slamc3(const float a, const float b )
{

	float output;

#ifdef F77_INT
#else
#endif

	f77_slamc3(&output, &a, &b);

#ifdef F77_INT
#endif

return output;
}
