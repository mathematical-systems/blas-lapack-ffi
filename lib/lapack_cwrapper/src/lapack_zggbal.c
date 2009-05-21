/*
 * lapack_zggbal.c
 *
 *This program is a C interface to zggbal.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zggbal(const enum lapack_balance_type job, const int n, void * a, const int lda, void * b, const int ldb, int * ilo, int * ihi, double * lscale, double * rscale, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb;
	int i_local;
	F77_INT F77_ilo[1];
	F77_INT F77_ihi[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ilo ilo
	#define F77_ihi ihi
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

	f77_zggbal(&F77_job, &F77_n, a, &F77_lda, b, &F77_ldb, F77_ilo, F77_ihi, lscale, rscale, work, F77_info);

#ifdef F77_INT
	ilo[0]=(int) F77_ilo[0];
	ihi[0]=(int) F77_ihi[0];
	info[0]=(int) F77_info[0];
#endif

}
