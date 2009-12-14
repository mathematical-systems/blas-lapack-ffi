/*
 * lapack_second.c
 *
 *This program is a C interface to second.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

float lapack_second( )
{

	float output;

#ifdef F77_INT
#else
#endif

	f77_second(&output);

#ifdef F77_INT
#endif

return output;
}
