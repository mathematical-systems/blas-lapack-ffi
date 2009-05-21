/*
 * lapack_dsecnd.c
 *
 *This program is a C interface to dsecnd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

double lapack_dsecnd( )
{

	double output;

#ifdef F77_INT
#else
#endif

	f77_dsecnd(&output);

#ifdef F77_INT
#endif

return output;
}
