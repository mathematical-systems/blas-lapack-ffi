/*
 * lapack_dlasv2.c
 *
 *This program is a C interface to dlasv2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasv2(const double f, const double g, const double h, double * ssmin, double * ssmax, double * snl, double * csl, double * snr, double * csr )
{
#ifdef F77_INT
#else
#endif

	f77_dlasv2(&f, &g, &h, ssmin, ssmax, snl, csl, snr, csr);

#ifdef F77_INT
#endif

}
