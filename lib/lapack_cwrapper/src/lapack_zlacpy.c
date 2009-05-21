/*
 * lapack_zlacpy.c
 *
 *This program is a C interface to zlacpy.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlacpy(const enum lapack_uplo_type uplo, const int m, const int n, const void * a, const int lda, void * b, const int ldb )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_ldb=ldb;
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
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

	f77_zlacpy(&F77_uplo, &F77_m, &F77_n, a, &F77_lda, b, &F77_ldb);

#ifdef F77_INT
#endif

}
