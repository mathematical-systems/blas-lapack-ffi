/*
 * lapack_dgbtf2.c
 *
 *This program is a C interface to dgbtf2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgbtf2(const int m, const int n, const int kl, const int ku, double * ab, const int ldab, int * ipiv, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_kl=kl, F77_ku=ku, F77_ldab=ldab;
	int i_local;
	F77_INT F77_ipiv[m*n];
	for(i_local=0;i_local<m*n;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_kl kl
	#define F77_ku ku
	#define F77_ldab ldab
	#define F77_ipiv ipiv
	#define F77_info info
#endif

	f77_dgbtf2(&F77_m, &F77_n, &F77_kl, &F77_ku, ab, &F77_ldab, F77_ipiv, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<m*n;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
