/*
 * lapack_slartg.c
 *
 *This program is a C interface to slartg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slartg(const float f, const float g, float * cs, float * sn, float * r )
{
#ifdef F77_INT
#else
#endif

	f77_slartg(&f, &g, cs, sn, r);

#ifdef F77_INT
#endif

}
