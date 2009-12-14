/*
 * lapack_slas2.c
 *
 *This program is a C interface to slas2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slas2(const float f, const float g, const float h, float * ssmin, float * ssmax )
{
#ifdef F77_INT
#else
#endif

	f77_slas2(&f, &g, &h, ssmin, ssmax);

#ifdef F77_INT
#endif

}
