/*
 * lapack_slatrd.c
 *
 *This program is a C interface to slatrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slatrd(const enum lapack_uplo_type uplo, const int n, const int nb, float * a, const int lda, float * e, float * tau, float * w, const int ldw )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nb=nb, F77_lda=lda, F77_ldw=ldw;
#else
	#define F77_n n
	#define F77_nb nb
	#define F77_lda lda
	#define F77_ldw ldw
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

	f77_slatrd(&F77_uplo, &F77_n, &F77_nb, a, &F77_lda, e, tau, w, &F77_ldw);

#ifdef F77_INT
#endif

}
