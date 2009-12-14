/*
 * lapack_slasv2.c
 *
 *This program is a C interface to slasv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasv2(const float f, const float g, const float h, float * ssmin, float * ssmax, float * snl, float * csl, float * snr, float * csr )
{
#ifdef F77_INT
#else
#endif

	f77_slasv2(&f, &g, &h, ssmin, ssmax, snl, csl, snr, csr);

#ifdef F77_INT
#endif

}
