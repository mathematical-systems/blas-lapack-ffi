/*
 * lapack_zgeqrf.c
 *
 *This program is a C interface to zgeqrf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgeqrf(const int m, const int n, void * a, const int lda, void * tau, void * work, const int lwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_zgeqrf(&F77_m, &F77_n, a, &F77_lda, tau, work, &F77_lwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
