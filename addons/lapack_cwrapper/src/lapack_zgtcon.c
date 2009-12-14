/*
 * lapack_zgtcon.c
 *
 *This program is a C interface to zgtcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgtcon(const enum lapack_norm_type norm, const int n, const void * dl, const void * d, const void * du, const void * du2, const int * ipiv, const double anorm, double * rcond, void * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
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

	f77_zgtcon(&F77_norm, &F77_n, dl, d, du, du2, F77_ipiv, &anorm, rcond, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
