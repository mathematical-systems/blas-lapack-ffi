/*
 * lapack_slabrd.c
 *
 *This program is a C interface to slabrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slabrd(const int m, const int n, const int nb, float * a, const int lda, float * d, float * e, float * tauq, float * taup, float * x, const int ldx, float * y, const int ldy )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_nb=nb, F77_lda=lda, F77_ldx=ldx, F77_ldy=ldy;
#else
	#define F77_m m
	#define F77_n n
	#define F77_nb nb
	#define F77_lda lda
	#define F77_ldx ldx
	#define F77_ldy ldy
#endif

	f77_slabrd(&F77_m, &F77_n, &F77_nb, a, &F77_lda, d, e, tauq, taup, x, &F77_ldx, y, &F77_ldy);

#ifdef F77_INT
#endif

}
