/*
 * lapack_zlartg.c
 *
 *This program is a C interface to zlartg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlartg(const void * f, const void * g, double * cs, void * sn, void * r )
{
#ifdef F77_INT
#else
#endif

	f77_zlartg(f, g, cs, sn, r);

#ifdef F77_INT
#endif

}
