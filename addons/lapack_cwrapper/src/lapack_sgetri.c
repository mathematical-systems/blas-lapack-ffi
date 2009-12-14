/*
 * lapack_sgetri.c
 *
 *This program is a C interface to sgetri.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sgetri(const int n, float * a, const int lda, const int * ipiv, float * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_lwork=lwork;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ipiv ipiv
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_sgetri(&F77_n, a, &F77_lda, F77_ipiv, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
