/*
 * lapack_slarrf.c
 *
 *This program is a C interface to slarrf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slarrf(const int n, const float * d, const float * l, const float * ld, const float * lld, const int ifirst, const int ilast, float * w, const float sigma, float * dplus, float * lplus, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ifirst=ifirst, F77_ilast=ilast;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ifirst ifirst
	#define F77_ilast ilast
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_slarrf(&F77_n, d, l, ld, lld, &F77_ifirst, &F77_ilast, w, &sigma, dplus, lplus, work, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
