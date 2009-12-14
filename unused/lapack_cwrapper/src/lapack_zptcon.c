/*
 * lapack_zptcon.c
 *
 *This program is a C interface to zptcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zptcon(const int n, const double * d, const void * e, const double anorm, double * rcond, double * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_info info
#endif

	f77_zptcon(&F77_n, d, e, &anorm, rcond, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
