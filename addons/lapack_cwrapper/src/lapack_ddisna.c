/*
 * lapack_ddisna.c
 *
 *This program is a C interface to ddisna.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ddisna(const enum lapack_balance_type job, const int m, const int n, const double * d, double * sep, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_job;
#else
	#define F77_job C_job
#endif

	char C_job=' ';
	if (job == lapack_nothing) {
		 C_job = 'N';
	} else if (job == lapack_permute) {
		 C_job = 'P';
	} else if (job == lapack_scale) {
		 C_job = 'S';
	} else if (job == lapack_permute_scale) {
		 C_job = 'B';
	}

#ifdef F77_CHAR
	F77_job = C2F_CHAR(&C_job)
#endif

	f77_ddisna(&F77_job, &F77_m, &F77_n, d, sep, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
