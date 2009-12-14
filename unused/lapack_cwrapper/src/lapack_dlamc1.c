/*
 * lapack_dlamc1.c
 *
 *This program is a C interface to dlamc1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlamc1(int * beta, int * t, long int * rnd, long int * ieee1 )
{
#ifdef F77_INT
	int i_local;
	F77_INT F77_beta[1];
	F77_INT F77_t[1];
#else
	#define F77_beta beta
	#define F77_t t
#endif

#ifdef F77_LOG
;
	int j_local;
	F77_LOG F77_rnd[1];
	F77_LOG F77_ieee1[1];
#else
	#define F77_rnd rnd
	#define F77_ieee1 ieee1
#endif

	f77_dlamc1(F77_beta, F77_t, F77_rnd, F77_ieee1);

#ifdef F77_INT
	beta[0]=(int) F77_beta[0];
	t[0]=(int) F77_t[0];
#endif

#ifdef F77_LOG
	rnd[0]=(long int) F77_rnd[0];

	ieee1[0]=(long int) F77_ieee1[0];

#endif

}
