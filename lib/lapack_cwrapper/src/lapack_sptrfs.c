/*
 * lapack_sptrfs.c
 *
 *This program is a C interface to sptrfs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sptrfs(const int n, const int nrhs, const float * d, const float * e, const float * df, const float * ef, const float * b, const int ldb, float * x, const int ldx, float * ferr, float * berr, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb, F77_ldx=ldx;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_info info
#endif

	f77_sptrfs(&F77_n, &F77_nrhs, d, e, df, ef, b, &F77_ldb, x, &F77_ldx, ferr, berr, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
