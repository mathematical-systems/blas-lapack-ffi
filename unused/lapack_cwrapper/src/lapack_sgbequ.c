/*
 * lapack_sgbequ.c
 *
 *This program is a C interface to sgbequ.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sgbequ(const int m, const int n, const int kl, const int ku, const float * ab, const int ldab, float * r, float * c, float * rowcnd, float * colcnd, float * amax, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_kl=kl, F77_ku=ku, F77_ldab=ldab;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_kl kl
	#define F77_ku ku
	#define F77_ldab ldab
	#define F77_info info
#endif

	f77_sgbequ(&F77_m, &F77_n, &F77_kl, &F77_ku, ab, &F77_ldab, r, c, rowcnd, colcnd, amax, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
