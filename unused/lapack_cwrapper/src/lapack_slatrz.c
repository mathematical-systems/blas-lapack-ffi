/*
 * lapack_slatrz.c
 *
 *This program is a C interface to slatrz.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slatrz(const int m, const int n, const int l, float * a, const int lda, float * tau, float * work )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_l=l, F77_lda=lda;
#else
	#define F77_m m
	#define F77_n n
	#define F77_l l
	#define F77_lda lda
#endif

	f77_slatrz(&F77_m, &F77_n, &F77_l, a, &F77_lda, tau, work);

#ifdef F77_INT
#endif

}
