/*
 * lapack_dsptri.c
 *
 *This program is a C interface to dsptri.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dsptri(const enum lapack_uplo_type uplo, const int n, double * ap, const int * ipiv, double * work, int * info )
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
	F77_CHAR F77_uplo;
#else
	#define F77_uplo C_uplo
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_dsptri(&F77_uplo, &F77_n, ap, F77_ipiv, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
