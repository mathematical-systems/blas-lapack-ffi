/*
 * lapack_claqgb.c
 *
 *This program is a C interface to claqgb.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claqgb(const int m, const int n, const int kl, const int ku, void * ab, const int ldab, const float * r, const float * c, const float rowcnd, const float colcnd, const float amax, char * equed )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_kl=kl, F77_ku=ku, F77_ldab=ldab;
#else
	#define F77_m m
	#define F77_n n
	#define F77_kl kl
	#define F77_ku ku
	#define F77_ldab ldab
#endif

#ifdef F77_CHAR
	F77_CHAR F77_equed = C2F_STR(equed, strlen(equed)) ;
#else
	#define F77_equed equed
#endif

	f77_claqgb(&F77_m, &F77_n, &F77_kl, &F77_ku, ab, &F77_ldab, r, c, &rowcnd, &colcnd, &amax, equed);

#ifdef F77_INT
#endif

}
