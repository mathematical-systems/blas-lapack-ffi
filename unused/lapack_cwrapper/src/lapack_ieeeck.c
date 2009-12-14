/*
 * lapack_ieeeck.c
 *
 *This program is a C interface to ieeeck.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

int lapack_ieeeck(const int ispec, const float zero, const float one )
{

	int output;

#ifdef F77_INT
	F77_INT F77_ispec=ispec;
#else
	#define F77_ispec ispec
#endif

	f77_ieeeck(&output, &F77_ispec, &zero, &one);

#ifdef F77_INT
#endif

return output;
}
