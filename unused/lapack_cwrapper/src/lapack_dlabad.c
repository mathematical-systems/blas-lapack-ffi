/*
 * lapack_dlabad.c
 *
 *This program is a C interface to dlabad.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlabad(double * small, double * large )
{
#ifdef F77_INT
#else
#endif

	f77_dlabad(small, large);

#ifdef F77_INT
#endif

}
