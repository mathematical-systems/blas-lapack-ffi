/*
 * lapack_cgbcon.c
 *
 *This program is a C interface to cgbcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgbcon(const enum lapack_norm_type norm, const int n, const int kl, const int ku, const void * ab, const int ldab, const int * ipiv, const float anorm, float * rcond, void * work, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kl=kl, F77_ku=ku, F77_ldab=ldab;
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
	#define F77_ldab ldab
	#define F77_ipiv ipiv
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_norm;
#else
	#define F77_norm C_norm
#endif

	char C_norm=' ';
	if (norm == lapack_one_norm) {
		 C_norm = '1';
	} else if (norm == lapack_inf_norm) {
		 C_norm = 'I';
	} else if (norm == lapack_max_norm) {
		 C_norm = 'M';
	} else if (norm == lapack_frobenius_norm) {
		 C_norm = 'F';
	}

#ifdef F77_CHAR
	F77_norm = C2F_CHAR(&C_norm)
#endif

	f77_cgbcon(&F77_norm, &F77_n, &F77_kl, &F77_ku, ab, &F77_ldab, F77_ipiv, &anorm, rcond, work, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
