/*
 * lapack_dlasd0.c
 *
 *This program is a C interface to dlasd0.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd0(const int n, const int sqre, double * d, const double * e, double * u, const int ldu, double * vt, const int ldvt, const int smlsiz, int * iwork, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_sqre=sqre, F77_ldu=ldu, F77_ldvt=ldvt, F77_smlsiz=smlsiz;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_sqre sqre
	#define F77_ldu ldu
	#define F77_ldvt ldvt
	#define F77_smlsiz smlsiz
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_dlasd0(&F77_n, &F77_sqre, d, e, u, &F77_ldu, vt, &F77_ldvt, &F77_smlsiz, F77_iwork, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
