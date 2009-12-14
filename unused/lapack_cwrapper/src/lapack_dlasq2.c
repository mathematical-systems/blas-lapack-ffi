/*
 * lapack_dlasq2.c
 *
 *This program is a C interface to dlasq2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasq2(const int n, double * z, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_info info
#endif

	f77_dlasq2(&F77_n, z, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
