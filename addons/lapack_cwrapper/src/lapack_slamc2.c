/*
 * lapack_slamc2.c
 *
 *This program is a C interface to slamc2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slamc2(int * beta, int * t, long int * rnd, float * eps, int * emin, float * rmin, int * emax, float * rmax )
{
#ifdef F77_INT
	int i_local;
	F77_INT F77_beta[1];
	F77_INT F77_t[1];
	F77_INT F77_emin[1];
	F77_INT F77_emax[1];
#else
	#define F77_beta beta
	#define F77_t t
	#define F77_emin emin
	#define F77_emax emax
#endif

#ifdef F77_LOG
;
	int j_local;
	F77_LOG F77_rnd[1];
#else
	#define F77_rnd rnd
#endif

	f77_slamc2(F77_beta, F77_t, F77_rnd, eps, F77_emin, rmin, F77_emax, rmax);

#ifdef F77_INT
	beta[0]=(int) F77_beta[0];
	t[0]=(int) F77_t[0];
	emin[0]=(int) F77_emin[0];
	emax[0]=(int) F77_emax[0];
#endif

#ifdef F77_LOG
	rnd[0]=(long int) F77_rnd[0];

#endif

}
