/*
 * lapack_csymv.c
 *
 *This program is a C interface to csymv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_csymv(const enum lapack_uplo_type uplo, const int n, const void * alpha, const void * a, const int lda, const void * x, const int incx, const void * beta, void * y, const int incy )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_incx=incx, F77_incy=incy;
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_incx incx
	#define F77_incy incy
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

	f77_csymv(&F77_uplo, &F77_n, alpha, a, &F77_lda, x, &F77_incx, beta, y, &F77_incy);

#ifdef F77_INT
#endif

}
