/*
 * lapack_dlazq4.c
 *
 *This program is a C interface to dlazq4.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlazq4(const int i0, const int n0, const double * z, const int pp, const int n0in, const double dmin, const double dmin1, const double dmin2, const double dn, const double dn1, const double dn2, double * tau, int * ttype, double * g )
{
#ifdef F77_INT
	F77_INT F77_i0=i0, F77_n0=n0, F77_pp=pp, F77_n0in=n0in;
	int i_local;
	F77_INT F77_ttype[1];
#else
	#define F77_i0 i0
	#define F77_n0 n0
	#define F77_pp pp
	#define F77_n0in n0in
	#define F77_ttype ttype
#endif

	f77_dlazq4(&F77_i0, &F77_n0, z, &F77_pp, &F77_n0in, &dmin, &dmin1, &dmin2, &dn, &dn1, &dn2, tau, F77_ttype, g);

#ifdef F77_INT
	ttype[0]=(int) F77_ttype[0];
#endif

}
