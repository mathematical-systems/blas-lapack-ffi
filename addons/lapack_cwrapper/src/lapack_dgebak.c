/*
 * lapack_dgebak.c
 *
 *This program is a C interface to dgebak.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dgebak(const enum lapack_balance_type job, const enum lapack_side_type side, const int n, const int ilo, const int ihi, const double * scale, const int m, double * v, const int ldv, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ilo=ilo, F77_ihi=ihi, F77_m=m, F77_ldv=ldv;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ilo ilo
	#define F77_ihi ihi
	#define F77_m m
	#define F77_ldv ldv
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_job, F77_side;
#else
	#define F77_job C_job
	#define F77_side C_side
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

	char C_side=' ';
	if (side == lapack_left_side) {
		 C_side = 'L';
	} else if (side == lapack_right_side) {
		 C_side = 'R';
	}

#ifdef F77_CHAR
	F77_job = C2F_CHAR(&C_job)
	F77_side = C2F_CHAR(&C_side)
#endif

	f77_dgebak(&F77_job, &F77_side, &F77_n, &F77_ilo, &F77_ihi, scale, &F77_m, v, &F77_ldv, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
