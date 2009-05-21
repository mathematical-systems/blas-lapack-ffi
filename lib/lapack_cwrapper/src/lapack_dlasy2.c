/*
 * lapack_dlasy2.c
 *
 *This program is a C interface to dlasy2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasy2(const long int ltranl, const long int ltranr, const int isgn, const int n1, const int n2, const double * tl, const int ldtl, const double * tr, const int ldtr, const double * b, const int ldb, double * scale, double * x, const int ldx, double * xnorm, int * info )
{
#ifdef F77_INT
	F77_INT F77_isgn=isgn, F77_n1=n1, F77_n2=n2, F77_ldtl=ldtl, F77_ldtr=ldtr, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_isgn isgn
	#define F77_n1 n1
	#define F77_n2 n2
	#define F77_ldtl ldtl
	#define F77_ldtr ldtr
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_ltranl=ltranl, F77_ltranr=ltranr;
#else
	#define F77_ltranl ltranl
	#define F77_ltranr ltranr
#endif

	f77_dlasy2(&F77_ltranl, &F77_ltranr, &F77_isgn, &F77_n1, &F77_n2, tl, &F77_ldtl, tr, &F77_ldtr, b, &F77_ldb, scale, x, &F77_ldx, xnorm, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
