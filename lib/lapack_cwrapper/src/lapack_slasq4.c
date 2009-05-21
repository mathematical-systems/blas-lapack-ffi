/*
 * lapack_slasq4.c
 *
 *This program is a C interface to slasq4.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasq4(const int i0, const int n0, const float * z, const int pp, const int n0in, const float dmin, const float dmin1, const float dmin2, const float dn, const float dn1, const float dn2, float * tau, int * ttype )
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

	f77_slasq4(&F77_i0, &F77_n0, z, &F77_pp, &F77_n0in, &dmin, &dmin1, &dmin2, &dn, &dn1, &dn2, tau, F77_ttype);

#ifdef F77_INT
	ttype[0]=(int) F77_ttype[0];
#endif

}
