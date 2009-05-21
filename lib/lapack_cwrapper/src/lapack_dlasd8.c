/*
 * lapack_dlasd8.c
 *
 *This program is a C interface to dlasd8.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd8(const int icompq, const int k, double * d, const double * z, double * vf, double * vl, double * difl, double * difr, const int lddifr, const double * dsigma, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_k=k, F77_lddifr=lddifr;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_k k
	#define F77_lddifr lddifr
	#define F77_info info
#endif

	f77_dlasd8(&F77_icompq, &F77_k, d, z, vf, vl, difl, difr, &F77_lddifr, dsigma, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
