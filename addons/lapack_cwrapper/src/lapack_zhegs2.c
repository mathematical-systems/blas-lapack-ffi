/*
 * lapack_zhegs2.c
 *
 *This program is a C interface to zhegs2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zhegs2(const int itype, const enum lapack_uplo_type uplo, const int n, void * a, const int lda, const void * b, const int ldb, int * info )
{
#ifdef F77_INT
	F77_INT F77_itype=itype, F77_n=n, F77_lda=lda, F77_ldb=ldb;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_itype itype
	#define F77_n n
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

	f77_zhegs2(&F77_itype, &F77_uplo, &F77_n, a, &F77_lda, b, &F77_ldb, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
