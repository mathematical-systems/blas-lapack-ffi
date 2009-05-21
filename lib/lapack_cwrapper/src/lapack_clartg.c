/*
 * lapack_clartg.c
 *
 *This program is a C interface to clartg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clartg(const void * f, const void * g, float * cs, void * sn, void * r )
{
#ifdef F77_INT
#else
#endif

	f77_clartg(f, g, cs, sn, r);

#ifdef F77_INT
#endif

}
