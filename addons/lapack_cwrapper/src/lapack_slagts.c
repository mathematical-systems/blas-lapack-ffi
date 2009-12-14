/*
 * lapack_slagts.c
 *
 *This program is a C interface to slagts.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slagts(const int job, const int n, const float * a, const float * b, const float * c, const float * d, const int * in, float * y, float * tol, int * info )
{
#ifdef F77_INT
	F77_INT F77_job=job, F77_n=n;
	int i_local;
	F77_INT F77_in[1];
	F77_in[0]=(F77_INT) in[0];
	F77_INT F77_info[1];
#else
	#define F77_job job
	#define F77_n n
	#define F77_in in
	#define F77_info info
#endif

	f77_slagts(&F77_job, &F77_n, a, b, c, d, F77_in, y, tol, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
