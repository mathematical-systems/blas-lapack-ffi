/*
 * lapack_cladiv.c
 *
 *This program is a C interface to cladiv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void* lapack_cladiv(const void * x, const void * y )
{

	float *output;
	output=malloc(2*sizeof(float));

#ifdef F77_INT
#else
#endif

	f77_cladiv(&output, x, y);

#ifdef F77_INT
#endif

return output;
}
