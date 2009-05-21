/*
 * lapack_zgbtrs.c
 *
 *This program is a C interface to zgbtrs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgbtrs(const enum lapack_trans_type trans, const int n, const int kl, const int ku, const int nrhs, const void * ab, const int ldab, const int * ipiv, void * b, const int ldb, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kl=kl, F77_ku=ku, F77_nrhs=nrhs, F77_ldab=ldab, F77_ldb=ldb;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_kl kl
	#define F77_ku ku
	#define F77_nrhs nrhs
	#define F77_ldab ldab
	#define F77_ipiv ipiv
	#define F77_ldb ldb
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_trans;
#else
	#define F77_trans C_trans
#endif

	char C_trans=' ';
	if (trans == lapack_no_trans) {
		 C_trans = 'N';
	} else if (trans == lapack_trans) {
		 C_trans = 'T';
	} else if (trans == lapack_conj_trans) {
		 C_trans = 'C';
	}

#ifdef F77_CHAR
	F77_trans = C2F_CHAR(&C_trans)
#endif

	f77_zgbtrs(&F77_trans, &F77_n, &F77_kl, &F77_ku, &F77_nrhs, ab, &F77_ldab, F77_ipiv, b, &F77_ldb, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
