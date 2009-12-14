/*
 * lapack_zgetc2.c
 *
 *This program is a C interface to zgetc2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgetc2(const int n, void * a, const int lda, int * ipiv, int * jpiv, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_ipiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_jpiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_jpiv[i_local]=(F77_INT) jpiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ipiv ipiv
	#define F77_jpiv jpiv
	#define F77_info info
#endif

	f77_zgetc2(&F77_n, a, &F77_lda, F77_ipiv, F77_jpiv, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*.;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	for(i_local=0;i_local<n*.;i_local++) {
		jpiv[i_local]=(int) F77_jpiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
