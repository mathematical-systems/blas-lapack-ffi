/*
 * lapack_dlamc4.c
 *
 *This program is a C interface to dlamc4.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlamc4(int * emin, const double start, const int base )
{
#ifdef F77_INT
	F77_INT F77_base=base;
	int i_local;
	F77_INT F77_emin[1];
#else
	#define F77_emin emin
	#define F77_base base
#endif

	f77_dlamc4(F77_emin, &start, &F77_base);

#ifdef F77_INT
	emin[0]=(int) F77_emin[0];
#endif

}
