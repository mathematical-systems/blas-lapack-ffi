/*
 * lapack_zlaqge.c
 *
 *This program is a C interface to zlaqge.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlaqge(const int m, const int n, void * a, const int lda, const double * r, const double * c, const double rowcnd, const double colcnd, const double amax, char * equed )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda;
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
#endif

#ifdef F77_CHAR
	F77_CHAR F77_equed = C2F_STR(equed, strlen(equed)) ;
#else
	#define F77_equed equed
#endif

	f77_zlaqge(&F77_m, &F77_n, a, &F77_lda, r, c, &rowcnd, &colcnd, &amax, equed);

#ifdef F77_INT
#endif

}
