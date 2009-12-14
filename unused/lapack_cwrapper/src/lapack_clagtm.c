/*
 * lapack_clagtm.c
 *
 *This program is a C interface to clagtm.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clagtm(const enum lapack_trans_type trans, const int n, const int nrhs, const float alpha, const void * dl, const void * d, const void * du, const void * x, const int ldx, const float beta, void * b, const int ldb )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldx=ldx, F77_ldb=ldb;
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldx ldx
	#define F77_ldb ldb
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

	f77_clagtm(&F77_trans, &F77_n, &F77_nrhs, &alpha, dl, d, du, x, &F77_ldx, &beta, b, &F77_ldb);

#ifdef F77_INT
#endif

}
