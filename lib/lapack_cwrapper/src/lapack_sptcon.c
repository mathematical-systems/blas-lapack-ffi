/*
 * lapack_sptcon.c
 *
 *This program is a C interface to sptcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sptcon(const int n, const float * d, const float * e, const float anorm, float * rcond, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_info info
#endif

	f77_sptcon(&F77_n, d, e, &anorm, rcond, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
