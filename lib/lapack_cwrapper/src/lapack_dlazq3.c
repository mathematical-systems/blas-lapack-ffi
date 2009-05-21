/*
 * lapack_dlazq3.c
 *
 *This program is a C interface to dlazq3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlazq3(const int i0, const int n0, const double * z, const int pp, double * dmin, double * sigma, double * desig, const double qmax, int * nfail, int * iter, int * ndiv, const long int ieee, int * ttype, float * dmin1, float * dmin2, float * dn, float * dn1, float * dn2, float * tau )
{
#ifdef F77_INT
	F77_INT F77_i0=i0, F77_n0=n0, F77_pp=pp;
	int i_local;
	F77_INT F77_nfail[1];
	F77_INT F77_iter[1];
	F77_INT F77_ndiv[1];
	F77_INT F77_ttype[1];
#else
	#define F77_i0 i0
	#define F77_n0 n0
	#define F77_pp pp
	#define F77_nfail nfail
	#define F77_iter iter
	#define F77_ndiv ndiv
	#define F77_ttype ttype
#endif

#ifdef F77_LOG
	F77_LOG F77_ieee=ieee;
#else
	#define F77_ieee ieee
#endif

	f77_dlazq3(&F77_i0, &F77_n0, z, &F77_pp, dmin, sigma, desig, &qmax, F77_nfail, F77_iter, F77_ndiv, &F77_ieee, F77_ttype, dmin1, dmin2, dn, dn1, dn2, tau);

#ifdef F77_INT
	nfail[0]=(int) F77_nfail[0];
	iter[0]=(int) F77_iter[0];
	ndiv[0]=(int) F77_ndiv[0];
	ttype[0]=(int) F77_ttype[0];
#endif

#ifdef F77_LOG
#endif

}
