/*
 * lapack_zlatdf.c
 *
 *This program is a C interface to zlatdf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlatdf(const int ijob, const int n, const double * z, const int ldz, double * rhs, double * rdsum, double * rdscal, const int * ipiv, const int * jpiv )
{
#ifdef F77_INT
	F77_INT F77_ijob=ijob, F77_n=n, F77_ldz=ldz;
	int i_local;
	F77_INT F77_ipiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_jpiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_jpiv[i_local]=(F77_INT) jpiv[i_local];
	}
#else
	#define F77_ijob ijob
	#define F77_n n
	#define F77_ldz ldz
	#define F77_ipiv ipiv
	#define F77_jpiv jpiv
#endif

	f77_zlatdf(&F77_ijob, &F77_n, z, &F77_ldz, rhs, rdsum, rdscal, F77_ipiv, F77_jpiv);

#ifdef F77_INT
#endif

}
