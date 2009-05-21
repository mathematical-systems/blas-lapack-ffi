/*
 * lapack_dlartg.c
 *
 *This program is a C interface to dlartg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlartg(const double f, const double g, double * cs, double * sn, double * r )
{
#ifdef F77_INT
#else
#endif

	f77_dlartg(&f, &g, cs, sn, r);

#ifdef F77_INT
#endif

}
