/*
 * lapack_zlahrd.c
 *
 *This program is a C interface to zlahrd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlahrd(const int n, const int k, const int nb, void * a, const int lda, void * tau, void * t, const int ldt, void * y, const int ldy )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_k=k, F77_nb=nb, F77_lda=lda, F77_ldt=ldt, F77_ldy=ldy;
#else
	#define F77_n n
	#define F77_k k
	#define F77_nb nb
	#define F77_lda lda
	#define F77_ldt ldt
	#define F77_ldy ldy
#endif

	f77_zlahrd(&F77_n, &F77_k, &F77_nb, a, &F77_lda, tau, t, &F77_ldt, y, &F77_ldy);

#ifdef F77_INT
#endif

}
