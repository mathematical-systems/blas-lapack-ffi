/*
 * lapack_cgebal.c
 *
 *This program is a C interface to cgebal.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgebal(const enum lapack_balance_type job, const int n, void * a, const int lda, int * ilo, int * ihi, float * scale, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_ilo[1];
	F77_INT F77_ihi[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
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

	f77_cgebal(&F77_job, &F77_n, a, &F77_lda, F77_ilo, F77_ihi, scale, F77_info);

#ifdef F77_INT
	ilo[0]=(int) F77_ilo[0];
	ihi[0]=(int) F77_ihi[0];
	info[0]=(int) F77_info[0];
#endif

}
