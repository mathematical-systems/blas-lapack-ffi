/*
 * lapack_slamc5.c
 *
 *This program is a C interface to slamc5.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slamc5(const int beta, const int p, const int emin, const long int ieee, int * emax, float * rmax )
{
#ifdef F77_INT
	F77_INT F77_beta=beta, F77_p=p, F77_emin=emin;
	int i_local;
	F77_INT F77_emax[1];
#else
	#define F77_beta beta
	#define F77_p p
	#define F77_emin emin
	#define F77_emax emax
#endif

#ifdef F77_LOG
	F77_LOG F77_ieee=ieee;
#else
	#define F77_ieee ieee
#endif

	f77_slamc5(&F77_beta, &F77_p, &F77_emin, &F77_ieee, F77_emax, rmax);

#ifdef F77_INT
	emax[0]=(int) F77_emax[0];
#endif

#ifdef F77_LOG
#endif

}
