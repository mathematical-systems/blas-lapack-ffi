/*
 * lapack_cpotrs.c
 *
 *This program is a C interface to cpotrs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cpotrs(const enum lapack_uplo_type uplo, const int n, const int nrhs, const void * a, const int lda, void * b, const int ldb, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_lda=lda, F77_ldb=ldb;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_lda lda
	#define F77_ldb ldb
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

	f77_cpotrs(&F77_uplo, &F77_n, &F77_nrhs, a, &F77_lda, b, &F77_ldb, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
