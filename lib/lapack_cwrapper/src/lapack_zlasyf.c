/*
 * lapack_zlasyf.c
 *
 *This program is a C interface to zlasyf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlasyf(const enum lapack_uplo_type uplo, const int n, const int nb, int * kb, void * a, const int lda, int * ipiv, void * w, const int ldw, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nb=nb, F77_lda=lda, F77_ldw=ldw;
	int i_local;
	F77_INT F77_kb[1];
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nb nb
	#define F77_kb kb
	#define F77_lda lda
	#define F77_ipiv ipiv
	#define F77_ldw ldw
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

	f77_zlasyf(&F77_uplo, &F77_n, &F77_nb, F77_kb, a, &F77_lda, F77_ipiv, w, &F77_ldw, F77_info);

#ifdef F77_INT
	kb[0]=(int) F77_kb[0];
	for(i_local=0;i_local<n*1;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
