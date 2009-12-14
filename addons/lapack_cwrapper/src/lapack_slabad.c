/*
 * lapack_slabad.c
 *
 *This program is a C interface to slabad.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slabad(float * small, float * large )
{
#ifdef F77_INT
#else
#endif

	f77_slabad(small, large);

#ifdef F77_INT
#endif

}
