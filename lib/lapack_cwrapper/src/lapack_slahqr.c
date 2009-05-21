/*
 * lapack_slahqr.c
 *
 *This program is a C interface to slahqr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slahqr(const long int wantt, const long int wantz, const int n, const int ilo, const int ihi, float * h, const int ldh, float * wr, float * wi, const int iloz, const int ihiz, float * z, const int ldz, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_ldh=ldh, F77_iloz=iloz, F77_ihiz=ihiz, F77_ldz=ldz;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_ldh ldh
	#define F77_iloz iloz
	#define F77_ihiz ihiz
	#define F77_ldz ldz
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_wantt=wantt, F77_wantz=wantz;
#else
	#define F77_wantt wantt
	#define F77_wantz wantz
#endif

	f77_slahqr(&F77_wantt, &F77_wantz, &F77_n, &F77_ilo, &F77_ihi, h, &F77_ldh, wr, wi, &F77_iloz, &F77_ihiz, z, &F77_ldz, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
