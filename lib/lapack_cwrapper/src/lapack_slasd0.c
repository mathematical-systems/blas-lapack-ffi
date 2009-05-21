/*
 * lapack_slasd0.c
 *
 *This program is a C interface to slasd0.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasd0(const int n, const int sqre, float * d, const float * e, float * u, const int ldu, float * vt, const int ldvt, const int smlsiz, int * iwork, float * work, int * info )
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

	f77_slasd0(&F77_n, &F77_sqre, d, e, u, &F77_ldu, vt, &F77_ldvt, &F77_smlsiz, F77_iwork, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
